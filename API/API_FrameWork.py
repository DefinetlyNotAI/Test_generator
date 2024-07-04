import requests


def framework():
    """
    Sends a POST request to the specified URL with the provided files and attempts to download an Exam.xlsx file.

    Returns:
        msg (str): A message indicating the status of the operation.
        code (int): The HTTP status code of the response.
    """
    url = "http://127.0.0.1:5000/upload"
    download_url = "http://127.0.0.1:5000/download_exam"

    # Open files within the same scope as the POST request to ensure they stay open
    with open("db.config", "rb") as config_file, open(
        "API.json", "rb"
    ) as api_file, open(
        "Test.csv", "rb"
    ) as csv_file:  # Optional, can be omitted if not needed
        files = {
            "db.config": config_file,
            "API.json": api_file,
            "Test.csv": csv_file,  # Include this line conditionally based on whether Test.csv is actually being uploaded
        }
        try:
            response = requests.post(url, files=files)
            # Check the response outside the 'with' block since the files are no longer needed
            code = response.status_code
            msg = response.text
        except requests.exceptions.RequestException as e:
            code = 503
            tempMessage = 'Service Unavailable - Server error <p> Most likely a Backend Issue, please report it here:  <a href="https://github.com/DefinetlyNotAI/Test-generator/issues/new/choose">Here</a> </p>'
            msg = f"<html><body><h1>Error</h1><h2>Error Number: {code}</h2><p>{e}</p>{tempMessage}<p></p></body></html>"

    if code == 201:
        # Attempt to download Exam.xlsx
        try:
            download_response = requests.get(download_url)
            if download_response.status_code == 200:
                with open("Exam.xlsx", "wb") as f:
                    f.write(download_response.content)
                code = 200
            else:
                code = 500
        except Exception as e:
            msg = e
            code = 500

    return msg, code
