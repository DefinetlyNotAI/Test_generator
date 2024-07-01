# Exam Generator Server Project Documentation

## Introduction

The Exam Generator Server is a Python-based web application designed to facilitate the creation and management of exams.
It integrates with a SQLite database to store user information and preferences,
processes configuration and question files, and generates exams based on specified criteria.

## Getting Started

To get started with the Exam Generator Server, ensure you have Python 3.x installed on your system. 
Additionally, you'll need to install Flask and other dependencies listed below.

### Prerequisites
- Python 3.x
- Flask
- sqlite3
- pandas
- secrets
- string
- sqlite3
- configparser
- csv
- json
- os.path
- random
- time

All of this is found in the `requirements.txt` file.

### Installation

Clone the repository or download the source code to your local machine. 
Navigate to the project directory and install the required dependencies using pip:

```bash
pip install -r requirements.txt
```

## Usage

The server operates via a Flask web application. To start the server, execute the following command:

```bash
waitress-serve --listen=*:5000 wsgi_server:app
```

The server will listen on `localhost` (127.0.0.1) and port `5000` unless configured otherwise.

### Key Features

- **File Uploads**: Supports uploading of `db.config`, `API.json`, and `Test.csv` files.
- **Database Management**: Interacts with a SQLite database to manage user accounts and preferences.
- **Exam Generation**: Generates exams based on the uploaded question file and configuration settings.
- **Error Handling**: Implements standardized error messages and HTTP status codes for various scenarios.

## Design Decisions

### Modular Approach

The project adopts a modular approach, organizing code into distinct modules for better maintainability and scalability.
For instance, the `UserManager` class encapsulates all database interactions, 
simplifying the management of database connections and queries.

### Centralized Error Handling

Centralized error handling is implemented through the `err_codes` dictionary, 
providing a consistent way to communicate errors to the client. 
This approach enhances the user experience by presenting clear and understandable error messages.

### Secure Password Storage

Passwords are securely generated and stored using the `secrets` and `sqlite3` library into the `users.db` database,
ensuring that user data remains protected.

## Code Structure

The project is divided into several modules:

- `DataBase.py`: Utility functions for processing configuration files, reading question files, and generating exams.
- - `UserManager`: Manages database operations, including user creation, verification, and preference updates.
- `flask_server.py`: Entry point of the application, defining the Flask server and routes.
- `wsgi_server.py`: WSGI server that serves the Flask application.

## Contributing

Contributions to the Exam Generator Server are welcome. 
Please review the CONTRIBUTING.md file for guidelines on submitting pull requests.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

## Contact

For inquiries or contributions, please contact Shahm Najeeb at Nirt_12023@outlook.com.
