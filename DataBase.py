# CSV [data.csv]=> Data,Data Class Name,Sect (1, 2 or 3), Weight [Max point 100]
# Output CSV [parsed.csv]=> Data,Data Class Name (If debug true), Sect (1, 2 or 3) (If debug true), Weight
# Encode with UTF-8
# JSON [config.json]==>
# {
#       "sect1": int,
#       "sect2": int,
#       "sect3": int,
#       "Min_Class_Names": int,
#       "Max_Class_Names": int,
#       "Weight": int,
#       "Weight_Allowance": int, # How much can the weight be off by
#       "Debug": bool,
#       "API": str, # Check below
#       "username": str,
#       "password": str,
# }
# Add a check to make sure the config file is valid logically and fits the csv file

# ALGOPY Should be used for CLASS LOG

# CLASS API
# ### REC API 🧠
#
# Request Exam Creation
#
# This will request to create an exam based on the users username and password,
# It outputs an `.csv` file
#
# ### RUC API 👤
#
# Request User Creation
#
# This will request creating a username with the provided password,
# Saves to the `users.db`
#
# Username MUST follow the following RegEx Pattern `^[a-zA-Z ]{3,30}$`
# Password MUST follow the following RegEx Pattern `^[a-zA-Z0-9 _!?]{8,36}$`
#
# ### RUR API 🚫
#
# Request User Removal
# Remove User if password is correct

# CLASS ERROR
# When invoked, it should return these codes:
# The contents include:-
# - **500** - Corrupted Start - Internal Server Error - System files were corrupted or not found - No logs will generate - This is a crash
# - **401** - Incorrect Credentials - Unauthorized - The user has inputted wrong username or password.
# - **503** - Unknown Failure - Service Unavailable - A very broad error, Check the logs for the exact source - Requires human intervention
# - **400** - Invalid API - Bad Request - The config file's API is wrong and not part of the 4 [APIs](#database-expectations-api-)
# - **500** - Corrupted Configuration Data - Internal Server Error - The configuration given is completely wrong and not valid - Check logs for further details
# - **404** - Corrupted New User - Not Found - The content given is `None` (Occurs only in RUC) - Check logs for further details
# - **400** - ReGeX Failure - Bad Request - The content given is failed to be validated by the ReGeX param, Due to the user inputting wrong data (Occurs only in RUC) - Check logs for further details
# - **403** - Common Password - Forbidden - The password given is common and not valid either due to it being blacklisted OR due to it already being used (Occurs only in RUC) - Check logs for further details
