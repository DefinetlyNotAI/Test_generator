import csv
import glob
import random
from itertools import combinations
from tqdm import tqdm


def generate_all_combinations(processed_data, min_questions):
    all_combinations = []
    # Wrap the outer loop with tqdm for progress visualization
    for r in tqdm(range(min_questions, len(processed_data) + 1), desc="Generating combinations"):
        # Wrap the inner loop with tqdm as well, nested under the outer loop's progress bar
        for subset in tqdm(combinations(processed_data.values(), r), desc=f"Processing {r} questions"):
            all_combinations.append(list(subset))
    return all_combinations


def validate_number_of_questions(exam, questions_amount):
    num_questions = len(exam)
    result = num_questions == questions_amount
    return result


def validate_minimum_unique_titles(exam, minimum_titles):
    unique_titles = set(q['Title Type'] for q in exam)
    result = len(unique_titles) >= minimum_titles
    return result


def validate_difficulty_distribution(exam, hard_percentage, medium_percentage, easy_percentage):
    difficulties = [q['Difficulty'] for q in exam]
    if set(difficulties) != {'Easy', 'Medium', 'Hard'}:
        return False

    hard_ratio = sum(1 for d in difficulties if d == 'Hard') / len(difficulties)
    medium_ratio = sum(1 for d in difficulties if d == 'Medium') / len(difficulties)
    easy_ratio = sum(1 for d in difficulties if d == 'Easy') / len(difficulties)

    result = abs(hard_ratio - hard_percentage / 100) <= 0.01 and \
             abs(medium_ratio - medium_percentage / 100) <= 0.01 and \
             abs(easy_ratio - easy_percentage / 100) <= 0.01

    # print(f"Validation result: {result}")
    return result


def validate_total_points(exam, max_points):
    total_score = sum(q['Score'] for q in exam)
    result = total_score == max_points
    return result


def select_random_exam(valid_exams):
    print("Selecting a random exam...")
    selected_exam = random.choice(valid_exams)
    print("Selected Exam:")
    for question in selected_exam:
        print(question)
    return selected_exam


def read_and_process_csv():
    # Pattern to match CSV files in the current directory
    csv_files = glob.glob('./*.csv')

    if not csv_files:
        print("No CSV files found in the current directory.")
        return "\nAn error occurred, failed to generate questions"

    # Assuming there's only one CSV file or processing the first one found
    file_name = csv_files[0]

    # Dictionary to hold the processed data
    data_dict = {}

    try:
        with open(file_name, mode='r', newline='', encoding='utf-8') as file:
            reader = csv.reader(file)
            # Skip the header row
            next(reader)

            for index, row in enumerate(reader, start=1):
                # Check if row has exactly 4 values
                if len(row) != 4:
                    print(f"Error: CSV file contradicts itself at line {index}. Expected 4 values per row.")
                    return "\nAn error occurred, failed to generate questions"

                question, title_type, difficulty, score = row

                # Validate Difficulty value
                if difficulty not in ['Easy', 'Medium', 'Hard']:
                    print(
                        f"Error: Invalid Difficulty value '{difficulty}' at line {index}. Allowed values are Easy, Medium, Hard.")
                    return "\nAn error occurred, failed to generate questions"

                # Validate Score value
                try:
                    score = int(score)
                    if score < 0 or score > 100:
                        print(f"Error: Score value '{score}' at line {index} must be between 0 and 100.")
                        return "\nAn error occurred, failed to generate questions"
                except ValueError:
                    print(f"Error: CSV file contradicts itself at line {index}. Score must be a number.")
                    return "\nAn error occurred, failed to generate questions"

                # Create dictionary entry
                data_dict[question] = {'Question': question, 'Title Type': title_type, 'Difficulty': difficulty,
                                       'Score': score}

    except FileNotFoundError:
        print(f"Error: The file '{file_name}' does not exist in the current directory.")
        return "\nAn error occurred, failed to generate questions"
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return "\nAn error occurred, failed to generate questions"

    print()
    return data_dict


def initialize_and_validate_config():
    variables = {}

    try:
        # Open the.config file in read mode
        with open('.config', 'r') as file:
            # Iterate through each line in the file
            for line in file:
                # Strip whitespace and check if the line is not empty
                line = line.strip()
                if line:
                    # Split the line into variable name and value
                    var_name, var_value = line.split('=', 1)  # Split at the first occurrence of '='
                    # Remove leading/trailing whitespace from variable name and value
                    var_name = var_name.strip()
                    var_value = var_value.strip()
                    # Convert value to integer and store in the dictionary
                    variables[var_name] = int(var_value)

        # Perform validation checks
        total_percentages = variables.get('hard_percentage', 0) + \
                            variables.get('medium_percentage', 0) + \
                            variables.get('easy_percentage', 0)

        if total_percentages != 100:
            raise ValueError("The sum of hard_percentage, medium_percentage, and easy_percentage must equal 100.")

        return variables
    except FileNotFoundError:
        print("Error: The .config file does not exist in the current directory.")
        return None
    except ValueError as ve:
        print(f"Validation Error: {ve}")
        return None
    except Exception as e:
        print(f"An unexpected error occurred: {e}")
        return None


def generate_valid_exams(processed_data, questions_amount, minimum_titles, hard_percentage, medium_percentage,
                         easy_percentage, max_points):
    all_combinations = generate_all_combinations(processed_data, minimum_titles)
    valid_exams = []

    for exam in all_combinations:

        if not validate_number_of_questions(exam, questions_amount):
            continue

        if not validate_minimum_unique_titles(exam, minimum_titles):
            continue

        if not validate_difficulty_distribution(exam, hard_percentage, medium_percentage, easy_percentage):
            continue

        if validate_total_points(exam, max_points):
            valid_exams.append(exam)

    print(f"Number of valid exams: {len(valid_exams)}")
    return valid_exams


# Example usage
if __name__ == "__main__":
    processed_data = read_and_process_csv()

    config_variables = initialize_and_validate_config()
    if config_variables is not None:
        questions_amount = config_variables.get('questions_amount', 10)
        minimum_titles = config_variables.get('minimum_titles', 3)
        hard_percentage = config_variables.get('hard_percentage', 10)
        medium_percentage = config_variables.get('medium_percentage', 80)
        easy_percentage = config_variables.get('easy_percentage', 10)
        max_points = config_variables.get('max_points', 100)

    valid_exams = generate_valid_exams(processed_data, questions_amount, minimum_titles, hard_percentage,
                                       medium_percentage, easy_percentage, max_points)
    if valid_exams:
        selected_exam = select_random_exam(valid_exams)
        print("Selected Exam:")
        for question in selected_exam:
            print(question)
