import requests

err_codes = {
    400: "Bad Request - Failed to access database or Bad Inputs <p> Most likely either Client-Side Issue or Frontend Issue </p>",
    401: "Unauthorized Access - Incorrect password or Authentication failure <p> Most likely either Client-Side Issue or Frontend Issue </p>",
    404: "Not found - API request not correct / File Not found <p> Most likely either Client-Side Issue or Frontend Issue </p>",
    409: 'Conflict - Already exists, Duplicate entry or Resource already exists <p> <p> Most likely a Backend Issue, please report it here:  <a href="https://github.com/DefinetlyNotAI/Test-generator/issues/new/choose">Here</a> </p>',
    500: "Internal Server Error - SQLite error or Server Crash error <p> Most likely either Client-Side Issue or Frontend Issue </p>",
    503: 'Service Unavailable - Server error due to missing resources <p> Most likely a Backend Issue, please report it here:  <a href="https://github.com/DefinetlyNotAI/Test-generator/issues/new/choose">Here</a> </p>',
    520: 'Unknown error - Caught exception <p> Most likely a Backend Issue, please report it here:  <a href="https://github.com/DefinetlyNotAI/Test-generator/issues/new/choose">Here</a></p>',
}


def framework():
    """
    Sends a POST request to the specified URL with the provided files and attempts to download an Exam.xlsx file.

    Returns:
        msg (str): A message indicating the status of the operation.
        code (int): The HTTP status code of the response.
    """
    config_upload_url = "http://127.0.0.1:5000/upload"
    exam_download_url = "http://127.0.0.1:5000/download_exam"
    log_download_url = "http://127.0.0.1:5000/download_log"

    # Open files within the same scope as the POST request to ensure they stay open
    with open("db.config", "rb") as config_file, open(
        "API.json", "rb"
    ) as api_file, open(
        "Test.csv", "rb"
    ) as csv_file:  # Optional, can be omitted if not needed
        files = {
            "db.config": config_file,
            "API.json": api_file,
            "Test.csv": csv_file,
            # Include this line conditionally based on whether Test.csv is actually being uploaded
        }
        try:
            response = requests.post(config_upload_url, files=files)
            # Check the response outside the 'with' block since the files are no longer needed
            code = response.status_code
            msg = response.text
        except requests.exceptions.RequestException as e:
            code = 503
            tempMessage = 'Service Unavailable - Server error <p> Most likely a Backend Issue, please report it here:  <a href="https://github.com/DefinetlyNotAI/Test-generator/issues/new/choose">Here</a> </p>'
            msg = f"<html><body><h1>Error</h1><h2>Error Number: {code}</h2><p>{e}</p><p>{tempMessage}</p></body></html>"

    if code == 201:
        # Attempt to download Exam.xlsx
        try:
            download_response = requests.get(exam_download_url)
            if download_response.status_code == 200:
                with open("Exam.xlsx", "wb") as f:
                    f.write(download_response.content)
                code = 200
            else:
                code = 500
        except Exception as e:
            msg = e
            code = 500

    elif code == 202:
        # Attempt to download Server.log
        try:
            download_response = requests.get(log_download_url)
            if download_response.status_code == 200:
                with open("Server.log", "wb") as f:
                    f.write(download_response.content)
                code = 200
            else:
                # Handle errors based on the status code
                if download_response.status_code == 401:
                    code = 401  # Unauthorized
                    tempMessage = "Unauthorized Access - Incorrect password or Authentication failure"
                    msg = f"<html><body><h1>Error</h1><h2>Error Number: {code}</h2><p>{tempMessage}</p></body></html>"

                elif download_response.status_code == 403:
                    code = 403  # Forbidden
                    tempMessage = "Forbidden Access - Missing Authorization header"
                    msg = f"<html><body><h1>Error</h1><h2>Error Number: {code}</h2><p>{tempMessage}</p></body></html>"

                else:
                    code = 500  # Internal Server Error
                    tempMessage = "An unexpected error occurred."
                    msg = f"<html><body><h1>Error</h1><h2>Error Number: {code}</h2><p>{tempMessage}</p></body></html>"

        except Exception as e:
            msg = e
            code = 500

    if msg is None:
        msg = "An unexpected error occurred."

    return msg, code


print(framework())
