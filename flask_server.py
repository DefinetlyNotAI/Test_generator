import os
import subprocess
from datetime import datetime
from flask import Flask, request, render_template, send_from_directory
from DataBase import database_thread


def execute_exe():
    """
    Executes the bd.exe file located at the specified path.

    This function runs the db.exe file using 'subprocess.run' and checks if the execution was successful by verifying the return code of the process.
    If the execution is successful, it prints "Execution successful." along with the decoded stdout.

    Exceptions are caught and if any error occurs during execution, it prints the error message.
    """
    # Specify the path to bd.exe. Use '.' to indicate the current directory if bd.exe is there.
    exe_path = './bd.exe'

    try:
        # Execute db.exe
        process = subprocess.run([exe_path], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        # Check if the execution was successful
        if process.returncode == 0:
            print("Execution successful.")
            print(process.stdout.decode())
    except Exception as e:
        print(f"An error occurred: {e}")


class Logger:
    def __init__(self):
        """
        Initialize the Logger class.

        This method initializes the Logger class and sets the filename attribute to 'Server.log'. It also checks if the file exists and creates it if it doesn't.

        Returns:
            None
        """
        # Define the filename
        self.filename = "Server.log"

        # Check if the file exists and create it if it doesn't
        if not os.path.exists(self.filename):
            with open(self.filename, "w"):
                pass  # Empty file content is fine here since we append logs

    @staticmethod
    def timestamp():
        """
        Get the current date and time and format it as a string in the format 'YYYY-MM-DD HH:MM:SS'.

        Returns:
            str: The formatted timestamp.
        """
        # Get the current date and time
        now = datetime.now()

        # Format the timestamp as a string
        time = f"{now.strftime('%Y-%m-%d %H:%M:%S')}"

        return time

    def error(self, message):
        """
        Writes an error message to the log file.

        Parameters:
            message (str): The error message to be written.

        Returns:
            None
        """
        with open(self.filename, "a") as f:
            f.write(f"ERROR: {message} at {self.timestamp()}\n")

    def info(self, message):
        """
        Writes an informational message to the log file.

        Parameters:
            message (str): The informational message to be written.

        Returns:
            None
        """
        with open(self.filename, "a") as f:
            f.write(f"INFO: {message} at {self.timestamp()}\n")


# Define the error codes
err_codes = {
    400: "Bad Request - Failed to access database or Bad Inputs <p> Most likely either Client-Side Issue or Frontend Issue </p>",
    401: "Unauthorized Access - Incorrect password or Authentication failure <p> Most likely either Client-Side Issue or Frontend Issue </p>",
    404: "Not found - API request not correct / File Not found <p> Most likely either Client-Side Issue or Frontend Issue </p>",
    409: 'Conflict - Already exists, Duplicate entry or Resource already exists <p> <p> Most likely a Backend Issue, please report it here:  <a href="https://github.com/DefinetlyNotAI/Test-generator/issues/new/choose">Here</a> </p>',
    500: "Internal Server Error - SQLite error or Server Crash error <p> Most likely either Client-Side Issue or Frontend Issue </p>",
    503: 'Service Unavailable - Server error due to missing resources <p> Most likely a Backend Issue, please report it here:  <a href="https://github.com/DefinetlyNotAI/Test-generator/issues/new/choose">Here</a> </p>',
    520: 'Unknown error - Caught exception <p> Most likely a Backend Issue, please report it here:  <a href="https://github.com/DefinetlyNotAI/Test-generator/issues/new/choose">Here</a></p>',
}

# Create an instance of the Logger class and Flask app
app = Flask(__name__)
base_path = os.path.dirname(os.path.realpath(__file__))
logger = Logger()  # Initialize the logger with values info, error or warning
logger.info("Flask server started")


@app.route("/")
def index():
    """
    A route handler for the root URL ("/").

    This function is responsible for rendering the "upload.html" template when the root URL is accessed.

    Returns:
        The rendered "upload.html" template.

    """
    logger.info("Index accessed")
    return render_template("upload.html")


@app.after_request
def add_security_headers(response):
    response.headers.add("X-Content-Type-Options", "nosniff")
    response.headers.add("X-Frame-Options", "SAMEORIGIN")
    response.headers.add("X-XSS-Protection", "1; mode=block")
    response.headers.add(
        "Strict-Transport-Security", "max-age=63072000; includeSubDomains; preload"
    )
    response.headers.add("Referrer-Policy", "same-origin")
    response.headers.add("Cross-Origin-Opener-Policy", "same-origin")
    return response


# Function to validate filenames
def validate_filename(filename):
    """
    Validates the filename to ensure it has a valid extension and does not contain any harmful characters.

    Parameters:
        filename (str): The name of the file to be validated.

    Returns:
        bool: True if the filename is valid, False otherwise.
    """
    allowed = {"db.config", "API.json", "Test.csv"}
    if filename not in allowed:
        logger.error(
            f"Invalid filename: {filename}. Filename must have an allowed extension."
        )
        return False
    if ".." in filename:
        return False
    return True


@app.route("/upload", methods=["POST"])
def upload_file():
    """
    Uploads files to the server.

    This function is a route handler for the '/upload' endpoint. It expects a POST request with two files: 'db.config' and 'API.json'.

    Returns:
        An HTML message indicating success if both files are successfully uploaded and saved.
        An HTML message indicating an error if either 'db.config' or 'API.json' is missing, including an error number.
    """
    # Check if both required files are present in the request
    # Get the files from the request
    # After saving the files successfully
    config_file = request.files["db.config"]
    api_file = request.files["API.json"]
    csv_file = request.files["Test.csv"]

    # Validate filenames
    if (
            not validate_filename(config_file.filename)
            or not validate_filename(api_file.filename)
            or not validate_filename(csv_file.filename)
    ):
        logger.error(
            f"Invalid filename(s). Filename must not contain '..' and must have an allowed extension."
        )
        return (
            f"<html><body><h1>Error</h1><h2>Error Number: 400</h2><p>Invalid filename(s). Filename must not contain '..' and must have an allowed extension.</p><p>{err_codes[400]}</p></body></html>",
            400,
        )

    if (
            config_file.filename != ""
            and api_file.filename != ""
            and csv_file.filename != ""
    ):

        # Get the file names
        config_filename = os.path.basename(config_file.filename)
        api_filename = os.path.basename(api_file.filename)
        csv_filename = os.path.basename(csv_file.filename)

        # Replace any existing files
        if os.path.exists(config_filename):
            os.remove(config_filename)
        if os.path.exists(api_filename):
            os.remove(api_filename)
        if os.path.exists(csv_filename):
            os.remove(csv_filename)

        # Save the new files
        config_file.save(config_filename)
        api_file.save(api_filename)
        csv_file.save(csv_filename)

        if (
                os.path.exists("db.config")
                and os.path.exists("API.json")
                and os.path.exists("Test.csv")
        ):
            # Return an HTML success message
            message = database_thread()
            if message.startswith("ERROR"):
                # Removing 'ERROR' from the beginning of the message
                message = message.replace("ERROR", "", 1)

                parts = message.split(" && ")

                # Check if there are exactly two parts
                if len(parts) == 2:
                    # Strip spaces from the text part and convert the number part to an integer
                    error_message_key = parts[0].strip()
                    error_number = int(parts[1]) if parts[1].isdigit() else None
                else:
                    logger.error(
                        f"Invalid message format: {message} with {len(parts)} parts."
                    )
                    tempMessage = "The message does not match the expected format."
                    return (
                        f"<html><body><h1>Error</h1><h2>Error Number: 400</h2><p>{tempMessage}</p></body></html>",
                        400,
                    )

                # Checking if the error number exists in err_codes
                if error_number in err_codes:
                    # Returning an HTML response with the error number and corresponding message
                    logger.error(f"Error {error_number}: {error_message_key}")
                    return (
                        f"<html><body><h1>Error</h1><h2>Error Number: {error_number}</h2><p>{err_codes[error_number]}</p></body></html>",
                        error_number,
                    )
                else:
                    logger.error(f"Unknown error {error_number}: {error_message_key}")
                    return (
                        f"<html><body><h1>Error</h1><h2>Error Number: 501</h2><p>Unknown error - Not Defined</p></body></html>",
                        501,
                    )

            elif message.startswith("SPECIAL"):
                # This is for password generation logging, ensures the password is not logged.
                logger.info("Generated unique password")

                with open("passwords.txt", "r") as f:
                    password = f.read()
                os.remove("passwords.txt")

                return (
                    f"<html><body><h1>Success</h1>This is your new password: {password}</body></html>",
                    200,
                )

            else:
                if message.startswith("DOWNLOAD"):
                    logger.info(f"Success: {message}")
                    return (
                        f"<html><body><h1>Success</h1>{message.replace('DOWNLOAD', '', 1)}</body></html>",
                        201,
                    )
                elif message == "LOG":
                    logger.info(f"Successfully received request to download log")
                    return (
                        f"<html><body><h1>Success</h1>{message.replace('SUCCESS', '', 1)}</body></html>",
                        202,
                    )
                else:
                    logger.info(f"Successfully downloaded exam")
                    return f"<html><body><h1>Success</h1>{message}</body></html>", 200
        else:
            logger.error(
                "db.config, Test.csv and API.json files are required and cannot be empty."
            )
            return (
                f"<html><body><h1>Error</h1><h2>Error Number: 404</h2><p>db.config, Test.csv and API.json files are required and cannot be empty.</p><p>{err_codes[404]}</p></body></html>",
                404,
            )
    else:
        logger.error(
            "db.config, Test.csv and API.json files are required and cannot be empty."
        )
        return (
            f"<html><body><h1>Error</h1><h2>Error Number: 404</h2><p>db.config, Test.csv and API.json files are required and cannot be empty.</p><p>{err_codes[404]}</p></body></html>",
            404,
        )


@app.route("/download_exam", methods=["GET"])
def download_exam():
    """
    Serves the Exam.xlsx file for download.
    """
    # Define the path for the Exam.xlsx file
    exam_path = os.path.join(base_path, "Exam.xlsx")

    # Check if the file exists before attempting to send it
    if os.path.exists(exam_path):
        return send_from_directory(directory=base_path, path="Exam.xlsx")
    else:
        logger.error("Exam.xlsx does not exist.")
        return (
            f"<html><body><h1>Error</h1><h2>Error Number: 404</h2><p>Exam.xlsx does not exist.</p></body></html>",
            404,
        )


@app.route("/download_log", methods=["GET"])
def download_log():
    """
    Serves the Server.log file for download, accessible only to admin users.
    """

    # Define the path for the Server.log file
    log_path = os.path.join(base_path, "Server.log")

    # Check if the file exists before attempting to send it
    if os.path.exists(log_path):
        return send_from_directory(directory=base_path, path="Server.log")
    else:
        return (
            f"<html><body><h1>Error</h1><h2>Error Number: 404</h2><p>Server.log does not exist.</p></body></html>",
            404,
        )


if __name__ == "__main__":
    execute_exe()
    app.run(host="127.0.0.1", port=int(os.environ.get("PORT", 5000)), debug=False)
