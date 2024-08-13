import csv
import json
import os.path
import random
import secrets
import sqlite3
import string
import time
from datetime import datetime
import pandas as pd
import subprocess

# TODO Refactor the whole code, add colorlog, remove comments and replace them


class SQL:
    # Class to handle user management
    def __init__(self, db_name="users.db"):
        self.db_name = db_name
        self.conn = None
        self.cursor = None

    def connect(self):
        if self.conn is None:
            self.conn = sqlite3.connect(self.db_name)
            self.cursor = self.conn.cursor()

    def disconnect(self):
        if self.conn:
            self.conn.close()
            self.conn = None
            self.cursor = None

    @staticmethod
    def create_db_initial():
        # Connect to the SQLite database
        # This will create the database file if it doesn't already exist
        conn = sqlite3.connect("users.db")

        # Create a cursor object using the cursor() method
        cursor = conn.cursor()

        # Drop the table if it already exists to start fresh
        cursor.execute("""DROP TABLE IF EXISTS Users;""")

        # Create a table named Users with id, username, password, and titles_to_exclude columns
        cursor.execute(
            """CREATE TABLE Users (
                            id INTEGER PRIMARY KEY,
                            username TEXT NOT NULL UNIQUE,
                            password TEXT NOT NULL,
                            titles_to_exclude TEXT);"""
        )

        # Commit the transaction
        conn.commit()

        # Close the connection
        conn.close()

    def verify_password(self, username, password):
        try:
            self.connect()
            self.cursor.execute(
                "SELECT password FROM Users WHERE username=?", (username,)
            )
            result = self.cursor.fetchone()
            self.disconnect()

            if result:
                stored_password = result[0]
                if password == stored_password:
                    return True
            return False
        except Exception as e:
            log.info(f"An error occurred while verifying the password. as {e}")
            return False

    def create_db(self, username, exclusion_titles, password=None):
        try:
            self.connect()
            self.cursor.execute("SELECT * FROM users WHERE username=?", (username,))
            existing_user = self.cursor.fetchone()
            self.disconnect()

            alphabet = string.ascii_letters + string.digits
            if password is None:
                password_new = "".join(secrets.choice(alphabet) for _ in range(12))
            else:
                password_new = password

            if existing_user:
                return "ERROR Username already exists. && 409"

            self.connect()
            self.cursor.execute(
                "INSERT INTO users (username, password) VALUES (?,?)",
                (username, password_new),
            )
            self.conn.commit()
            self.disconnect()

            with open("passwords.txt", "w") as f:
                f.write(password_new)

            sql.add_exclusion_db(username, exclusion_titles, password_new, "CDB")

            return "SPECIAL Password Made"
        except Exception as e:
            return f"ERROR {e} && 500"

    def remove(self, username, password):
        try:
            # Check if the username exists
            self.connect()
            self.cursor.execute("SELECT * FROM Users WHERE username=?", (username,))
            user_exists = self.cursor.fetchone()
            self.disconnect()

            if not user_exists:
                return "ERROR User does not exist. && 404"

            # Proceed with verification and deletion if the user exists
            if self.verify_password(username, password):
                self.connect()
                self.cursor.execute(
                    """DELETE FROM Users WHERE username=?""", (username,)
                )
                self.conn.commit()
                self.disconnect()
                return f"Successfully removed data for user {username}."
            else:
                return "ERROR Incorrect password. && 401"
        except Exception as e:
            return f"ERROR {e} && 500"

    def add_exclusion_db_main(self, name, titles, password):
        try:
            if self.verify_password(name, password):
                self.connect()
                try:
                    self.cursor.execute(
                        """SELECT titles_to_exclude FROM Users WHERE username=?""",
                        (name,),
                    )
                    result = self.cursor.fetchone()

                    # Check if the result is None or NULL and replace with a placeholder
                    if result is None or result[0] is None:
                        initial_titles = (
                            "PLACEHOLDER"  # Placeholder for empty titles_to_exclude
                        )
                    else:
                        initial_titles = result[0]

                    current_titles = initial_titles.strip()

                    # Convert current_titles and titles to sets for comparison
                    current_titles_set = set(current_titles.split(","))
                    titles_set = set(titles)

                    # Calculate the difference between the two sets
                    new_titles_set = titles_set - current_titles_set

                    # If there are new titles to add, proceed with the update
                    if new_titles_set:
                        updated_titles = ",".join(
                            list(new_titles_set)
                        )  # Join the new titles with a comma and space
                        self.cursor.execute(
                            """UPDATE Users SET titles_to_exclude = COALESCE(titles_to_exclude ||?, '') WHERE username =?""",
                            (updated_titles, name),
                        )
                        self.conn.commit()
                        return f"Successfully updated titles for user {name}."
                    else:
                        return "ERROR No new titles to add. && 400"

                except Exception as e:
                    return f"ERROR {e} && 500"
            else:
                return "ERROR Incorrect password. && 401"
        except Exception as e:
            return f"ERROR {e} && 520]"

    @staticmethod
    def add_exclusion_db(name, titles, password, special=None):
        try:
            value = sql.add_exclusion_db_main(name, titles, password)
            if error_check(value):
                return value
            if not special:
                msg = sql.add_exclusion_db_main(name, ",", password)
                if error_check(msg):
                    return msg
            return value
        except Exception as e:
            return f"ERROR {e} && 520"

    def get_excluded_titles(self, username):
        try:
            self.connect()
            self.cursor.execute(
                """SELECT titles_to_exclude FROM Users WHERE username=?""", (username,)
            )
            result = self.cursor.fetchone()
            self.disconnect()

            if result:
                titles_list = result[0].split(",")
                titles_to_exclude = [title.strip() for title in titles_list]
            else:
                titles_to_exclude = []

            return titles_to_exclude
        except Exception as e:
            return f"ERROR {e} && 520"

    @staticmethod
    def extract_user_info(data):
        try:
            # Safely accessing the values from the user_data dictionary
            username = data.get("Username", "Unknown")
            if error_check(username):
                return username
            password = data.get("Password", "Unknown")
            if error_check(password):
                return username
            exclusion_titles = data.get("Exclusion_titles", [])
            if isinstance(exclusion_titles, str):
                if error_check(exclusion_titles):
                    return exclusion_titles

            return username, password, exclusion_titles
        except Exception as e:
            return f"ERROR {e} && 520"


