from flask import Flask, request, render_template
import os

app = Flask(__name__)


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
            return "<html><body><h1>Success</h1><p>Both files were uploaded and saved successfully.</p></body></html>"
        else:
            # Return an HTML error message with an error number
            return "<html><body><h1>Error</h1><h2>Error Number: 400</h2><p>Both Database.config and API.json files are required and cannot be empty.</p></body></html>"
    else:
        # Return an HTML error message with an error number
        return "<html><body><h1>Error</h1><h2>Error Number: 400</h2><p>Both Database.config and API.json files are required.</p></body></html>"


if __name__ == '__main__':
    app.run(debug=True)
