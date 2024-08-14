import csv
import json
import os.path
import random
import secrets
import sqlite3
import string
import time
import colorlog
import pandas as pd
from datetime import datetime

# TODO
#  verbosely add comments,
#  For each API get its complexity

# Configure colorlog for logging messages with colors
logger = colorlog.getLogger()
logger.setLevel(colorlog.INFO)  # Set the log level to INFO to capture all relevant logs

handler = colorlog.StreamHandler()
formatter = colorlog.ColoredFormatter(
    "%(log_color)s%(levelname)-8s%(reset)s %(blue)s%(message)s",
    datefmt=None,
    reset=True,
    log_colors={
        "DEBUG": "cyan",
        "INFO": "green",
        "WARNING": "yellow",
        "ERROR": "red",
        "CRITICAL": "red,bg_white",
    },
)
handler.setFormatter(formatter)
logger.addHandler(handler)


class SQL:
    def __init__(self, db_name="users.db"):
        """
        Initializes the SQL class.

        Args:
            db_name (str, optional): The name of the database. Defaults to "users.db".
        """
        # Set the database name
        self.db_name = db_name

        # Initialize the connection and cursor to None
        self.conn = None
        self.cursor = None

    def __connect(self):
        """
        Establishes a connection to the SQLite database.

        If a connection does not already exist, this method creates a new connection
        and sets the cursor object.
        """
        # Check if a connection has already been established
        if self.conn is None:
            colorlog.debug("Connecting to SQLite database...")
            # Create a new connection to the SQLite database
            self.conn = sqlite3.connect(self.db_name)
            # Set the cursor object for the connection
            self.cursor = self.conn.cursor()

    def __disconnect(self):
        """
        Closes the existing database connection and resets the connection and cursor objects.

        This method is used to disconnect from the SQLite database when it is no longer needed.
        """
        # Check if a connection has already been established
        if self.conn:
            colorlog.debug("Disconnecting from SQLite database...")
            # Close the existing connection to the SQLite database
            self.conn.close()
            # Reset the connection object to None
            self.conn = None
            # Reset the cursor object to None
            self.cursor = None

    def __add_exclusion_db(self, name: str, exclusion_titles: list[str], password: str) -> bool | None:
        """
        Adds new titles to exclude for a user in the database.

        Args:
            name (str): The username of the user.
            exclusion_titles (list[str]): The titles to exclude.
            password (str): The password for the user. If not provided, the function will verify the password using the stored password.

        Returns:
            str: A success or error message.
        """
        try:
            # Verify the password
            if self.verify_password(name, password):
                self.__connect()
                try:
                    # Execute a SELECT statement to get the existing titles to exclude for the user
                    self.cursor.execute(
                        """SELECT titles_to_exclude FROM Users WHERE username=?""",
                        (name,),
                    )
                    result = self.cursor.fetchone()

                    # If no result is found or the result is None, set initial_titles to "PLACEHOLDER"
                    if result is None or result[0] is None:

                        initial_titles = "PLACEHOLDER"
                    else:
                        initial_titles = result[0]

                    # Strip the whitespace from the initial_titles
                    current_titles = initial_titles.strip()

                    # Convert current_titles and titles to sets for easier set operations
                    current_titles_set = set(current_titles.split(","))
                    titles_set = set(exclusion_titles)

                    # Find the new titles to exclude
                    new_titles_set = titles_set - current_titles_set

                    # If there are new titles to exclude, update the titles_to_exclude field in the database
                    if new_titles_set:

                        updated_titles = ",".join(list(new_titles_set))
                        self.cursor.execute(
                            """UPDATE Users SET titles_to_exclude = COALESCE(titles_to_exclude ||?, '') WHERE username =?""",
                            (updated_titles, name),
                        )
                        self.conn.commit()
                        log.info(f"Successfully updated titles for user {name}.")
                        return True
                    else:
                        log.warning(f"No new titles to add for user {name}.")
                        return False

                except Exception as e:
                    log.error(f"An error occurred while adding exclusion titles. as {e} [500x3]")
                    return False
            else:
                log.error(f"Password is incorrect for user {name}.")
                return False
        except Exception as e:
            log.error(f"An error occurred while adding exclusion titles. as {e} [500x4]")
            return False

    @staticmethod
    def create_db_initial():
        """
        Creates the initial database schema by dropping and recreating the 'Users' table.

        This method establishes a connection to the SQLite database, drops the 'Users' table if it exists,
        creates a new 'Users' table with the required columns, and then closes the connection.
        """
        colorlog.debug("Creating initial database schema...")
        # Establish a connection to the SQLite database
        conn = sqlite3.connect("users.db")
        # Create a cursor object for the connection
        cursor = conn.cursor()

        # Drop the 'Users' table if it exists
        cursor.execute("""DROP TABLE IF EXISTS Users;""")

        # Create a new 'Users' table with the required columns
        cursor.execute(
            """CREATE TABLE Users (
                            id INTEGER PRIMARY KEY,
                            username TEXT NOT NULL UNIQUE,
                            password TEXT NOT NULL,
                            titles_to_exclude TEXT);"""
        )

        # Commit the changes to the database
        conn.commit()
        # Close the connection to the database
        conn.close()

    def verify_password(self, username, password) -> bool:
        """
        Verifies the password for a given username.

        Args:
            username (str): The username to verify the password for.
            password (str): The password to verify.
        """
        try:
            colorlog.debug(f"Verifying password of {username}")
            # Establish a connection to the database
            self.__connect()

            # Query the database to retrieve the stored password for the given username
            self.cursor.execute(
                "SELECT password FROM Users WHERE username=?", (username,)
            )

            # Fetch the query result
            result = self.cursor.fetchone()

            # Close the database connection
            self.__disconnect()

            # Check if a result was found
            if result:
                # Extract the stored password from the result
                stored_password = result[0]

                # Compare the provided password with the stored password
                if password == stored_password:
                    # Return True if the passwords match
                    return True

            # Return False if no result was found or the passwords do not match
            return False
        except Exception as e:
            # Log any errors that occur during the verification process
            log.info(f"An error occurred while verifying the password. as {e}")
            # Return False if an error occurs
            return False

    def create_db(self, username, exclusion_titles, password=None) -> bool:
        """
        Creates a new database entry for a user.

        Args:
            username (str): The username for the new user.
            exclusion_titles (list): A list of titles to exclude.
            password (str, optional): The password for the new user. If not provided, a random password will be generated.
        """
        try:
            colorlog.debug(f"Creating database entry for {username}")
            # Connect to the database
            self.__connect()

            # Check if the username already exists
            self.cursor.execute("SELECT * FROM users WHERE username=?", (username,))
            existing_user = self.cursor.fetchone()
            self.__disconnect()

            # Generate a random password if one is not provided
            alphabet = string.ascii_letters + string.digits
            if password is None:
                password_new = "".join(secrets.choice(alphabet) for _ in range(12))
            else:
                password_new = password

            # Check if the username already exists
            if existing_user:
                log.warning(f"Username already exists: {username}")
                return False

            # Create a new database entry for the user
            self.__connect()
            self.cursor.execute(
                "INSERT INTO users (username, password) VALUES (?,?)",
                (username, password_new),
            )
            self.conn.commit()
            self.__disconnect()

            # Write the new password to a file
            with open("passwords.txt", "w") as f:
                f.write(password_new)

            # Add exclusion titles to the database
            sql.add_exclusion_db(username, exclusion_titles, password_new, "CDB")

            log.info("Password Successfully Made")
            return True
        except Exception as e:
            # Return an error message if an exception occurs
            log.error(f"An error occurred while creating the database entry. as {e} [500x1]")
            return False

    def remove(self, username: str, password: str) -> bool:
        """
        Removes a user from the database if the provided username and password match.

        Args:
            username (str): The username of the user to be removed.
            password (str): The password of the user to be removed.

        Returns:
            bool: A success for true or error for false.
        """
        try:
            colorlog.debug(f"Removing data for {username}")
            # Connect to the database
            self.__connect()

            # Check if the user exists
            self.cursor.execute("SELECT * FROM Users WHERE username=?", (username,))
            user_exists = self.cursor.fetchone()

            # Disconnect from the database
            self.__disconnect()

            if not user_exists:
                # Return an error message if the user does not exist
                log.warning(f"User does not exist: {username}")
                return False

            if self.verify_password(username, password):
                # Connect to the database again
                self.__connect()

                # Delete the user from the database
                self.cursor.execute("DELETE FROM Users WHERE username=?", (username,))
                self.conn.commit()

                # Disconnect from the database
                self.__disconnect()

                # Return a success message
                log.info(f"Successfully removed data for {username}")
                return True
            else:
                # Return an error message if the password is incorrect
                log.error(f"Password is incorrect for {username}")
                return False
        except Exception as e:
            # Return an error message if an exception occurs
            log.error(f"An error occurred while removing the database entry. as {e} [500x2]")
            return False

    @staticmethod
    def add_exclusion_db(name, exclusion_titles, password, special=None) -> bool:
        """
        Adds an exclusion database with the given name, titles, and password.

        Args:
            name (str): The name of the exclusion database.
            exclusion_titles (list): A list of titles for the exclusion database.
            password (str): The password for the exclusion database.
            special (str, optional): A special parameter. Defaults to None.
        """
        colorlog.debug(f"Adding exclusion titles for {name}")
        try:

            # Attempt to add the exclusion database
            value = sql.__add_exclusion_db(name, exclusion_titles, password)

            # Check if the operation was successful
            if value is False:
                return False

            # If special is not provided, add a default value
            if not special:
                # Add a default value to the exclusion database
                msg = sql.__add_exclusion_db(name, [","], password)
                # Check if the operation was successful
                if msg is False:
                    return False

            # Return the result of the operation
            return value

        except Exception as e:
            # Return an error message if an exception occurs
            log.error(f"An error occurred while adding exclusion titles. as {e} [500x1]")
            return False

    def get_excluded_titles(self, username) -> list[str] | bool:
        """
        Retrieves the excluded titles for a given username from the database.

        Args:
            username (str): The username to retrieve excluded titles for.
        """
        try:
            colorlog.debug(f"Retrieving excluded titles for {username}")
            # Establish a connection to the database
            self.__connect()

            # Execute a query to retrieve the excluded titles for the given username
            self.cursor.execute(
                """SELECT titles_to_exclude FROM Users WHERE username=?""", (username,)
            )

            # Fetch the result of the query
            result = self.cursor.fetchone()

            # Close the database connection
            self.__disconnect()

            # If a result was found, process it
            if result:
                # Split the result into a list of titles
                titles_list = result[0].split(",")

                # Strip any leading or trailing whitespace from each title
                titles_to_exclude = [title.strip() for title in titles_list]
            else:
                # If no result was found, return an empty list
                titles_to_exclude = []

            # Return the list of excluded titles
            return titles_to_exclude
        except Exception as e:
            # If an error occurs, return an error message
            log.error(f"An error occurred while retrieving excluded titles. as {e} [500x2]")
            return False


