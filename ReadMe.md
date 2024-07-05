# Exam Generator Server Project Documentation

<div align="center">
    <a href="https://github.com/DefinetlyNotAI/Test-generator/issues"><img src="https://img.shields.io/github/issues/DefinetlyNotAI/Test-generator" alt="GitHub Issues"></a>
    <a href="https://github.com/DefinetlyNotAI/Test-generator/tags"><img src="https://img.shields.io/github/v/tag/DefinetlyNotAI/Test-generator" alt="GitHub Tag"></a>
    <a href="https://github.com/DefinetlyNotAI/Test-generator/graphs/commit-activity"><img src="https://img.shields.io/github/commit-activity/t/DefinetlyNotAI/Test-generator" alt="GitHub Commit Activity"></a>
    <a href="https://github.com/DefinetlyNotAI/Test-generator/languages"><img src="https://img.shields.io/github/languages/count/DefinetlyNotAI/Test-generator" alt="GitHub Language Count"></a>
    <a href="https://github.com/DefinetlyNotAI/Test-generator/actions"><img src="https://img.shields.io/github/check-runs/DefinetlyNotAI/Test-generator/main" alt="GitHub Branch Check Runs"></a>
    <a href="https://github.com/DefinetlyNotAI/Test-generator"><img src="https://img.shields.io/github/repo-size/DefinetlyNotAI/Test-generator" alt="GitHub Repo Size"></a>
</div>

## Table of Contents 🔍

