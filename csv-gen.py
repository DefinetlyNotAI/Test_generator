#!/usr/bin/env python3

# CSV Generator for Exam Maker Testing or Debugging.
# Not for consumer use.

import csv
import random
import os


# Function to generate scores with a preference for smaller numbers
def generate_score():
    return random.randint(1, 2)  # Prefer smaller numbers


# Generate questions from q0001 to q9999
questions = [f'q{str(i).zfill(4)}' for i in range(1, 10000)]

# Shuffle types to ensure randomness
types = ['t{}'.format(i) for i in range(1, 10)]
random.shuffle(types)

# Step 1: Delete Test.csv if it exists
if os.path.exists("Test.csv"):
    os.remove("Test.csv")

# Step 2: Create Test.csv
with open('Test.csv', 'w', newline='') as file:
    writer = csv.writer(file)
    # Step 3: Add headers
    writer.writerow(["Questions", "Question Type", "Difficulty (Easy, Medium, Hard)", "Score"])

# Step 4: Ask for the number of new lines to add
num_lines = int(input("Enter the number of new lines to add: "))
while num_lines < 0 or num_lines >= 10000:
    print("Invalid input. Please enter a number between 0 and 9999.")
    num_lines = int(input("Enter the number of new lines to add: "))

# Initialize current question index
current_question_index = 0

# Step 5: Add the specified lines of random info
for _ in range(num_lines):
    question = questions[current_question_index]  # Use the current question index
    question_type = random.choice(types)
    difficulty = random.choice(['Hard', 'Easy', 'Medium'])
    score = generate_score()

    # Increment the current question index
    current_question_index += 1

    with open('Test.csv', 'a', newline='') as file:
        writer = csv.writer(file)
        writer.writerow([question, question_type, difficulty, score])

print("Data has been added successfully.")