class LOG:
    def __init__(self, filename="Server.log"):
        """
        Initializes a new instance of the LOG class.

        Args:
            filename (str): The name of the log file. Defaults to "Server.log".

        Returns:
            None
        """
        self.filename = str(filename)
        if not os.path.exists(self.filename):
            with open(self.filename, "w") as log_file:
                log_file.write(
                    "|-----Timestamp-----|--LOG Level--|-----------------------------------------------------------------------LOG Messages-----------------------------------------------------------------------|\n"
                )
                pass

    @staticmethod
    def __timestamp():
        """
        Returns the current timestamp as a string in the format 'YYYY-MM-DD HH:MM:SS'.

        Returns:
            str: The current timestamp.
        """
        now = datetime.now()
        time = f"{now.strftime('%Y-%m-%d %H:%M:%S')}"
        return time

    def info(self, message):
        """
        Logs an informational message to the log file.

        Args:
            message (str): The message to be logged.

        Returns:
            None
        """
        colorlog.info(message)
        with open(self.filename, "a") as f:
            f.write(f"[{self.__timestamp()}] > INFO:       {message}\n")

    def warning(self, message):
        """
        Logs a warning message to the log file.

        Args:
            message (str): The warning message to be logged.

        Returns:
            None
        """
        colorlog.warning(message)
        with open(self.filename, "a") as f:
            f.write(f"[{self.__timestamp()}] > WARNING:    {message}\n")

    def error(self, message):
        """
        Logs an error message to the log file.

        Args:
            message (str): The error message to be logged.

        Returns:
            None
        """
        colorlog.error(message)
        with open(self.filename, "a") as f:
            f.write(f"[{self.__timestamp()}] > ERROR:      {message}\n")

    def critical(self, message):
        """
        Writes a critical message to the log file.

        Args:
            message (str): The critical message to be logged.

        Returns:
            None
        """
        colorlog.critical(message)
        with open(self.filename, "a") as f:
            f.write(f"[{self.__timestamp()}] > CRITICAL:   {message}\n")


