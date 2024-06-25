import threading
import csv
import random
from configparser import ConfigParser


# Exception class for timeout
class TimeoutException(Exception):
    pass


# Function to read and validate the CSV file
def read_csv(file_path):
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
            questions.append(row)
    return questions


# Function to read and validate the config file
def read_config(file_path):
    config = ConfigParser()
    config.read(file_path)
    sections = config.sections()
    if len(sections) != 1:
        raise ValueError("Config file must contain exactly one section.")
    section = sections[0]
    options = config.options(section)
    required_options = ['questions_amount', 'minimum_titles', 'hard_percentage', 'medium_percentage', 'easy_percentage',
                        'points']
    missing_options = [option for option in required_options if option not in options]
    if missing_options:
        raise ValueError(f"Missing required options in config file: {missing_options}")
    for option in required_options:
        try:
            value = int(config.get(section, option))
            if option == 'questions_amount' and value > len(read_csv('Test.csv')):
                raise ValueError(f"{option} exceeds the number of questions in the CSV file.")
        except ValueError:
            raise ValueError(f"Invalid value type for {option}: expected integer.")
    percentages = [int(config.get(section, f'{d}_percentage')) for d in ('hard', 'medium', 'easy')]
    if sum(percentages) != 100:
        raise ValueError("Percentage values do not add up to 100.")
    return {
        'questions_amount': config.getint(section, 'questions_amount'),
        'minimum_titles': config.getint(section, 'minimum_titles'),
        'hard_percentage': config.getfloat(section, 'hard_percentage'),
        'medium_percentage': config.getfloat(section, 'medium_percentage'),
        'easy_percentage': config.getfloat(section, 'easy_percentage'),
        'points': config.getint(section, 'points'),
    }


# Function to generate the exam
def generate_exam(questions, config_data):
    while True:
        if not questions:
            # Retry if a questions' list is empty
            questions = read_csv('Test.csv')
            if not questions:
                raise ValueError("Failed to load questions from CSV file.")

        exam = []
        total_points = 0
        difficulty_counts = {'Hard': 0, 'Medium': 0, 'Easy': 0}

        # Generate the exam
        for _ in range(config_data['questions_amount']):
            if not questions:
                break  # Exit loop if no more questions are available
            selected_question_index = random.randint(0, len(questions) - 1)
            selected_question = questions[selected_question_index]
            if selected_question not in exam:
                exam.append(selected_question)
                total_points += int(selected_question[3])
                difficulty_counts[selected_question[2]] += 1
                questions.pop(selected_question_index)  # Remove the selected question from the pool

        # Calculate difficulty ratios based on the actual distribution of questions in the exam
        total_difficulties = sum(difficulty_counts.values())
        if total_difficulties == 0:  # Check for division by zero
            return None, total_points, {}  # Return early with empty ratios if no questions were added

        difficulty_ratios = {k: v / total_difficulties * 100 for k, v in difficulty_counts.items()}

        # Validation check against config values
        if abs(difficulty_ratios['Hard'] - config_data['hard_percentage']) > 1:  # Allow small deviations due to randomness
            continue  # Regenerate the exam if the hard ratio doesn't match closely
        if abs(difficulty_ratios['Medium'] - config_data['medium_percentage']) > 1:  # Allow small deviations due to randomness
            continue  # Regenerate the exam if the medium ratio doesn't match closely
        if abs(difficulty_ratios['Easy'] - config_data['easy_percentage']) > 1:  # Allow small deviations due to randomness
            continue  # Regenerate the exam if the easy ratio doesn't match closely

        # Final checks
        if total_points != config_data['points']:
            continue  # Regenerate the exam if total points do not match the required points
        if len(exam) < config_data['questions_amount']:
            continue  # Regenerate the exam if it does not meet the size requirement

        # If the exam passes all checks, including the difficulty ratio validation, break out of the loop
        break

    return exam, total_points, difficulty_ratios


# Main execution flow
def main():
    try:
        # Read the CSV file and validate the config file
        questions = read_csv('Test.csv')
        config_data = read_config('.config')
        exam, total_points, difficulty_ratios = generate_exam(questions, config_data)

        print(f"Exam Generated:\n{exam}\n")
        print(f"Total Points: {total_points}")
        print(f"Questions Answered: {len(exam)}")
        print(
            f"Difficulty Ratio: Hard: {difficulty_ratios['Hard']}%, Medium: {difficulty_ratios['Medium']}%, Easy: {difficulty_ratios['Easy']}%")
    except Exception as e:
        print("Error:", e)


try:
    # Start the program logic in a new thread
    thread = threading.Thread(target=main)
    thread.start()

    # Wait for 10 seconds or until the thread completes
    thread.join(timeout=3)

    # Check if the thread has finished within the timeout period
    if thread.is_alive():
        # If the thread is still alive (i.e., hasn't finished), raise a TimeoutException
        raise TimeoutException("Timeout - Mostly due to too strict rules or too little questions")

except TimeoutException:
    print("Timeout - Mostly due to too strict rules or too little questions")
    exit(1)
except Exception as e:
    print(f"An unexpected error occurred: {e}")
    exit(1)
