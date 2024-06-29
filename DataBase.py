import csv
import os.path
import random
import secrets
import sqlite3
import string
import threading
import time
from configparser import ConfigParser
import pandas as pd
from API import *


class UserManager:
    def __init__(self, db_name='users.db'):
        """
        Initializes a new instance of the UserManager class.

        Parameters:
            db_name (str): The name of the database file. Default is 'users.db'.

        Returns:
            None
        """
        self.db_name = db_name
        self.conn = None
        self.cursor = None

    def connect(self):
        """Connects to the SQLite database."""
        if self.conn is None:
            self.conn = sqlite3.connect(self.db_name)
            self.cursor = self.conn.cursor()

    def disconnect(self):
        """Closes the database connection."""
        if self.conn:
            self.conn.close()
            self.conn = None
            self.cursor = None

    @staticmethod
    def create_db_initial():
        """
        Creates an initial SQLite database with a table named 'Users' containing columns for 'id', 'username', 'password', and 'titles_to_exclude'.

        This function first connects to the 'users.db' SQLite database file, creating it if it does not already exist. It then creates a cursor object to execute SQL commands.

        If the 'Users' table already exists, it is dropped to start with a clean slate.

        The 'Users' table is then created with the specified columns and their respective data types.

        After the table is created, the transaction is committed to save the changes. Finally, the connection to the database is closed.

        Returns:
            None
        """
        # Connect to the SQLite database
        # This will create the database file if it doesn't already exist
        conn = sqlite3.connect('users.db')

        # Create a cursor object using the cursor() method
        cursor = conn.cursor()

        # Drop the table if it already exists to start fresh
        cursor.execute('''DROP TABLE IF EXISTS Users;''')

        # Create a table named Users with id, username, password, and titles_to_exclude columns
        cursor.execute('''CREATE TABLE Users (
                           id INTEGER PRIMARY KEY,
                           username TEXT NOT NULL UNIQUE,
                           password TEXT NOT NULL,
                           titles_to_exclude TEXT);''')

        # Commit the transaction
        conn.commit()

        # Close the connection
        conn.close()

    def verify_password(self, username, password):
        """
        Verifies the password for a given username by comparing it with the stored password in the database.
        """
        self.connect()
        self.cursor.execute("SELECT password FROM Users WHERE username=?", (username,))
        result = self.cursor.fetchone()
        self.disconnect()

        if result:
            stored_password = result[0]
            if password == stored_password:
                return True
        return False

    def create_db(self, username):
        """
        Add a user to the database with a random password.
        """
        self.connect()
        self.cursor.execute("SELECT * FROM users WHERE username=?", (username,))
        existing_user = self.cursor.fetchone()
        self.disconnect()

        if existing_user:
            return 409

        alphabet = string.ascii_letters + string.digits
        password_new = ''.join(secrets.choice(alphabet) for _ in range(12))

        self.connect()
        self.cursor.execute("INSERT INTO users (username, password) VALUES (?,?)", (username, password_new))
        self.conn.commit()
        self.disconnect()

        password_str = "Password is " + password_new

        um.add_exclusion_db(username, exclusion_titles, password_new, "CDB")

        return password_str

    def remove(self, username, password):
        """
        Removes all data associated with the specified username from the database.
        """
        if self.verify_password(username, password):
            self.connect()
            self.cursor.execute('''DELETE FROM Users WHERE username=?''', (username,))
            self.conn.commit()
            self.disconnect()
            return f"Successfully removed data for user {username}."
        else:
            return 401

    def add_exclusion_db_main(self, name, titles, password):
        """
        Adds titles to the exclusions list for the specified user.
        """
        if self.verify_password(name, password):
            self.connect()
            try:
                self.cursor.execute('''SELECT titles_to_exclude FROM Users WHERE username=?''', (name,))
                result = self.cursor.fetchone()

                # Check if the result is None or NULL and replace with a placeholder
                if result is None or result[0] is None:
                    initial_titles = "PLACEHOLDER"  # Placeholder for empty titles_to_exclude
                else:
                    initial_titles = result[0]

                current_titles = initial_titles.strip()

                # Convert current_titles and titles to sets for comparison
                current_titles_set = set(current_titles.split(','))
                titles_set = set(titles)

                # Calculate the difference between the two sets
                new_titles_set = titles_set - current_titles_set

                # If there are new titles to add, proceed with the update
                if new_titles_set:
                    updated_titles = ','.join(list(new_titles_set))  # Join the new titles with a comma and space
                    self.cursor.execute(
                        '''UPDATE Users SET titles_to_exclude = COALESCE(titles_to_exclude ||?, '') WHERE username =?''',
                        (updated_titles, name))
                    self.conn.commit()
                    return f"Successfully updated titles for user {name}."
                else:
                    return 400

            except Exception:
                return 500
        else:
            return 401

    @staticmethod
    def add_exclusion_db(name, titles, password, special=None):
        """
        Adds titles to the exclusions list for the specified user.

        Args:
            name (str): The username of the user.
            titles (str): The titles to add to the exclusions list, separated by commas.
            password (str): The password of the user.
            special (Optional[str]): An optional parameter to indicate a special action.

        Returns:
            Union[int, str]: The value indicating the success or failure of the operation.
                - If the operation is successful, a string indicating the success message.
                - If the operation fails, an integer indicating the error code.

        Raises:
            None.

        Notes:
            - This function calls the `add_exclusion_db_main` method of the `UserManager` class to perform the actual operation.
            - If the `special` parameter is not provided or is `None`, it calls the `add_exclusion_db_main` method with a comma and the password as arguments.

        """
        value = um.add_exclusion_db_main(name, titles, password)
        if not special:
            um.add_exclusion_db_main(name, ",", password)
        return value

    def get_excluded_titles(self, username):
        """
        Retrieves the titles to be excluded for a specified username from the database.

        Parameters:
            username (str): The username for which the excluded titles are requested.

        Returns:
            list: A list of titles that are excluded for the specified username.

        Notes:
            - This function connects to the database, executes a query to retrieve the titles to exclude for the given username, and then disconnects from the database.
            - If there are excluded titles for the specified username, they are split by commas and stripped of any leading or trailing whitespace before being returned as a list. If no titles are found, an empty list is returned.
        """
        self.connect()
        self.cursor.execute('''SELECT titles_to_exclude FROM Users WHERE username=?''', (username,))
        result = self.cursor.fetchone()
        self.disconnect()

        if result:
            titles_list = result[0].split(',')
            titles_to_exclude = [title.strip() for title in titles_list]
        else:
            titles_to_exclude = []

        return titles_to_exclude

    @staticmethod
    def extract_user_info(data):
        """
        Extracts user information from a dictionary.

        Args:
            data (dict): A dictionary containing user information.

        Returns:
            tuple: A tuple containing the username, password, and exclusion titles.

        Safely accesses the values from the user_data dictionary. If the 'Username' key is not present in the dictionary, the default value 'Unknown' is used. If the 'Password' key is not present in the dictionary, the default value 'Unknown' is used. If the 'Exclusion_titles' key is not present in the dictionary, an empty list is used.
        """
        # Safely accessing the values from the user_data dictionary
        username = data.get('Username', 'Unknown')
        password = data.get('Password', 'Unknown')
        exclusion_titles = data.get('Exclusion_titles', [])

        return username, password, exclusion_titles