class LOG:
    def __init__(self, filename="Server.log"):
        """
        Initializes a new instance of the LOG class.

        Args:
            filename (str, optional): The name of the log file. Defaults to "Server.log".

        Initializes the `filename` and `size` attributes of the LOG instance.
        If the log file does not exist, it creates an empty file with the specified name.
        """
        # Use the provided filename or default to 'Server.log'
        self.filename = str(filename)

        # Check if the file exists and create it if it doesn't
        if not os.path.exists(self.filename):
            with open(self.filename, "w") as log_file:
                log_file.write(
                    "|-----Timestamp-----|--LOG Level--|-----------------------------------------------------------------------LOG Messages-----------------------------------------------------------------------|\n"
                )
                pass  # Empty file content is fine here since we append logs

    @staticmethod
    def __timestamp():
        """
        Retrieves the current date and time and formats it into a string timestamp.

        Returns:
            str: A string representing the formatted timestamp.
        """
        # Get the current date and time
        now = datetime.now()
        # Format the timestamp as a string
        time = f"{now.strftime('%Y-%m-%d %H:%M:%S')}"
        return time

    def info(self, message):
        """
        Writes an information log message to the log file.

        Args:
            message (str): The message to be logged.

        Returns:
            None
        """
        with open(self.filename, "a") as f:
            f.write(f"[{self.__timestamp()}] > INFO:       {message}\n")

    def warning(self, message):
        """
        Writes a warning log message to the log file.

        Args:
            message (str): The warning message to be logged.

        Returns:
            None
        """
        with open(self.filename, "a") as f:
            f.write(f"[{self.__timestamp()}] > WARNING:    {message}\n")

    def error(self, message):
        """
        Writes an error log message to the log file.

        Args:
            message (str): The error message to be logged.

        Returns:
            None
        """
        with open(self.filename, "a") as f:
            f.write(f"[{self.__timestamp()}] > ERROR:      {message}\n")

    def critical(self, message):
        """
        Writes a critical log message to the log file.

        Args:
            message (str): The critical message to be logged.

        Returns:
            None
        """
        with open(self.filename, "a") as f:
            f.write(f"[{self.__timestamp()}] > CRITICAL:   {message}\n")


