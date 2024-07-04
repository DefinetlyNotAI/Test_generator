import subprocess
import sys


def install_requirements():
    """
    Install the requirements specified in the `requirements.txt` file.

    This function uses the `subprocess.check_call()` method to run the command
    `pip install -r requirements.txt` using the Python executable.

    If the installation is successful, a message is printed indicating that
    the requirements were installed successfully.

    If an exception of type `subprocess.CalledProcessError` is raised, the
    function catches the exception and prints a message indicating that the
    installation failed. The function then exits with a status code of 1.

    If any other type of exception is raised, the function catches the
    exception and prints a message indicating that the installation failed.

    This function does not return any value.

    """
    try:
        print("Installing requirements...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", "-r", "requirements.txt"])
        print("Requirements installed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to install requirements: {e}")
        exit(1)
    except Exception as e:
        print(f"Failed to install requirements: {e}")


def install_pipx_and_ensure_path():
    """
    A function that installs pipx and ensures its path.

    This function attempts to install pipx using the subprocess module and the `pip` command with the `--user` flag.
    It then ensures the pipx path by running `./pipx.exe ensurepath` using subprocess.

    If an exception of type `subprocess.CalledProcessError` is raised during the installation or path ensuring,
    the function catches the exception and prints an error message.
    If any other type of exception is raised during the process, it catches the exception and prints an error message.

    This function does not return any value.
    """
    try:
        print("Installing pipx...")
        subprocess.check_call([sys.executable, "-m", "pip", "install", "--user", "pipx"])
        print("pipx installed successfully.")

        print("Ensuring pipx path...")
        subprocess.check_call(["./pipx.exe", "ensurepath"])
        print("pipx path ensured successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to install pipx or ensure its path: {e}")
        exit(1)
    except Exception as e:
        print(f"Failed to install pipx or ensure its path: {e}")


def install_ggshield():
    """
    A function that installs ggshield using pipx.

    This function attempts to install ggshield using the subprocess module and the `pipx` command.
    It runs the command `pipx install ggshield` using the Python executable.

    If the installation is successful, a message is printed indicating that the ggshield was installed successfully.

    If an exception of type `subprocess.CalledProcessError` is raised during the installation,
    the function catches the exception and prints an error message. The function then exits with a status code of 1.

    If any other type of exception is raised during the process, the function catches the exception and prints an error message.

    This function does not return any value.
    """
    try:
        print("Installing ggshield...")
        subprocess.check_call([sys.executable, "-m", "pipx", "install", "ggshield"])
        print("ggshield installed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to install ggshield: {e}")
        exit(1)
    except Exception as e:
        print(f"Failed to install ggshield: {e}")


def authenticate_ggshield():
    """
    A function that authenticates ggshield.

    This function attempts to authenticate ggshield using the subprocess module and the `ggshield` command.
    It runs the command `ggshield auth login` using the Python executable.

    If the authentication is successful, a message is printed indicating that the ggshield was authenticated successfully.

    If an exception of type `subprocess.CalledProcessError` is raised during the authentication,
    the function catches the exception and prints an error message. The function then exits with a status code of 1.

    If any other type of exception is raised during the process, the function catches the exception and prints an error message.

    This function does not return any value.
    """
    try:
        print("Authenticating ggshield...")
        subprocess.check_call(["ggshield", "auth", "login"])
        print("Authenticated successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to authenticate ggshield: {e}")
        exit(1)
    except Exception as e:
        print(f"Failed to install ggshield: {e}")


def scan_repo_with_ggshield(repo_url):
    """
    A function that scans a repository using ggshield.

    This function takes a repository URL as a parameter and attempts to scan the repository for secrets using the ggshield tool.
    It prints messages indicating the scanning process and the completion status.

    If a `subprocess.CalledProcessError` exception is raised during the scanning process, an error message is printed, and the function exits with a status code of 1.
    If any other type of exception is raised during the scanning, an error message is printed.

    This function does not return any value.
    """
    try:
        print(f"Scanning repository: {repo_url}...")
        subprocess.check_call(["ggshield", "secret", "scan", "repo", repo_url])
        print("Scan completed successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to scan repository: {e}")
        exit(1)
    except Exception as e:
        print(f"Failed to install ggshield: {e}")


def serve_app():
    """
    A function that serves the application on a specified port using Waitress server.
    It catches and handles subprocess.CalledProcessError and generic Exception exceptions.
    """
    try:
        print("Serving the application on *:5000...")
        subprocess.check_call(["waitress-serve", "--listen=*:5000", "wsgi_server:app"])
        print("Application served successfully.")
    except subprocess.CalledProcessError as e:
        print(f"Failed to serve the application: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"Failed to serve the application: {e}")


if __name__ == "__main__":
    install_requirements()
    install_pipx_and_ensure_path()
    install_ggshield()
    authenticate_ggshield()
    scan_repo_with_ggshield("https://github.com/DefinetlyNotAI/Test-generator.git")
    serve_app()