def DATABASE() -> bool:

    def read_config() -> tuple[int, int, int, int, int, int, bool, str, str, str, list[str]] | bool:
        try:
            with open("config.json") as f:
                config = json.load(f)

            min_titles = config["minimum_titles"]
            hard = config["hard_data_to_use"]
            med = config["medium_data_to_use"]
            easy = config["easy_data_to_use"]
            points = config["total_points"]
            debug = config["use_debug_(ONLY_IF_YOU_DEVELOPED_THIS!)"]
            api = config["api"]
            username = config["username"]
            password = config["password"]
            exclusion_titles = config["exclusion_titles"]
            questions_amount = hard + med + easy
            if isinstance(questions_amount, int) and isinstance(min_titles, int) and isinstance(hard,
                                                                                                int) and isinstance(med,
                                                                                                                    int) and isinstance(
                    easy, int) and isinstance(points, int) and isinstance(debug, bool) and isinstance(api,
                                                                                                      str) and isinstance(
                    username, str) and isinstance(password, str) and isinstance(exclusion_titles, list):
                return questions_amount, min_titles, hard, med, easy, points, debug, api, username, password, exclusion_titles
            else:
                log.critical("Invalid config file parameters.")
                return False
        except FileNotFoundError as fnfe:
            log.critical(f"File not found: {fnfe}")
            return False
        except Exception as e:
            log.error(f"Unexpected error: {e}")
            return False

    def exam_generator(username) -> bool:

        def read_csv() -> list[list[str]] | bool:
            try:
                colorlog.debug("Reading CSV file...")
                questions = []
                with open("Data.csv", mode="r", encoding="utf-8") as file:
                    reader = csv.reader(file)
                    next(reader)
                    for row in reader:
                        indices_to_check = []

                        for i in range(len(row)):
                            if i != 4:
                                indices_to_check.append(i)

                        if not all(
                                value.strip() for value in (row[i] for i in indices_to_check)
                        ):
                            # TODO make it say which line
                            log.critical("Empty value found in CSV. && 400x1")
                            return False

                        difficulty = row[2].strip()
                        if difficulty not in ["Hard", "Medium", "Easy"]:
                            log.critical(f"Invalid difficulty level: {difficulty} at line {reader.line_num}. && 400x2")
                            return False
                        try:
                            score = int(row[3].strip())
                        except ValueError:
                            log.critical(f"Invalid score format at line {reader.line_num}: {row[3]}. && 400x3")
                            return False
                        if not 0 <= score <= 100:
                            log.critical(f"Invalid score range at line {reader.line_num}: {score}. && 400x4")
                            return False

                        url_column_index = (
                            4
                        )
                        url = (
                            row[url_column_index].strip()
                            if url_column_index < len(row)
                            else None
                        )

                        questions.append(
                            [*row[:url_column_index], url]
                        )
                return questions
            except FileNotFoundError as fnfe:
                log.critical(f"File not found: {fnfe}")
                return False
            except Exception as e:
                log.error(f"Unexpected error: {e}")
                return False

        def generate_data(questions, exclude_list) -> tuple[list[list[str]], int, dict[str, float], list[str]] | bool:
            try:
                while True:
                    if not questions:
                        questions = read_csv()
                        if questions is False:
                            return False

                    exam = []
                    total_points = 0
                    total_titles = []
                    difficulty_counts = {"Hard": 0, "Medium": 0, "Easy": 0}

                    excluded_titles = [title.strip() for title in exclude_list[0].split(",")]

                    filtered_data = [q for q in questions if q[1] not in excluded_titles]

                    for i in range(TOTAL_DATA_AMOUNT):
                        if not filtered_data:
                            break
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
                            )
                            title_value = selected_question[1]
                            if title_value not in total_titles:
                                total_titles.append(title_value)

                    if len(exam) != TOTAL_DATA_AMOUNT:
                        continue

                    total_difficulties = sum(difficulty_counts.values())
                    if total_difficulties == 0:
                        return False

                    difficulty_ratios = {
                        k: v / total_difficulties * 100 for k, v in difficulty_counts.items()
                    }

                    if total_points != TOTAL_POINTS:
                        continue
                    if len(total_titles) < MINIMUM_TYPES:
                        continue
                    break

                return exam, total_points, difficulty_ratios, total_titles
            except Exception as e:
                log.error(f"Unexpected error: {e}")
                return False

        def create_excel() -> bool:
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

                df = pd.DataFrame(data, columns=headers)

                df.to_excel("Exam.xlsx", index=False)

                os.remove("Exam.txt")

                return True
            except FileExistsError as fnfe:
                log.critical(f"File not found: {fnfe}")
                return False
            except Exception as e:
                log.error(f"Unexpected error: {e}")
                return False

        questions = read_csv()
        if questions is False:
            return False

        try:
            Exclude_list = sql.get_excluded_titles(username)
            if Exclude_list is False:
                return False

            temp = generate_data(questions, Exclude_list)
            if temp is False:
                return False
            else:
                exam, total_points, difficulty_ratios, total_titles = temp

            if os.path.exists("Exam.txt"):
                os.remove("Exam.txt")

            with open("Exam.txt", "w") as file:
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
            if msg is False:
                return False

            log.info("Exam Generated and saved to Exam.xlsx")
            colorlog.debug("Exam Generation information:")
            colorlog.debug(f"Total Points in exam: {total_points}")
            colorlog.debug(f"Number of Questions Included in exam: {len(exam)}")
            colorlog.debug(f"Total Titles Used in exam: {len(total_titles)}")
            colorlog.debug(
                f"Difficulty Ratio used: Hard: {round(difficulty_ratios['Hard'], 2)}%, Medium: {round(difficulty_ratios['Medium'], 2)}%, Easy: {round(difficulty_ratios['Easy'], 2)}%")
            return True
        except Exception as e:
            log.error(f"Unexpected error: {e}")
            return False

    try:
        config_data = read_config()
        if config_data is False:
            return False
        else:
            global TOTAL_DATA_AMOUNT, MINIMUM_TYPES, HARD_DATA_AMOUNT, MEDIUM_DATA_AMOUNT, EASY_DATA_AMOUNT, TOTAL_POINTS, DEBUG_DB
            TOTAL_DATA_AMOUNT, MINIMUM_TYPES, HARD_DATA_AMOUNT, MEDIUM_DATA_AMOUNT, EASY_DATA_AMOUNT, TOTAL_POINTS, DEBUG_DB, API, USERNAME, PASSWORD, EXCLUDE = config_data

        if API == "REC":
            log.info(f"A request has been made to generate an exam by the user {USERNAME}")
            if sql.verify_password(USERNAME, PASSWORD):
                if exam_generator(USERNAME):
                    log.info("Exam generated successfully based on the request")
                else:
                    log.error("Failed to generate exam")
            else:
                log.error("Wrong password given")
                return False

        elif API == "RUG":
            log.info(f"A request has been made to create a new user by the following username {USERNAME}")
            if sql.create_db(USERNAME, EXCLUDE):
                log.info("User created successfully based on the request")
            else:
                log.error(f"Failed to create user {USERNAME}")

        elif API == "RUD":
            log.info(
                f"A request has been made to add the following exclusion titles {EXCLUDE} to the database for user {USERNAME}")
            if sql.add_exclusion_db(USERNAME, EXCLUDE, PASSWORD):
                log.info("Exclusion titles added successfully based on the request")
            else:
                log.error("Failed to add exclusion titles to database")

        elif API == "RUR":
            log.info(f"A request has been made to remove the user {USERNAME} from the database")
            if sql.remove(USERNAME, PASSWORD):
                log.info("User removed successfully based on the request")
            else:
                log.error(f"Failed to remove {USERNAME} from database")

        else:
            log.critical("Invalid API")
    except Exception as e:
        log.error(f"Unexpected error occurred: {e}")
        return False


sql = SQL(db_name="users.db")
log = LOG(filename="DataBase.log")
if not os.path.exists("users.db"):
    log.info("Creating user database from scratch using SQLite")
    sql.create_db_initial()
if not os.path.exists("cat") or not os.path.exists(".core/.ps1") or not os.path.exists(".core/.py"):
    exit('Core files not found.')
elif os.path.getsize(".core/.ps1") == 0 or os.path.getsize("cat") == 0 or os.path.getsize(".core/.py") == 0:
    exit('Core files empty.')
log.info("Database loaded successfully.")
