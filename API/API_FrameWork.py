import requests


def framework():
    url = 'http://127.0.0.1:5000/upload'

    # Open files within the same scope as the POST request to ensure they stay open
    with open('db.config', 'rb') as config_file, \
            open('API.json', 'rb') as api_file, \
            open('Test.csv', 'rb') as csv_file:  # Optional, can be omitted if not needed
        files = {
            'db.config': config_file,
            'API.json': api_file,
            'Test.csv': csv_file  # Include this line conditionally based on whether Test.csv is actually being uploaded
        }
        try:
            response = requests.post(url, files=files)
            # Check the response outside the 'with' block since the files are no longer needed
            code = response.status_code
            msg = response.text
        except requests.exceptions.RequestException as e:
            code = 503
            msg = e

    if code == 200:
        msg = f"Files uploaded successfully with status code {msg}."
    elif code == 503:
        msg = f"Upload failed due to {msg}."
    else:
        msg = f"Upload failed with status code {msg}."

    return msg, code
