# 🎉 Exam Maker Documentation 📝

Welcome to the comprehensive guide for the **Exam Maker** API Framework This document outlines how to effectively utilize our framework to create, manage, and distribute exams. Let's dive right in!

## Table of Contents 🔍

- [Introduction](#introduction)
- [File Formats](#file-formats)
  - [JSON](#json-format)
  - [CSV](#csv-format)
  - [Configuration Files (.config)](#configuration-files-config)
- [Database Expectations API](#database-expectations-api)
  - [REC API](#rec-api)
  - [RUG API](#rug-api)
  - [RUD API](#rud-api)
  - [RUR API](#rur-api)
- [Error Codes](#error-codes)
- [Framework Setup](#framework-setup)
- [Server Setup](#server-setup)
  - [Vulnerability Scanning Setup](#vulnerability-scanning-setup)
    - [PIPX Installation](#pipx-installation)
    - [GGShield Installation](#ggshield-installation)
    - [GGShield Scan](#ggshield-scan)

## Introduction

🌟 The **Exam Maker** API Framework is designed to streamline the process of creating and managing exams. It supports various file formats and offers a range of APIs for database interactions. This guide will walk you through setting up and using the framework effectively.

## File Formats

### JSON Format

The JSON file format is structured as follows:

```text
{
    "api": "REPLACE_WITH_API_NAME",
    "username": "REPLACE_WITH_USERNAME",
    "password": "REPLACE_WITH_PASSWORD",
    "exclusion_titles": "REPLACE_WITH_EXCLUSION_1", "REPLACE_WITH_EXCLUSION_2"
}
```

### CSV Format

The CSV file format includes headers such as:

- Questions
- Question Type
- Difficulty Level (Easy, Medium, Hard)
- Score

### Configuration Files (.config)

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

## Database Expectations API

🗂️ The framework interacts with databases through several APIs, including REC, RUG, RUD, and RUR. Each API has specific requirements and returns data in structured formats.

### REC API

Request Exam Creation

**Returns EXAM:-**
`Exam.xslx` file, which is the exam, On your end should be the code to make it into an exam from the following headers.
If debug is false, the headers would be ['URL', 'Question', 'Score']
If debug is true, the headers would be ['URL', 'Question', 'Title', 'Difficulty', 'Score']

**Returns WEB UI:-**
It will also return either one of 2 scenarios, If an error occurs, 
it makes it return an error code in html unless using the framework where it will return it in JSON.
OR if everything works fine it will return a confirmation message in html,
unless using the framework where it will return it in JSON.

**Required Format:-**
API.json file format should be at minimum:
{
    "api": "REC",
    "username": "REPLACE_WITH_USERNAME",
}

Disclaimer:
URL is the URL of the question's image (If not there, it would be None).
You may develop an API to communicate with an Image Hosting Platform to convert the URL to an image.

### RUG API

Request User Generation

**Returns:-**
It will also return either one of 2 scenarios, If an error occurs,
it makes it return an error code in html unless using the framework where it will return it in text.
OR if everything works fine it will return a confirmation message in html,
unless using the framework where it will return it in text, usually it should also give you the password.

**Required Format:-**
API.json file format should be at minimum:
{
    "api": "RUG",
    "username": "REPLACE_WITH_USERNAME",
}

### RUD API

Request User DB Update

**Returns:-**
It will also return either one of 2 scenarios, If an error occurs, 
it makes it return an error code in html unless using the framework where it will return it in JSON.
OR if everything works fine it will return a confirmation message in html,
unless using the framework where it will return it in JSON.

**Required Format:-**
API.json file format should be at minimum:
{
    "api": "RUD",
    "username": "REPLACE_WITH_USERNAME",
    "password": "REPLACE_WITH_PASSWORD",
    "exclusion_titles": "REPLACE_WITH_EXCLUSION_1", "REPLACE_WITH_EXCLUSION_2"
}

### RUR API

Request User Removal

**Returns:-**
It will also return either one of 2 scenarios, If an error occurs, 
it makes it return an error code in html unless using the framework where it will return it in JSON.
OR if everything works fine it will return a confirmation message in html,
unless using the framework where it will return it in JSON.

**Required Format:-**
API.json file format should be at minimum:
{
    "api": "RUR",
    "username": "REPLACE_WITH_USERNAME",
    "password": "REPLACE_WITH_PASSWORD",
}

## Error Codes

❌ In case of errors, the system returns specific HTTP status codes. Familiarize yourself with these codes to troubleshoot issues effectively.

## Codes
The following are codes returned if an error occurred:-

- 400: Bad Request - Failed to access database/Bad Inputs, Most likely either Client-Side Issue or Frontend Issue
- 401: Unauthorized Access - Incorrect password, Most likely either Client-Side Issue or Frontend Issue
- 404: Not found - API request not correct/not found, Most likely either Client-Side Issue or Frontend Issue
- 409: Conflict - Already exists, Most likely a Backend Issue, please report it here: https://github.com/DefinetlyNotAI/Test-generator/issues/new/choose
- 500: Internal Server Error - SQLite, Most likely either Client-Side Issue or Frontend Issue
- 503: Service Unavailable - Only occurs in the Framework, Usually due to the flask server being down
- 520: Unknown error - Something went wrong, Most likely a Backend Issue, please report it here: https://github.com/DefinetlyNotAI/Test-generator/issues/new/choose

⚠️ CAREFUL from SQL injection on the Frontend, as this is a software that runs on the server using SQLite. ⚠️

🐛 You may also get a 404 if the API code is not valid. 🐛

## Framework Setup

🛠️ To use the `API_FrameWork.py`, include the following in your code:

```python
from API_FrameWork import *

info = framework()
msg, code = info
```

Where now it will run the framework, save its details and allow you to interact with `msg` and `code` as variables.
Do change API_FrameWork import statement to correctly locate the file.

## Server Setup

🖥️ Follow these steps to set up the server:

1. Clone the repository: `git clone https://github.com/DefinetlyNotAI/Test-generator.git`
2. Install dependencies: `pip install -r requirements.txt`
3. Start the server: `waitress-serve --listen=*:5000 wsgi_server:app`

## Vulnerability Scanning Setup

🔒 Ensure the security of your setup by installing and configuring PIPX and GGShield.

### PIPX Installation

Run the following commands to install PIPX:

```bash
py -m pip install --user pipx
.\pipx.exe ensurepath
```

### GGShield Installation

Install GGShield using PIPX and authenticate your session:

```bash
pipx install ggshield
ggshield auth login
```

### GGShield Scan

Scan your repository for secrets and vulnerabilities using GGShield:

```bash
ggshield secret scan repo "Your Repository Name"
```
