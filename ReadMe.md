# Exam Generator

**Exam Generator** is a Python application designed to create exams based on predefined criteria from a CSV file and a configuration file. It allows for the generation of exams with varying difficulties, ensuring a balanced mix of hard, medium, and easy questions, according to specified percentages. The tool also ensures that the total points and the number of questions meet the requirements set in the configuration file.

<div align="center">
    <a href="https://github.com/DefinetlyNotAI/Test-generator/issues"><img src="https://img.shields.io/github/issues/DefinetlyNotAI/Test-generator" alt="GitHub Issues"></a>
    <a href="https://github.com/DefinetlyNotAI/Test-generator/tags"><img src="https://img.shields.io/github/v/tag/DefinetlyNotAI/Test-generator" alt="GitHub Tag"></a>
    <a href="https://github.com/DefinetlyNotAI/Test-generator/graphs/commit-activity"><img src="https://img.shields.io/github/commit-activity/t/DefinetlyNotAI/Test-generator" alt="GitHub Commit Activity"></a>
    <a href="https://github.com/DefinetlyNotAI/Test-generator/languages"><img src="https://img.shields.io/github/languages/count/DefinetlyNotAI/Test-generator" alt="GitHub Language Count"></a>
    <a href="https://github.com/DefinetlyNotAI/Test-generator/actions"><img src="https://img.shields.io/github/check-runs/DefinetlyNotAI/Test-generator/main" alt="GitHub Branch Check Runs"></a>
    <a href="https://github.com/DefinetlyNotAI/Test-generator"><img src="https://img.shields.io/github/repo-size/DefinetlyNotAI/Test-generator" alt="GitHub Repo Size"></a>
</div>

## Features

- **CSV File Processing**: Reads questions from a CSV file, validating each entry for correctness and completeness.
- **Configuration File Handling**: Parses a configuration file to determine exam parameters such as the number of questions, difficulty ratios, and point values.
- **Exam Generation**: Dynamically generates exams based on the input files, ensuring adherence to the specified criteria.
- **Output Management**: Saves the generated exam to a text file, providing a clear and concise output format.

## Getting Started

To get started with **Exam Generator**, ensure you have Python installed on your system. Clone the repository or download the source code and navigate to the project directory.

### Prerequisites

- Python 3.x
- A CSV file (`Test.csv`) containing exam questions (One has been preset for you).
- A configuration file (`.config`) specifying exam parameters (One has been preset for you, all you need to do is fill in the numbers).

### Installation

This project is intended to be run directly without installation.
Ensure you have Python installed and then execute the script via the command line `python3 Test_Generator.py`.

Finally, you can clone into the project repository and run the script by executing the following command: `git clone https://github.com/DefinetlyNotAI/Test-generator.git`

## Usage

1. Place your `Test.csv` file in the project directory, containing your exam questions formatted correctly.
2. Create a configuration file (`.config` or `config.ini`) in the same directory, specifying your desired exam parameters.
3. Run the script. The generated exam will be saved as `Exam.txt`.

## Contributing

Contributions are welcome to the project. Feel free to submit a pull request or open an issue to discuss potential improvements or bugs.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