# Function to read and validate the CSV file
def read_csv(file_path):
    """
    Reads a CSV file and validates its contents.

    Args:
        file_path (str): The path to the CSV file.

    Returns:
        list: A list of rows from the CSV file, where each row is a list of values. If a URL is missing,
              it will be represented as None in the corresponding position.

    Raises:
        ValueError: If an empty value is found in the CSV file.
        ValueError: If an invalid difficulty level is found in the CSV file.
        ValueError: If an invalid score format is found in the CSV file.
        ValueError: If an invalid score range is found in the CSV file.
    """
    questions = []
    with open(file_path, mode='r', encoding='utf-8') as file:
        reader = csv.reader(file)
        next(reader)  # Skip header row if present
        for row in reader:
            if not all(value.strip() for value in row):
                raise ValueError("Empty value found in CSV.")
            difficulty = row[2].strip()
            if difficulty not in ['Hard', 'Medium', 'Easy']:
                raise ValueError(f"Invalid difficulty level at line {reader.line_num}: {difficulty}.")
            try:
                score = int(row[3].strip())
            except ValueError:
                raise ValueError(f"Invalid score format at line {reader.line_num}: {row[3]}.")
            if not 0 <= score <= 100:
                raise ValueError(f"Invalid score range at line {reader.line_num}: {score}.")

            questions.append([*row[:4]])  # Append the row with the URL replaced by None if necessary
    return questions