- [Introduction](#introduction-)
- [Integration](#integration-)
- [File Formats](#file-formats-)
  - [JSON](#json-format-)
  - [CSV](#csv-format-)
  - [Configuration Files (.config)](#configuration-files-config-)
- [Database Expectations API](#database-expectations-api-)
  - [REC API](#rec-api-)
  - [RUG API](#rug-api-)
  - [RUD API](#rud-api-)
  - [RUR API](#rur-api-)
- [Error Codes](#error-codes-)
- [Framework Setup](#framework-setup-)
- [Common Web Server Vulnerabilities](#common-web-server-vulnerabilities-)
  - [SQL Injection](#sql-injection-)
  - [Cross-Site Scripting (XSS)](#cross-site-scripting-xss-)
  - [Broken Authentication](#broken-authentication-)
  - [Session Hijacking](#session-hijacking-)
  - [Security Misconfiguration](#security-misconfiguration-)
  - [Exposure of Sensitive Data](#exposure-of-sensitive-data-)
  - [Outdated or Vulnerable Components](#outdated-or-vulnerable-components-)
  - [Cross-Site Request Forgery (CSRF)](#cross-site-request-forgery-csrf-)
  - [Error Handling Information Exposure](#error-handling-information-exposure-)
  - [Insufficient Transport Layer Protection](#insufficient-transport-layer-protection-)
- [Server Setup](#server-setup-)
  - [Vulnerability Scanning Setup](#vulnerability-scanning-setup-)
    - [PIPX Installation](#pipx-installation-)
    - [GGShield Installation](#ggshield-installation-)
    - [GGShield Scan](#ggshield-scan-)
- [Contributing](#contributing-)
- [License](#license-)
- [Contact](#contact-)

## Introduction 🌟

The **Exam Maker** API Framework is designed to streamline the process of creating and managing exams.
It supports various file formats and offers a range of APIs for database interactions.
It integrates with a SQLite database to store user information and preferences,
processes configuration and question files, and generates exams based on specified criteria.
This guide will walk you through setting up and using the framework effectively.

## Integration 🛠️

The framework integrates with other tools and services to ensure that it is easy to use. 
For example, it can be used to generate exam questions, manage exam databases, and distribute exams.

To use this do the following steps:
1) Clone the repository: `git clone https://github.com/DefinetlyNotAI/Test-generator.git`
2) Navigate to the directory: `cd Test-generator`
3) Open a terminal and install all required packages: `.\setup.ps1` [This will do the [Server Setup](#server-setup-) as well and run the [Server](wsgi_server.py).]
4) Move the API directory to your other WEB server, BUT make both use the same `LOCALHOST`.
5) Make the other WEB server initiate the framework `API_FrameWork.py` as well as generate and create the following files:
   - `Test.csv`: This should be made from a person, and include your questions
   - `API.json`: This should be dynamically changed as it decides what the server should do, check [Table of contents](#table-of-contents-) for more details.
   - `db.config`: This should rarely change and be made from a person, it decides the exam generation parameters.
6) Now you can use the framework to create, manage, and distribute exams by executing `waitress-serve --listen=*:5000 wsgi_server:app`.


## Logging Information 📝

The server outputs a `Server.log` file which can be used to troubleshoot issues
as it logs all requests and responses as well as accurate error messages to ensure that the server is functioning properly.
It contains the message's output in RAW TEXT format and the HTTP status code with a timestamp.

The `DataBase` also logs all actions and errors to the `DataBase.log` file. This logger simply logs all database actions 
to the `DataBase.log` file.
It contains the message's output in RAW TEXT format and the HTTP status code with a timestamp.


## File Formats 📃

### JSON Format 🦾

The JSON file format is structured as follows:

```text

{
    "api": "REPLACE_WITH_API_NAME",
    "username": "REPLACE_WITH_USERNAME",
    "password": "REPLACE_WITH_PASSWORD",
    "exclusion_titles": "REPLACE_WITH_EXCLUSION_1", "REPLACE_WITH_EXCLUSION_2"
}

```

### CSV Format 📃

The CSV file format includes headers such as:

- Questions
- Question Type
- Difficulty Level (Easy, Medium, Hard)
- Score

### Configuration Files (.config) 👨‍💻

Configuration files allow customization of exam settings, including:

```plaintext
[Config-Exam]
questions_amount=6
minimum_titles=3
hard=2
medium=1
easy=3
points=10
debug=0
```

## Database Expectations API 🗂️

The framework interacts with databases through several APIs, including REC, RUG, RUD, and RUR.
Each API has specific requirements and returns data in structured formats.

### REC API 🧠

Request Exam Creation

**Returns EXAM:-**
`Exam.xslx` file, which is the exam, On your end should be the code to make it into an exam from the following headers.
If debug is false, the headers would be ['URL', 'Question', 'Score']
If debug is true, the headers would be ['URL', 'Question', 'Title', 'Difficulty', 'Score']

**Returns WEB UI:-**
It will also return either one of 2 scenarios, If an error occurs, 
it makes it return an error code in html unless using the framework where it will return it in text.
OR if everything works fine it will return a confirmation message in html,
unless using the framework where it will return it in text.

**Required Format:-**
API.json file format should be at minimum:
```text
{
    "api": "REC",
    "username": "REPLACE_WITH_USERNAME",
}
```


Disclaimer:
URL is the URL of the question's image (If not there, it would be None).
You may develop an API to communicate with an Image Hosting Platform to convert the URL to an image.

### RUG API 👤

Request User Generation

**Returns:-**
It will also return either one of 2 scenarios, If an error occurs,
it makes it return an error code in html unless using the framework where it will return it in text.
OR if everything works fine it will return a confirmation message in html,
unless using the framework where it will return it in text, usually it should also give you the password.

**Required Format:-**
API.json file format should be at minimum:
```text
{
    "api": "RUG",
    "username": "REPLACE_WITH_USERNAME",
}
```

### RUD API 🔝

Request User DB Update

**Returns:-**
It will also return either one of 2 scenarios, If an error occurs, 
it makes it return an error code in html unless using the framework where it will return it in text.
OR if everything works fine it will return a confirmation message in html,
unless using the framework where it will return it in text.

**Required Format:-**
API.json file format should be at minimum:
```text
{
    "api": "RUD",
    "username": "REPLACE_WITH_USERNAME",
    "password": "REPLACE_WITH_PASSWORD",
    "exclusion_titles": ["REPLACE_WITH_EXCLUSION_1", "REPLACE_WITH_EXCLUSION_2"]
}
```
### RUR API 🚫

Request User Removal

**Returns:-**
It will also return either one of 2 scenarios, If an error occurs, 
it makes it return an error code in html unless using the framework where it will return it in text.
OR if everything works fine it will return a confirmation message in html,
unless using the framework where it will return it in text.

**Required Format:-**
API.json file format should be at minimum:
```text
{
    "api": "RUR",
    "username": "REPLACE_WITH_USERNAME",
    "password": "REPLACE_WITH_PASSWORD",
}
```
## Error Codes ❌

In case of errors, the system returns specific HTTP status codes.
Familiarize yourself with these codes to troubleshoot issues effectively.

The following are codes returned if an error occurred:-

- 400: Bad Request - Failed to access database/Bad Inputs, Most likely either Client-Side Issue or Frontend Issue
- 401: Unauthorized Access - Incorrect password, Most likely either Client-Side Issue or Frontend Issue
- 404: Not found - API request not correct/not found, Most likely either Client-Side Issue or Frontend Issue
- 409: Conflict - Already exists, Most likely a Backend Issue, please report it here: https://github.com/DefinetlyNotAI/Test-generator/issues/new/choose
- 500: Internal Server Error - SQLite, Most likely either Client-Side Issue or Frontend Issue
- 503: Service Unavailable - Only occurs in the Framework, Usually due to the flask server being down
- 520: Unknown error - Something went wrong, Most likely a Backend Issue, please report it here: https://github.com/DefinetlyNotAI/Test-generator/issues/new/choose

## Common Web Server Vulnerabilities 🛡️

Understanding the common vulnerabilities in web servers is crucial for implementing effective security measures.
Here's a breakdown of some of the most prevalent vulnerabilities that may affect this framework:

### SQL Injection 💉
Occurs when unvalidated input is added directly into an SQL statement, bypassing the intended access controls.
Mitigation involves using parameterized queries or prepared statements.

You must be careful when using prepared statements, as they can be vulnerable to SQL injection attacks.
Make sure that whatever is passed to the `Flask` server is properly sanitized.

#### Cross-Site Scripting (XSS) 📜
An attack where malicious scripts are injected into trusted websites.
Prevention includes validating and escaping user inputs.

Even though we attempt to not allow except `JSON`, `CSV` and `.config`, the contents may not be sanitised properly,
So make sure you validate the file contents to not include bad characters or scripts.

### Broken Authentication 🔓
Weaknesses in the authentication process, allowing unauthorized access to user accounts.
Implementing strong password policies and two-factor authentication helps mitigate this.

The `Flask` server automatically generates a random session ID for each request,
as well as create a secure password in the database. Just make sure to keep the password secure when given to the user.

### Session Hijacking 👨‍💻
Attacker intercepts and takes over a user's session ID. Secure session management practices are essential.

The `Flask` server uses `LOCALHOST` making sure only authorized people in the network and vicinity are allowed access,
Just make sure the secrecy of the server is intact.

### Security Misconfiguration 🛡️
Undesired defaults or errors in application setup.

Regular audits and automated deployment processes can help catch and rectify these issues.
Running [GGShield](#ggshield-scan-) every once in a while is really important, just ignore error's based on the DataBase 
containing passwords and user information as the `DataBase` by nature is private.

### Exposure of Sensitive Data 👀
Information leakage due to misconfiguration, leading to unauthorized access to sensitive data. 
Proper data encryption and access controls are necessary.

Don't allow public access of the `DataBase` as well as unauthorized access to the `Server` room.

### Outdated or Vulnerable Components 📤
Using outdated or insecure components in web applications. 
Keeping software up-to-date and regularly scanning for vulnerabilities is crucial.

You may keep `Libraries` outdated unless a security flaw was discovered and fixed, especially for the following libraries:
```text
Werkzeug~=3.0.3
Flask~=3.0.3
requests~=2.32.3
waitress~=3.0.0
```
To update them, just run `pip install -U Flask Werkzeug requests waitress`.
Also check the [GitHub Repository Releases](https://github.com/DefinetlyNotAI/Test-generator/releases) section for updates.

### Cross-Site Request Forgery (CSRF) 🙅‍♂️
Attack where a malicious website tricks a victim into performing actions on a web application in which they're authenticated.
CSRF tokens can prevent this.

Implement CSRF tokens in the front-end of the software

### Error Handling Information Exposure 📜
Revealing detailed error messages can give attackers insights into the application's structure and potential vulnerabilities.
Configuring error pages to display generic messages helps.

The server is in risk with this, as the HTML returned includes a good deal of sensitive information, 
but this is not shown, rather is sent to the framework itself.
The front-end of the website should show a generic message based on the variable `code`, 
while as the variable `msg` should be logged and not shown to the front end user

### Insufficient Transport Layer Protection ❌
Lack of proper encryption protocols between client and server. Ensuring HTTPS and strong ciphers is mandatory.

This is all on the WEB hosting protocol, as the `Flask` Server runs on `LOCALHOST` it is safe from this vulnerability,
However the front-end server that communicates with the server may be running on a different protocol which can be insecure.

## Framework Setup 🛠️

To use the `API_FrameWork.py`, include the following in your code:

```python
from API_FrameWork import *

msg, code = framework()
```

Where now it will run the framework, save its details and allow you to interact with `msg` and `code` as variables.
Do change API_FrameWork import statement to correctly locate the file.

`msg` will contain the output of the API in HTML and `code` will contain the HTTP status code of the response.

## Server Setup 🖥️

Follow these steps to set up the server:

1. Clone the repository: `git clone https://github.com/DefinetlyNotAI/Test-generator.git`
2. Install dependencies: `pip install -r requirements.txt`
3. Start the server: `waitress-serve --listen=*:5000 wsgi_server:app`

### Vulnerability Scanning Setup 🔒

Ensure the security of your setup by installing and configuring PIPX and GGShield.

#### PIPX Installation 👨‍💻

Run the following commands to install PIPX:

```bash
py -m pip install --user pipx
.\pipx.exe ensurepath
```

#### GGShield Installation 🛠️

Install GGShield using PIPX and authenticate your session:

```bash
pipx install ggshield
ggshield auth login
```

#### GGShield Scan 🛡️

Scan your repository for secrets and vulnerabilities using GGShield:

```bash
ggshield secret scan repo "https://github.com/DefinetlyNotAI/Test-generator.git"
```


## Contributing 👨‍💻

Contributions to the Exam Generator Server are welcome. 
Please review the [CONTRIBUTING.md](CONTRIBUTING.md) file for guidelines on submitting pull requests.

Make sure to adhere to the [Code of Conduct](CODE_OF_CONDUCT.md) before submitting a pull request.

## License 📄

This project is licensed under the [MIT License](LICENSE). See the LICENSE file for details.

## Contact 📧

For inquiries or contributions, please contact Shahm Najeeb at my email `Nirt_12023@outlook.com`.