def exe_maintainer():
    # Specify the path to bd.exe. Use '.' to indicate the current directory if bd.exe is there.
    exe_path = "./bd.exe"
    try:
        # Execute bd.exe
        process = subprocess.run(
            [exe_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE
        )
        # Check if the execution was successful
        if process.returncode == 0:
            print("Execution successful.")
            print(process.stdout.decode())
    except FileNotFoundError as e:
        log.error(f"An error occurred: {e}")
        exit(
            "The bd.exe file is not found... It is crucial as it maintains special variables and security measures."
        )
    except Exception as e:
        log.error(f"An error occurred: {e}")
        exit("Failed to execute bd.exe")


def error_check(value):
    if value is None:
        return False

    words = value.split()
    for word in words:
        if word == "ERROR":
            return True

    return False


def verify_admin_password(password):
    # Connect to the SQLite database (or create it if it doesn't exist)
    conn = sqlite3.connect("users.db")

    # Create a cursor object using the cursor() method
    cursor = conn.cursor()

    # SQL query to select the admin user's username and password
    query = "SELECT username, password FROM Users WHERE username='admin'"

    try:
        # Execute the query
        cursor.execute(query)

        # Fetch the result
        result = cursor.fetchone()

        # Check if the fetched row exists and the password matches
        if (
            result and result[1] == password
        ):  # Compare the second column (index 1) with the provided password
            return True
        else:
            return False
    except Exception as e:
        print(f"An error occurred: {e}")
        return False
    finally:
        # Close the connection
        conn.close()


def read_csv():
    try:
        questions = []
        with open("Data.csv", mode="r", encoding="utf-8") as file:
            reader = csv.reader(file)
            next(reader)  # Skip header row if present
            for row in reader:
                # Initialize a list to hold the indices to check
                indices_to_check = []

                # Populate the list with indices to check, excluding the URL column index
                for i in range(len(row)):
                    if (
                        i != 4
                    ):  # Excluding the URL column index (assuming it's always the 5th column)
                        indices_to_check.append(i)

                # Use a generator expression to strip values and check for emptiness across the specified indices
                if not all(
                    value.strip() for value in (row[i] for i in indices_to_check)
                ):
                    return "ERROR Empty value found in CSV. && 400"

                difficulty = row[2].strip()
                if difficulty not in ["Hard", "Medium", "Easy"]:
                    return f"ERROR Invalid difficulty level at line {reader.line_num}: {difficulty}. && 400"
                try:
                    score = int(row[3].strip())
                except ValueError:
                    return f"ERROR Invalid score format at line {reader.line_num}: {row[3]}. && 400"
                if not 0 <= score <= 100:
                    return f"ERROR Invalid score range at line {reader.line_num}: {score}. && 400"

                # Adjusted to allow the URL column to be empty
                url_column_index = (
                    4  # Assuming the URL is in the 5th column (index starts at 0)
                )
                url = (
                    row[url_column_index].strip()
                    if url_column_index < len(row)
                    else None
                )

                questions.append(
                    [*row[:url_column_index], url]
                )  # Append the row with the URL if present, otherwise append None
        return questions
    except FileNotFoundError as fnfe:
        return f"ERROR {fnfe} && 404"
    except Exception as e:
        return f"ERROR {e} && 520"


def read_config():

    try:
        with open("config.json") as f:
            config = json.load(f)

        min_titles = config["minimum_titles"]
        hard = config["hard_data_to_use"]
        med = config["medium_data_to_use"]
        easy = config["easy_data_to_use"]
        points = config["total_points"]
        debug = config["use_debug_(ONLY_IF_YOU_DEVELOPED_THIS!)"]
        questions_amount = hard + med + easy
        return questions_amount, min_titles, hard, med, easy, points, debug

    except FileNotFoundError as fnfe:
        return f"ERROR {fnfe} && 404"
    except Exception as e:
        return f"ERROR {e} && 520"


def read_api():
    try:
        with open("api.json") as f:
            config = json.load(f)

        api = config["api"]
        username = config["username"]
        password = config["password"]
        exclusion_titles = config["exclusion_titles"]
        return api, username, password, exclusion_titles
    except FileNotFoundError as fnfe:
        return f"ERROR {fnfe} && 404"
    except Exception as e:
        return f"ERROR {e} && 520"


def create_excel():
    try:
        data = []

        # Used to be ["URL", "Question", "Title", "Difficulty", "Score"]
        if DEBUG_DB:
            headers = ["URL", "Data", "Type", "Range", "Weight"]
        else:
            headers = ["URL", "Data", "Weight"]

        with open("Exam.txt", "r") as file:
            lines = file.readlines()
            for i, line in enumerate(lines):
                if i % 2 != 0:
                    continue

                parts = line.strip().split("&")

                if DEBUG_DB:
                    if len(parts) == 5:
                        data.append(parts)
                else:
                    if len(parts) == 3:
                        data.append(parts)

        # Convert the list of lists into a DataFrame
        df = pd.DataFrame(data, columns=headers)

        # Write the DataFrame to an Excel file
        df.to_excel("Exam.xlsx", index=False)

        os.remove("Exam.txt")
    except FileExistsError as fnfe:
        return f"ERROR {fnfe} && 409"
    except Exception as e:
        return f"ERROR {e} && 520"


def generate_data(questions, exclude_list):
    try:
        while True:
            if not questions:
                # Retry if a questions' list is empty
                questions = read_csv()
                if not questions:
                    return "ERROR Failed to load questions from CSV file. && 500"

            exam = []
            total_points = 0
            total_titles = []
            difficulty_counts = {"Hard": 0, "Medium": 0, "Easy": 0}

            # Split the exclude_list by comma and strip whitespace
            excluded_titles = [title.strip() for title in exclude_list[0].split(",")]

            # Filter out questions with titles in the exclude_list
            filtered_data = [q for q in questions if q[1] not in excluded_titles]

            # Generate the exam using the filtered questions
            for i in range(TOTAL_DATA_AMOUNT):
                if not filtered_data:
                    break  # Exit loop if no more questions are available
                if i < HARD_DATA_AMOUNT:
                    difficulty = "Hard"
                elif i < HARD_DATA_AMOUNT + MEDIUM_DATA_AMOUNT:
                    difficulty = "Medium"
                else:
                    difficulty = "Easy"

                selected_question_index = random.randint(0, len(filtered_data) - 1)
                selected_question = filtered_data[selected_question_index]
                if selected_question not in exam and selected_question[2] == difficulty:
                    exam.append(selected_question)
                    total_points += int(selected_question[3])
                    difficulty_counts[selected_question[2]] += 1
                    filtered_data.pop(
                        selected_question_index
                    )  # Remove the selected question from the pool
                    title_value = selected_question[1]
                    if title_value not in total_titles:
                        # Append the value if it doesn't exist
                        total_titles.append(title_value)

            if len(exam) != TOTAL_DATA_AMOUNT:
                continue

            # Calculate difficulty ratios based on the actual distribution of questions in the exam
            total_difficulties = sum(difficulty_counts.values())
            if total_difficulties == 0:  # Check for division by zero
                return (
                    None,
                    total_points,
                    {},
                )  # Return early with empty ratios if no questions were added

            difficulty_ratios = {
                k: v / total_difficulties * 100 for k, v in difficulty_counts.items()
            }

            # Final checks
            if total_points != TOTAL_POINTS:
                continue  # Regenerate the exam if total points do not match the required points
            if len(total_titles) < MINIMUM_TYPES:
                continue  # Regenerate the exam if it does not meet the title requirement

            # If the exam passes all checks, including the difficulty ratio validation, break out of the loop
            break

        return exam, total_points, difficulty_ratios, total_titles
    except Exception as e:
        return f"ERROR {e} && 520"


def exam_generator(username):
    try:
        # Read the CSV file and validate the config file
        questions = read_csv()
        if isinstance(questions, str):
            if error_check(questions):
                return questions

        config_data = read_config()
        if isinstance(config_data, str):
            if error_check(config_data):
                return config_data

        Exclude_list = sql.get_excluded_titles(username)
        if isinstance(Exclude_list, str):
            if error_check(Exclude_list):
                return Exclude_list
        else:
            global TOTAL_DATA_AMOUNT, MINIMUM_TYPES, HARD_DATA_AMOUNT, MEDIUM_DATA_AMOUNT, EASY_DATA_AMOUNT, TOTAL_POINTS, DEBUG_DB
            TOTAL_DATA_AMOUNT, MINIMUM_TYPES, HARD_DATA_AMOUNT, MEDIUM_DATA_AMOUNT, EASY_DATA_AMOUNT, TOTAL_POINTS, DEBUG_DB = Exclude_list

        temp = generate_data(questions, Exclude_list)
        if isinstance(temp, str):
            if error_check(temp):
                return temp
        else:
            exam, total_points, difficulty_ratios, total_titles = temp

        # Check if the file Exam.txt exists
        if os.path.exists("Exam.txt"):
            # If the file exists, delete it
            os.remove("Exam.txt")

        with open("Exam.txt", "w") as file:
            # Write the data to the file
            if DEBUG_DB:
                file.write("Debug mode is on.\n\n")
                for sublist in exam:
                    file.write(
                        f"{sublist[4]} & {sublist[0]} & Type: {sublist[1]} & Difficulty: {sublist[2]} & [{sublist[3]}]\n"
                    )

                    file.write(
                        f"{sublist[4]} & {sublist[0]} & Type: {sublist[1]} & Difficulty: {sublist[2]} & [{sublist[3]}]\n"
                    )
            else:
                for sublist in exam:
                    file.write(f"{sublist[4]} & {sublist[0]} & [{sublist[3]}]\n")

                    file.write(f"{sublist[4]} & {sublist[0]} & [{sublist[3]}]\n")

            file.write(f"\n\nTotal exam is out of {TOTAL_POINTS} points.")

        time.sleep(1)

        msg = create_excel()
        if error_check(msg):
            return msg

        return rf"""DOWNLOAD
        <p>Exam Generated and saved to Exam.xlsx <p>Exam Generation info; <p>Total Points in exam: {total_points} <p>Number of Questions Included in exam: {len(exam)} <p>Total Titles Used in exam: {len(total_titles)} <p>Difficulty Ratio used: Hard: {round(difficulty_ratios['Hard'], 2)}%, Medium: {round(difficulty_ratios['Medium'], 2)}%, Easy: {round(difficulty_ratios['Easy'], 2)}%
        """

    except Exception as e:
        return f"ERROR {e} && 520"


def DATABASE():
    """
    Reads the API configuration from the 'API.json' file and extracts the API, username, password, and exclusion titles.

    Returns:
    - tuple: A tuple containing the API, username, password, and exclusion titles.
    - str: If an exception occurs, returns a formatted error message.
    """
    exe_maintainer()
    try:

        def init():
            """
            Initializes the UserManager and API values based on the API configuration in the 'API.json' file.

            Returns:
            - str: If the API configuration is invalid, returns a formatted error message.
            - str: If the API is 'REC', generates an exam based on the request and returns a formatted message.
            - str: If the API is 'RUG', creates a new user in the database based on the request and returns a formatted message.
            - str: If the API is 'RUD', adds exclusion titles to the database for a user based on the request and returns a formatted message.
            - str: If the API is 'RUR', removes a user from the database based on the request and returns a formatted message.
            - str: If the API is 'RLR', sends the server log and returns a formatted message.
            - str: If the API is invalid, returns a formatted error message.
            """
            # Initialize the UserManager and API values
            temp = read_api()
            if isinstance(temp, str):
                if error_check(temp):
                    return temp
            else:
                api, username, password, exclusion_titles = temp

            if api == "REC":
                log.info(
                    f"A request has been made to generate an exam by the user {username}"
                )
                if sql.verify_password(username, password):
                    DATA = exam_generator(username)
                    if not error_check(DATA):
                        log.info("Exam generated successfully based on the request")
                else:
                    DATA = "ERROR Invalid Username or Password && 401"

            elif api == "RUG":
                log.info(
                    f"A request has been made to create a new user by the following username {username}"
                )
                DATA = sql.create_db(username, exclusion_titles)
                if not error_check(DATA):
                    log.info("User created successfully based on the request")

            elif api == "RUD":
                log.info(
                    f"A request has been made to add the following exclusion titles {exclusion_titles} to the database for user {username}"
                )
                DATA = sql.add_exclusion_db(username, exclusion_titles, password)
                if not error_check(DATA):
                    log.info("Exclusion titles added successfully based on the request")

            elif api == "RUR":
                log.info(
                    f"A request has been made to remove the user {username} from the database"
                )
                if username != "admin":
                    DATA = sql.remove(username, password)
                    if not error_check(DATA):
                        log.info("User removed successfully based on the request")
                else:
                    DATA = "ERROR Admin cannot be removed && 401"

            elif api == "RLR":
                if verify_admin_password(password):
                    DATA = "LOG"
                else:
                    DATA = "ERROR Invalid Username or Password && 401"

            else:
                DATA = "ERROR Invalid API && 404"

            return DATA

        # Main startup
        return init()

    except Exception as e:
        return f"ERROR {e} && 520"


sql = SQL(db_name="users.db")
log = LOG(filename="DataBase.log")
if not os.path.exists("users.db"):
    log.info("Creating user database from scratch using SQLite")
    sql.create_db_initial()
    try:
        with open("Admin.secrets", "r") as admin:
            password = admin.read()
    except Exception as e:
        log.info("Admin password not found" + str(e))
        password = None
    sql.create_db("admin", "", password)
    os.remove("passwords.txt")
    exe_maintainer()
if not os.path.exists("bd.exe"):
    exit()
if not os.path.exists("max.time"):
    exe_maintainer()

print(DATABASE())
