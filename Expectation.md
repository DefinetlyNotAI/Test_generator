## DataBase Expectations API
Give the following from nirt servers:

### REC API
Expects
`.config` file to be supplied and
```json
{
    "api": "REC",
    "username": "example_user"
}
```
Via API.json file.

Returns
`Exam.xslx` file, which is the exam, On your end should be the code to make it into an exam.
If debug is false, the headers would be ['URL', 'Question', 'Score']
If debug is true, the headers would be ['URL', 'Question', 'Title', 'Difficulty', 'Score']
URL is the URL of the question's image (If not there, it would be None).

Function:
```
REC()
```

### RUG API

Expects
```json
{
    "api": "REC",
    "username": "example_user"
}
```
Via API.json file

Returns
```python
api_send = {
    "MESSAGE"
}
```
Can be a string or number, if number refer to Codes section.

Code:
```
um.create_db(username)
```

### RUD API

Expects
```json
{
    "api": "REC",
    "username": "example_user",
    "password": "example_password",
    "exclusion_titles": ["title1", "title2"]
}
```
Via API.json file, ensure NO spaces are in the exclusion titles list.

Returns
```python
api_send = {
    "MESSAGE"
}
```
Can be a string or number, if number refer to Codes section.

Code:
```
um.add_exclusion_db(username, exclusion_titles, password)
```

### RUR API

Expects
```json
{
    "api": "REC",
    "username": "example_user",
    "password": "example_password",
    "exclusion_titles": ["title1", "title2"]
}
```
Via API.json file, ensure NO spaces are in the exclusion titles list.

Returns
```python
api_send = {
    "MESSAGE"
}
```
Can be a string or number, if number refer to Codes section.

Code:
```
um.remove(username, password)
```
---

## Codes
If a message gives you a number not text, know it's an error code:

- 400: Bad Request - Failed to access database
- 401: Unauthorized Access - Incorrect password
- 404: Not found - API request not correct/not found
- 409: Conflict - Already exists
- 500: Internal Server Error - SQLite
- 520: Unknown error - Caught exception

In your side should be logic to convert these into errors to show in your website.
