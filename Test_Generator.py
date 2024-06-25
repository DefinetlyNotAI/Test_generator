import random
import pandas as pd
from tqdm import tqdm


def read_config_file():
    config = {}
    with open('.config', 'r') as file:
        for line in file:
            if '=' in line:
                key, value = line.strip().split('=')
                config[key] = int(value) if value.isdigit() else float(value)
    return config


def validate_config(config):
    total_percentage = sum([config['hard_percentage'], config['medium_percentage'], config['easy_percentage']])
    if not total_percentage == 100 or any(value <= 0 for value in config.values()):
        raise ValueError(
            "Configuration validation failed. Percentages must add up to 100 and all values must be greater than 0.")


def load_and_validate_csv(config, df):
    required_columns = ['Questions', 'Question Type', 'Difficulty (Easy, Medium, Hard)', 'Score']
    if not set(required_columns).issubset(df.columns):
        raise ValueError("CSV file does not contain the required columns.")

    if (df['Score'] < 0).any():
        raise ValueError("CSV file contains negative scores.")

    questions_amount = config['questions_amount']
    if len(df) < questions_amount:
        raise ValueError(f"Not enough questions in the CSV file to meet the required amount ({questions_amount}).")

    return df


def construct_exam(config, df):
    questions_amount = config['questions_amount']
    minimum_titles = config['minimum_titles']
    max_points = config['max_points']

    difficulties = ['Hard', 'Medium', 'Easy']
    difficulty_ratios = [config['hard_percentage'], config['medium_percentage'], config['easy_percentage']]

    selected_questions = []
    for difficulty, ratio in zip(difficulties, difficulty_ratios):
        target_count = int(ratio * questions_amount / 100)
        filtered_df = df[df['Difficulty (Easy, Medium, Hard)'] == difficulty]

        selected = random.sample(list(filtered_df.itertuples(index=False)), target_count)
        selected_questions.extend(selected)

    unique_selected_questions = []
    seen_titles = set()
    for question in selected_questions:
        if getattr(question, 'Questions', None) not in seen_titles:
            unique_selected_questions.append(question)
            seen_titles.add(getattr(question, 'Questions', None))

    total_attempts = questions_amount // 2  # Rough estimate for simplicity
    for _ in tqdm(range(total_attempts), desc="Constructing Exam"):
        additional_selection = random.sample(list(df.itertuples(index=False)),
                                             questions_amount - len(unique_selected_questions))
        additional_unique_questions = [q for q in additional_selection if
                                       getattr(q, 'Questions', None) not in seen_titles]

        if len(additional_unique_questions) > 0:
            unique_selected_questions.extend(additional_unique_questions)
            seen_titles.update({getattr(q, 'Questions', None) for q in additional_unique_questions})

        if len(unique_selected_questions) >= minimum_titles and sum(
                getattr(q, 'Score', 0) for q in unique_selected_questions) == max_points:
            break

    return unique_selected_questions


def main():
    try:
        config = read_config_file()
        validate_config(config)
        df = pd.read_csv('Test.csv')
        df = load_and_validate_csv(config, df)

        exam = construct_exam(config, df)

        # Output the exam
        for i, question in enumerate(exam, start=1):
            print(
                f"Question {i}: {getattr(question, 'Questions', '')} ({getattr(question, 'Question Type', '')}, {getattr(question, 'Difficulty (Easy, Medium, Hard)', '')}, Score: {getattr(question, 'Score', 0)})")
    except Exception as e:
        print(f"An error occurred: {e}")


if __name__ == "__main__":
    main()
