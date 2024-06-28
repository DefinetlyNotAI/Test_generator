## DataBase Expectations API
Give the following from nirt servers:

### REC API
Expects
`.config` file to be supplied and
```python
api_return = {
    "Username": "user",
    }
```

Returns
`Exam.xslx` file, which is the exam, On your end should be the code to make it into an exam.

Function:
```
REC()
```

### RUG API

Expects
```python
api_return = {
    "Username": "user",
    }
```

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
```python
api_return = {
    "Username": "user",
    "Password": "password",
    "Exclusion_titles": ["Title", "Title2", "Title3", "Title4"]
}
```

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
```python
api_return = {
    "Username": "user",
    "Password": "password",
    }
```

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
