import requests


def framework():
    url = 'http://127.0.0.1:5000/upload'
    download_url = 'http://127.0.0.1:5000/download_exam'

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

    if code == 201:
        # Attempt to download Exam.xlsx
        try:
            download_response = requests.get(download_url)
            if download_response.status_code == 200:
                with open('Exam.xlsx', 'wb') as f:
                    f.write(download_response.content)
                msg = f"Files uploaded successfully with status code 200. Exam.xlsx also downloaded successfully. HTML: {msg}"
                code = 200
            else:
                msg = f"Failed to download Exam.xlsx. HTML: {msg}"
                code = 500
        except Exception as e:
            msg = f"Download failed: {e}"
            code = 500
    elif code == 200:
        msg = f"Files uploaded successfully with status code 200. HTML: {msg}"
    elif code == 503:
        msg = f"Upload failed due to HTML: {msg}."
    else:
        msg = f"Upload failed with status code {code}. HTML: {msg}"

    return msg, code
