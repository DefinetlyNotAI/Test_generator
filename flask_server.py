from flask import Flask, request, render_template
import os
from DataBase import *

app = Flask(__name__)

err_codes = {
    400: "Bad Request - Failed to access database",
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
                if message is list:
                    return f"<html><body><h1>Error</h1><h2>Error Number: {message}</h2><p>{err_codes[message]}</p></body></html>", message
                else:
                    return f"<html><body><h1>Success</h1><p>{message}</p></body></html>", 200

        else:
            # Return an HTML error message with an error number
            return "<html><body><h1>Error</h1><h2>Error Number: 400</h2><p>Both Database.config and API.json files are required and cannot be empty.</p></body></html>", 400
    else:
        # Return an HTML error message with an error number
        return "<html><body><h1>Error</h1><h2>Error Number: 400</h2><p>Both Database.config and API.json files are required.</p></body></html>", 400


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=int(os.environ.get("PORT", 5000)), debug=False)
