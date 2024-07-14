# wsgi_server.py
import subprocess
from werkzeug.middleware.proxy_fix import ProxyFix
from flask_server import app  # Import your Flask app


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


app.wsgi_app = ProxyFix(
    app.wsgi_app
)

if __name__ == "__main__":
    execute_exe()
    app.run()