# Function to read and validate the config file
def read_config(file_path):
    """
    Reads and validates the configuration file.

    Args:
        file_path (str): The path to the configuration file.

    Returns:
        dict: A dictionary containing the parsed configuration data.
            - 'questions_amount' (int): The number of questions to generate.
            - 'minimum_titles' (int): The minimum number of titles to include in the exam.
            - 'hard' (int): The number of hard difficulty questions.
            - 'medium' (int): The number of medium difficulty questions.
            - 'easy' (int): The number of easy difficulty questions.
            - 'points' (int): The points awarded for each question.
            - 'debug' (bool): Whether to print debug messages or not.

    Raises:
        ValueError: If the configuration file does not contain exactly one section.
        ValueError: If any of the required options are missing in the configuration file.
        ValueError: If the sum of the difficulty levels does not equal the total questions amount.
        ValueError: If the 'points' value is not an integer.
        ValueError: If the 'debug' value is not a boolean.
    """
    config = ConfigParser()
    config.read(file_path)
    sections = config.sections()
    if len(sections) != 1:
        raise ValueError("Config file must contain exactly one section.")
    section = sections[0]
    options = config.options(section)
    required_options = ['questions_amount', 'minimum_titles', 'hard', 'medium', 'easy', 'points', 'debug']
    missing_options = [option for option in required_options if option not in options]
    if missing_options:
        raise ValueError(f"Missing required options in config file: {missing_options}")
    for option in required_options[:-2]:  # Exclude 'debug' and 'points' from this check
        try:
            int(config.get(section, option))
        except ValueError:
            raise ValueError(f"Invalid value type for {option}: expected integer.")
    if config.getint(section, 'hard') + config.getint(section, 'medium') + config.getint(section,
                                                                                         'easy') != config.getint(
            section, 'questions_amount'):
        raise ValueError("The sum of hard, medium, and easy questions must equal the total questions amount.")
    return {
        'questions_amount': config.getint(section, 'questions_amount'),
        'minimum_titles': config.getint(section, 'minimum_titles'),
        'hard': config.getint(section, 'hard'),
        'medium': config.getint(section, 'medium'),
        'easy': config.getint(section, 'easy'),
        'points': config.getint(section, 'points'),
        'debug': config.getboolean(section, 'debug')
    }


def create_excel_from_txt(debug):
    """
    Reads a text file line by line, processes the data according to the debug flag,
    converts the list of lists into a DataFrame, writes the DataFrame to an Excel file, and removes the original text file.

    Headers are never included in Exam.txt. When debug is True, each line is expected to contain
    'Question', 'Title', 'Difficulty', 'Score', separated by '&'. Otherwise, each line is expected
    to contain 'Question' followed by 'Score', separated by '&'.
    """
    # Initialize an empty list to hold our data
    data = []

    # Define headers based on the debug flag
    if debug:
        headers = ['Question', 'Title', 'Difficulty', 'Score']
    else:
        headers = ['Question', 'Score']

    # Open the text file and read it line by line
    with open('Exam.txt', 'r') as file:
        lines = file.readlines()
        for i, line in enumerate(lines):
            # Skip odd-numbered lines (starting count from 0)
            if i % 2!= 0:
                continue

            # Split the line at '&' to separate the components
            parts = line.strip().split('&')

            # Process the parts based on the debug flag
            if debug:
                if len(parts) == 4:  # Ensure there are exactly 4 parts
                    data.append(parts)  # Directly append the parts as a new row
            else:
                if len(parts) == 2:  # Ensure there are exactly 2 parts
                    data.append(parts)  # Directly append the parts as a new row

    # Convert the list of lists into a DataFrame
    df = pd.DataFrame(data, columns=headers)

    # Write the DataFrame to an Excel file
    df.to_excel('Exam.xlsx', index=False)

    os.remove('Exam.txt')


