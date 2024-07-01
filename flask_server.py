from flask import Flask, request, render_template
import os
from DataBase import *

app = Flask(__name__)

err_codes = {
    400: "Bad Request - Failed to access database or Bad Inputs",
    401: "Unauthorized Access - Incorrect password",
    404: "Not found - API request not correct/not found",
    409: "Conflict - Already exists",
    500: "Internal Server Error - SQLite",
    520: "Unknown error - Caught exception"
}


@app.route('/')
def index():
    return render_template('upload.html')


@app.route('/upload', methods=['POST'])
def upload_file():
    """
    Uploads files to the server.

    This function is a route handler for the '/upload' endpoint. It expects a POST request with two files: 'Database.config' and 'API.json'.

    Returns:
        An HTML message indicating success if both files are successfully uploaded and saved.
        An HTML message indicating an error if either 'Database.config' or 'API.json' is missing, including an error number.
    """
    # Check if both required files are present in the request
    if 'Database.config' in request.files and 'API.json' in request.files:
        # Get the files from the request
        config_file = request.files['Database.config']
        api_file = request.files['API.json']

        # Validate file size to ensure they are not empty
        if config_file.filename != '' and api_file.filename != '':
            # Define the path for saving the files in the current working directory
            base_path = os.path.dirname(os.path.abspath(__file__))
            config_path = os.path.join(base_path, 'Database.config')
            api_path = os.path.join(base_path, 'API.json')

            # Replace any existing files
            if os.path.exists(config_path):
                os.remove(config_path)
            if os.path.exists(api_path):
                os.remove(api_path)

            # Save the new files
            config_file.save(config_path)
            api_file.save(api_path)

            # Return an HTML success message
            if os.path.exists('Database.config') and os.path.exists('API.json'):
                message = database_thread()
                if message.startswith('LIST'):
                    # Removing 'LIST' from the beginning of the message
                    message = message.replace('LIST', '', 1)

                    # Splitting the message by comma to create a list
                    message_list = message.split('&&')

                    # Using the second element as the error number and the first element as the code message
                    error_number = int(message_list[1].strip())
                    error_message_key = message_list[0].strip() if len(message_list) > 1 else None

                    # Checking if the error number exists in err_codes
                    if error_number in err_codes:
                        # Returning an HTML response with the error number and corresponding message
                        return f"<html><body><h1>Error</h1><h2>Error Number: {error_number}</h2><p>{error_message_key}</p><p>{err_codes[error_number]}</p></body></html>", error_number
                    else:
                        # Returning an HTML response for unknown errors
                        return f"<html><body><h1>Error</h1><h2>Error Number: 501</h2><p>Unknown error - Not Defined</p></body></html>", 501
                else:
                    return f"<html><body><h1>Success</h1>{message}</body></html>", 200
        else:
            # Return an HTML error message with an error number
            return f"<html><body><h1>Error</h1><h2>Error Number: 400</h2><p>Both Database.config and API.json files are required and cannot be empty.</p><p>{err_codes[400]}</p></body></html>", 400
    else:
        # Return an HTML error message with an error number
        return f"<html><body><h1>Error</h1><h2>Error Number: 400</h2><p>Both Database.config and API.json files are required.</p><p>{err_codes[400]}</p></body></html>", 400


if __name__ == '__main__':
    app.run(host='127.0.0.1', port=int(os.environ.get("PORT", 5000)), debug=False)
