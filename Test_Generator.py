import threading
import csv
import random
from configparser import ConfigParser
import os
import pandas as pd


# Exception class for timeout
class TimeoutException(Exception):
    pass


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


def create_excel_from_txt():
    # Initialize an empty list to hold our data
    data = [['Question', 'Score']]  # Start with headers

    # Open the text file and read it line by line
    with open('Exam.txt', 'r') as file:
        for line in file:
            # Split the line at '&' to separate question and score
            parts = line.strip().split('&')
            if len(parts) == 2:  # Ensure there are exactly two parts
                question = parts[0].strip()  # Remove leading/trailing whitespace
                score = parts[1].strip()  # Remove leading/trailing whitespace

                # Append the question and score as a new row
                data.append([question, score])

    # Convert the list of lists into a DataFrame
    df = pd.DataFrame(data[1:], columns=data[0])  # Skip the header row during conversion

    # Write the DataFrame to an Excel file
    df.to_excel('Exam.xlsx', index=False)

    os.remove('Exam.txt')


# Function to generate the exam
def generate_exam(questions, config_data):
    """
    Generates an exam based on the provided questions and configuration data.

    Args:
        questions (list): A list of questions to generate the exam from.
        config_data (dict): A dictionary containing configuration data for generating the exam.

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

        # Generate the exam
        for i in range(config_data['questions_amount']):
            if not questions:
                break  # Exit loop if no more questions are available
            if i < config_data['hard']:
                difficulty = 'Hard'
            elif i < config_data['hard'] + config_data['medium']:
                difficulty = 'Medium'
            else:
                difficulty = 'Easy'

            selected_question_index = random.randint(0, len(questions) - 1)
            selected_question = questions[selected_question_index]
            if selected_question not in exam and selected_question[2] == difficulty:
                exam.append(selected_question)
                total_points += int(selected_question[3])
                difficulty_counts[selected_question[2]] += 1
                questions.pop(selected_question_index)  # Remove the selected question from the pool
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
        exam, total_points, difficulty_ratios, total_titles = generate_exam(questions, config_data)

        # Check if the file Exam.txt exists
        if os.path.exists('Exam.txt'):
            # If the file exists, delete it
            os.remove('Exam.txt')
            print("Exam.txt has been deleted.")
        else:
            print("Exam.txt does not exist.")

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

        print(f"\nExam Generated and saved to Exam.txt")
        print(f"\nTotal Points in exam: {total_points}")
        print(f"Number of Questions Included in exam: {len(exam)}")
        print(f"Total Titles Used in exam: {len(total_titles)}")
        print(
            f"Difficulty Ratio used: Hard: {difficulty_ratios['Hard']}%, Medium: {difficulty_ratios['Medium']}%, Easy: {difficulty_ratios['Easy']}%")

        create_excel_from_txt()

    except Exception as e:
        print(f"An unexpected error occurred (Function main): {e}")


# Create a new thread to run the main function
try:
    # Start the program logic in a new thread
    thread = threading.Thread(target=main)
    thread.start()

    # Wait for 20 seconds or until the thread completes
    thread.join(timeout=20)

    # Check if the thread has finished within the timeout period
    if thread.is_alive():
        # If the thread is still alive (i.e., hasn't finished), raise a TimeoutException
        raise TimeoutException(
            "Timeout - Mostly due to too strict rules or too little questions were given in the CVS file.")

except TimeoutException as e:
    print("Timeout - Mostly due to too strict rules or too little questions were given in the CVS file.")
    exit(1)
except Exception as e:
    print(f"An unexpected error occurred (No function): {e}")
    exit(1)
