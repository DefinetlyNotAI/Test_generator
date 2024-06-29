import json


def read_api():
    """
    Reads the configuration data from the 'API.json' file and returns the values for 'api', 'username', 'password', and 'exclusion_titles'.

    Returns:
        tuple: A tuple containing the values for 'api', 'username', 'password', and 'exclusion_titles'.
            - api (str): The API endpoint.
            - username (str): The username for authentication.
            - password (str): The password for authentication.
            - exclusion_titles (list): A list of titles to exclude from the exam.
    """
    with open('API.json') as f:
        config = json.load(f)

    api = config['api']
    username = config['username']
    password = config['password']
    exclusion_titles = config['exclusion_titles']
    return api, username, password, exclusion_titles


# TODO Send message to nirt using their API
def send_data_to_nirt(message):
    print(message)
