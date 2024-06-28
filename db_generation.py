import sqlite3
import secrets
import string


def verify_password(username, password):
    """
    Verifies the password for a given username by comparing it with the stored password in the database.

    :param username: The username to verify the password for.
    :param password: The plain-text password to verify.
    :return: True if the password is correct, False otherwise.
    """
    # Connect to the 'users.db' database
    conn = sqlite3.connect('users.db')
    cursor = conn.cursor()

    # Retrieve the stored password for the username from the database
    cursor.execute("SELECT password FROM Users WHERE username=?", (username,))
    result = cursor.fetchone()
    conn.close()

    # Check if a stored password was retrieved
    if result:
        stored_password = result[0]

        # Directly compare the provided password with the stored password
        if password == stored_password:
            return True
        else:
            return False
    return False


def create_db(username):
    """Add a user to the database with a random password."""
    # Connect to the SQLite database
    conn = sqlite3.connect('users.db')
    cursor = conn.cursor()

    # Check if the username already exists
    cursor.execute("SELECT * FROM users WHERE username=?", (username,))
    existing_user = cursor.fetchone()
    if existing_user:
        return 409

    # Generate a random password
    alphabet = string.ascii_letters + string.digits
    password = ''.join(secrets.choice(alphabet) for _ in range(12))  # Increased length to 12 for better security

    # Insert the new user into the database
    cursor.execute("INSERT INTO users (username, password) VALUES (?,?)", (username, password))
    conn.commit()

    # Close the connection
    conn.close()

    password_str = "Password is " + password

    return password_str


def remove(username, password):
    """
    Removes all data associated with the specified username from the database.

    Parameters:
    - username: The username of the user whose data should be removed.

    Returns:
    - A success message if the operation was successful.
    - An error message if the operation failed.
    """
    try:
        if verify_password(username, password):
            # Connect to the 'users.db' database
            conn = sqlite3.connect('users.db')
            cursor = conn.cursor()

            # Execute a DELETE statement to remove the user's data
            cursor.execute('''DELETE FROM Users WHERE username=?''', (username,))

            # Commit the changes to the database
            conn.commit()

            # Close the database connection
            conn.close()

            return f"Successfully removed data for user {username}."
        else:
            return 401
    except Exception:
        # Handle any errors that occurred during the operation
        return 520


def add_exclusion_db(name, titles, password):
    """
    Adds titles to the exclusions list for the specified user.
    Returns a success message upon completion.
    """
    try:
        conn = None
        if verify_password(name, password):
            # Connect to the 'users.db' database
            conn = sqlite3.connect('users.db')
            cursor = conn.cursor()

            # Check if the titles already exist in the titles_to_exclude column
            try:
                cursor.execute('''SELECT titles_to_exclude FROM Users WHERE username=?''', (name,))
                result = cursor.fetchone()
                if result is None:
                    raise Exception("User not found")
                current_titles = result[0].strip()  # Strip leading/trailing whitespace

                # Create a set of new titles to avoid duplicates
                new_titles_set = set(titles) - set(current_titles.split(','))

                # Determine if we need to prepend a comma and space
                prepend_comma = current_titles.strip().endswith(',') or current_titles.strip().endswith(' ')

                if new_titles_set:
                    # Join the new titles with a comma and a space, unless the first title
                    if prepend_comma:
                        updated_titles = ', '.join(new_titles_set)
                    else:
                        updated_titles = ','.join(new_titles_set)
                    cursor.execute(
                        '''UPDATE Users SET titles_to_exclude = COALESCE(titles_to_exclude ||?, '') WHERE username =?''',
                        (updated_titles, name))

                conn.commit()
                return f"Successfully updated titles for user {name}."  # Return a success message
            except Exception:
                return 500
        else:
            return 401
    except Exception:
        return 400
    finally:
        if conn:
            conn.close()


def extract_user_info(data):
    """
    Extracts the Username, Password, and Exclusion_titles sublist from the user_data dictionary.

    :param data: A dictionary containing user information including Username, Password, and Exclusion_titles.
    :return: A tuple containing the extracted Username, Password, and Exclusion_titles sublist.
    """
    # Safely accessing the values from the user_data dictionary
    username = data.get('Username', 'Unknown')
    password = data.get('Password', 'Unknown')
    exclusion_titles = data.get('Exclusion_titles', [])

    return username, password, exclusion_titles


# Example usage
api_return = {
    "Username": "Shahm",
    "Password": "ZgmQpeVTKfVN",
    "Exclusion_titles": [", Title", "Title2", "Title3", "Title4"]
}

username, password, exclusion_titles = extract_user_info(api_return)

# Example usage
if __name__ == "__main__":
    api_send = {create_db(username)}  # Creates a new database for TestUser with a random password
    print(api_send)
    api_send = {add_exclusion_db(username, exclusion_titles, password)}  # Adds exclusions for TestUser
    print(api_send)
    api_send = {remove(username, password)}  # Removes database entry
    print(api_send)