# Function to generate the exam
def generate_exam(questions, config_data, exclude_list):
    """
    Generates an exam based on the provided questions and configuration data,
    excluding specified titles.

    Args:
        questions (list): A list of questions to generate the exam from.
        config_data (dict): A dictionary containing configuration data for generating the exam.
        exclude_list (list): A list of titles to exclude from the exam, separated by commas.

    Returns:
        tuple: A tuple containing the generated exam, total points, difficulty ratios, and total titles.
    """
    while True:
        if not questions:
            # Retry if a questions' list is empty
            questions = read_csv('Test.csv')
            if not questions:
                raise ValueError("Failed to load questions from CSV file.")

        exam = []
        total_points = 0
        total_titles = []
        difficulty_counts = {'Hard': 0, 'Medium': 0, 'Easy': 0}

        # Split the exclude_list by comma and strip whitespace
        excluded_titles = [title.strip() for title in exclude_list[0].split(',')]

        # Filter out questions with titles in the exclude_list
        filtered_questions = [q for q in questions if q[1] not in excluded_titles]

        # Generate the exam using the filtered questions
        for i in range(config_data['questions_amount']):
            if not filtered_questions:
                break  # Exit loop if no more questions are available
            if i < config_data['hard']:
                difficulty = 'Hard'
            elif i < config_data['hard'] + config_data['medium']:
                difficulty = 'Medium'
            else:
                difficulty = 'Easy'

            selected_question_index = random.randint(0, len(filtered_questions) - 1)
            selected_question = filtered_questions[selected_question_index]
            if selected_question not in exam and selected_question[2] == difficulty:
                exam.append(selected_question)
                total_points += int(selected_question[3])
                difficulty_counts[selected_question[2]] += 1
                filtered_questions.pop(selected_question_index)  # Remove the selected question from the pool
                title_value = selected_question[1]
                if title_value not in total_titles:
                    # Append the value if it doesn't exist
                    total_titles.append(title_value)

        # Validate that the total number of questions added matches the final question total
        if len(exam) != config_data['questions_amount']:
            continue  # Regenerate the exam if the total number of questions does not match the requirement

        # Calculate difficulty ratios based on the actual distribution of questions in the exam
        total_difficulties = sum(difficulty_counts.values())
        if total_difficulties == 0:  # Check for division by zero
            return None, total_points, {}  # Return early with empty ratios if no questions were added

        difficulty_ratios = {k: v / total_difficulties * 100 for k, v in difficulty_counts.items()}

        # Final checks
        if total_points != config_data['points']:
            continue  # Regenerate the exam if total points do not match the required points
        if len(total_titles) < config_data['minimum_titles']:
            continue  # Regenerate the exam if it does not meet the title requirement

        # If the exam passes all checks, including the difficulty ratio validation, break out of the loop
        break

    return exam, total_points, difficulty_ratios, total_titles


