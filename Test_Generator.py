import csv
from configparser import ConfigParser
import random


# Function to read and validate the CSV file
def read_csv(file_path):
    questions = []
    with open(file_path, mode='r', encoding='utf-8') as file:
        reader = csv.reader(file)  # Changed to csv.reader for demonstration purposes
        next(reader)  # Skip header row if present
        for row in reader:
            # Validate row
            if not all(value.strip() for value in row):  # Use strip() to remove leading/trailing whitespace
                raise ValueError("Empty value found in CSV.")
            difficulty = row[2].strip()  # Directly access the third column (index 2) for difficulty
            if difficulty not in ['Hard', 'Medium', 'Easy']:
                raise ValueError(f"Invalid difficulty level at line {reader.line_num}: {difficulty}.")
            try:
                score = int(row[3].strip())  # Access the fourth column (index 3) for score
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

    # Validate config values
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

    # Ensure percentages add up to 100
    percentages = [int(config.get(section, f'{d}_percentage')) for d in ('hard', 'medium', 'easy')]
    if sum(percentages) != 100:
        raise ValueError("Percentage values do not add up to 100.")

    return {
        'questions_amount': config.getint(section, 'questions_amount'),
        'minimum_titles': config.getint(section, 'minimum_titles'),
        'hard_percentage': config.getfloat(section, 'hard_percentage'),
        'medium_percentage': config.getfloat(section, 'medium_percentage'),
        'easy_percentage': config.getfloat(section, 'easy_percentage'),
        'points': config.getint(section, 'points')
    }


# Function to generate the exam
def generate_exam(questions, config_data):
    while True:
        exam = []
        total_points = 0
        difficulty_ratios = {'Hard': config_data['hard_percentage'], 'Medium': config_data['medium_percentage'],
                             'Easy': config_data['easy_percentage']}
        title_questions_needed = min(config_data['minimum_titles'], config_data['questions_amount'])

        # First, ensure we have the minimum number of title questions
        for _ in range(title_questions_needed):
            if not questions:
                raise ValueError("No questions available to generate the exam.")
            selected_question_index = random.randint(0, len(questions) - 1)
            selected_question = questions[selected_question_index]
            if selected_question[0] == 'Title':  # Assuming the first column indicates the question type
                exam.append(selected_question)
                total_points += int(selected_question[3])
                difficulty_ratios[selected_question[2]] -= 1
                questions.pop(selected_question_index)  # Remove the selected question from the pool

        # After meeting the title questions requirement, fill the rest of the exam with other types of questions
        while len(exam) < config_data['questions_amount']:
            if not questions:
                break  # Exit loop if no more questions are available
            selected_question_index = random.randint(0, len(questions) - 1)
            selected_question = questions[selected_question_index]
            if selected_question not in exam:
                exam.append(selected_question)
                total_points += int(selected_question[3])
                difficulty_ratios[selected_question[2]] -= 1
                questions.pop(selected_question_index)  # Remove the selected question from the pool

        # Final checks
        if total_points != config_data['points']:
            continue  # Regenerate the exam if total points do not match the required points
        if len(exam) < config_data['questions_amount']:
            continue  # Regenerate the exam if it does not meet the size requirement

        # If the exam passes all checks, break out of the loop
        break

    return exam, total_points, difficulty_ratios


# Main execution flow
try:
    questions = read_csv('Test.csv')
    config_data = read_config('.config')
    exam, total_points, difficulty_ratios = generate_exam(questions, config_data)

    print(f"Exam Generated:\n{exam}\n")
    print(f"Total Points: {total_points}")
    print(f"Questions Answered: {len(exam)}")
    print(
        f"Difficulty Ratio: Hard: {difficulty_ratios['Hard']}%, Medium: {difficulty_ratios['Medium']}%, Easy: {difficulty_ratios['Easy']}%")
except Exception as e:
    print(str(e))
