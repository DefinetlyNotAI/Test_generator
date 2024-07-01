import requests

url = 'http://127.0.0.1:5000/api/upload'

with open('Database.config', 'rb') as config_file, \
     open('API.json', 'rb') as api_file, \
     open('Test.csv', 'rb') as csv_file:
    files = {
        'Database.config': config_file,
        'API.json': api_file,
        'Test.csv': csv_file  # Optional
    }

response = requests.post(url, files=files)

print(response.status_code)
print(response.text)
