# TODO Make this generate this dictionary based on the API info from Nirt
api_return = {
    "Username": "J",
    "Password": "jujtX4WBb45z",
    "Exclusion_titles": ["Tit", "Tie2", "Tle3", "Tle4"]
}

# TODO Sets what this code should do based on what nirt wants (REC/RUG/RUR/RUD)
api = "REC"


# TODO Send message to nirt from what their api wants
def send_data_to_nirt(message):
    print(message)