# Main execution flow
def main():
    """
    The main function that reads a CSV file validates a config file, generates an exam, and writes the exam to a file.

    This function performs the following steps:
    1. Read the CSV file named 'Test.csv' using the `read_csv` function.
    2. Validates the config file using the `read_config` function.
    3. Generates an exam using the `generate_exam` function with the read questions and config data.
    4. Check if the file 'Exam.txt' exists.
    If it does, it deletes the file.
    If it doesn't, prints a message indicating that the file does not exist.
    5. Open the file 'Exam.txt' in 'write' mode to write the exam data to the file.
    Each sublist in the exam is written as a line in the file,
    with the question followed by the points enclosed in square brackets.
    6. Prints a message indicating that the exam has been generated and saved to the file 'Exam.txt'.
    7. Print the total points in the exam, the number of questions included in the exam,
    and the total number of titles used in the exam.
    8. Print the difficulty ratio used in the exam.

    Parameters:
    None

    Returns:
    None

    Raises:
    Exception: If any error occurs during the execution of the function.
    """
    try:
        # Read the CSV file and validate the config file
        questions = read_csv('Test.csv')
        config_data = read_config('.config')
        Exclude_list = um.get_excluded_titles(username)
        exam, total_points, difficulty_ratios, total_titles = generate_exam(questions, config_data, Exclude_list)

        # Check if the file Exam.txt exists
        if os.path.exists('Exam.txt'):
            # If the file exists, delete it
            os.remove('Exam.txt')

        with open('Exam.txt', 'w') as file:
            # Write the data to the file
            if config_data['debug'] == 1:
                file.write("Debug mode is on.\n\n")
                for sublist in exam:
                    file.write(
                        f"{sublist[0]} & Type: {sublist[1]} & Difficulty: {sublist[2]} & [{sublist[3]}]\n")

                    file.write(
                        f"{sublist[0]} & Type: {sublist[1]} & Difficulty: {sublist[2]} & [{sublist[3]}]\n")
            else:
                for sublist in exam:
                    file.write(
                        f"{sublist[0]} & [{sublist[3]}]\n")

                    file.write(
                        f"{sublist[0]} & [{sublist[3]}]\n")

            file.write(f"\n\nTotal exam is out of {config_data['points']} points.")

        time.sleep(1)

        try:
            create_excel_from_txt(config_data['debug'])
        except Exception as e:
            return e

        return f'''
        \nExam Generated and saved to Exam.xlsx
        \nExam Generation info;
        Total Points in exam: {total_points}
        Number of Questions Included in exam: {len(exam)}
        Total Titles Used in exam: {len(total_titles)}
        Difficulty Ratio used: Hard: {difficulty_ratios['Hard']}%, Medium: {difficulty_ratios['Medium']}%, Easy: {difficulty_ratios['Easy']}%
        '''

    except Exception:
        return 520


if __name__ == "__main__":
    def REC():
        """
        Create a new thread to run the main function
        """
        # Create a new thread to run the main function
        try:
            # Initialize a variable to hold the result of the main function
            result = None

            # Define a wrapper function around the main function to capture its result
            def wrapper():
                """
                A wrapper function that captures the result of the main function and assigns it to the nonlocal variable 'result'.

                This function does not take any parameters.

                Returns:
                    None
                """
                nonlocal result
                result = main()

            # Start the wrapper function in a new thread
            thread = threading.Thread(target=wrapper)
            thread.start()

            # Wait for 20 seconds or until the thread completes
            thread.join(timeout=20)

            # Check if the thread has finished within the timeout period
            if thread.is_alive():
                # If the thread is still alive (i.e., hasn't finished), raise a TimeoutException
                return "Timeout - Mostly due to too strict rules or too little questions were given in the CVS file."
            else:
                # Return the result of the main function
                return result
        except Exception:
            return 520


    def init():
        """
        This function initializes data based on the selected API, processes it accordingly, and sends the data to Nirt.
        """
        if api == "REC":
            DATA = REC()
        elif api == "RUG":
            DATA = um.create_db(username)
        elif api == "RUD":
            DATA = um.add_exclusion_db(username, exclusion_titles, password)
        elif api == "RUR":
            DATA = um.remove(username, password)
        else:
            DATA = 404

        send_data_to_nirt(DATA)


    # Initialize the UserManager
    um = UserManager(db_name='users.db')
    if not os.path.exists("users.db"):
        um.create_db_initial()

    # Initialize the API received variables
    username, password, exclusion_titles = um.extract_user_info(api_return)

    # Main startup
    init()
