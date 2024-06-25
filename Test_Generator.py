import random
import pandas as pd


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
    # Assuming the DataFrame 'df' has columns 'Question', 'Score', and 'Difficulty (Easy, Medium, Hard)'

    # Initialize selected questions list
    selected_questions = []
    difficulty_counts = {'Hard': 0, 'Medium': 0, 'Easy': 0}
    total_score = 0

    # Define difficulty weights based on their proportion in the dataset
    difficulty_weights = {level: len(df[df['Difficulty (Easy, Medium, Hard)'] == level]) for level in
                          ['Hard', 'Medium', 'Easy']}
    total_weight = sum(difficulty_weights.values())

    # Randomly select questions with a slight preference towards maintaining difficulty balance
    for _ in range(len(df)):
        # Choose a difficulty level based on its weight
        chosen_difficulty = random.choices(['Hard', 'Medium', 'Easy'],
                                           weights=[weight / total_weight for weight in difficulty_weights.values()],
                                           k=1)[0]

        # Filter questions by chosen difficulty
        filtered_df = df[df['Difficulty (Easy, Medium, Hard)'] == chosen_difficulty]

        # Select a random question from the filtered set
        selected_question = random.choice(list(filtered_df.itertuples(index=False)))

        # Add the selected question to the list
        selected_questions.append(selected_question)

        # Update difficulty count and total score
        difficulty_counts[chosen_difficulty] += 1
        total_score += selected_question.Score

    # Normalize difficulty counts to reflect the proportion of questions selected
    for difficulty in difficulty_counts.keys():
        difficulty_counts[difficulty] = round(difficulty_counts[difficulty] / len(df) * 100)

    return selected_questions, difficulty_counts, total_score


def main():
    try:
        config = read_config_file()
        validate_config(config)
        df = pd.read_csv('Test.csv')
        df = load_and_validate_csv(config, df)

        exam_questions, difficulty_distribution, total_score = construct_exam(config, df)

        # Print exam questions
        for i, question in enumerate(exam_questions, start=1):
            print(
                f"Question {i}: {getattr(question, 'Questions', '')} ({getattr(question, 'Question Type', '')}, {getattr(question, 'Difficulty (Easy, Medium, Hard)', '')}, Score: {getattr(question, 'Score', 0)})")

        # Print statistics
        print("\nExam Statistics:")
        print(f"Total Questions: {len(exam_questions)}")
        print(
            f"Hard Questions: {difficulty_distribution['Hard']} ({round((difficulty_distribution['Hard'] / len(exam_questions)) * 100, 2)}%)")
        print(
            f"Medium Questions: {difficulty_distribution['Medium']} ({round((difficulty_distribution['Medium'] / len(exam_questions)) * 100, 2)}%)")
        print(
            f"Easy Questions: {difficulty_distribution['Easy']} ({round((difficulty_distribution['Easy'] / len(exam_questions)) * 100, 2)}%)")
        print(f"Total Score: {total_score}")

    except Exception as e:
        print(f"An error occurred: {e}")


if __name__ == "__main__":
    main()
