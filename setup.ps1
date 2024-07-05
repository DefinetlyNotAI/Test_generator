# Suppressing output for commands that don't need to be shown
$null = python -m pip install -r requirements.txt
$null = python -m pip install --user pipx
$null = ./pipx.exe ensurepath
$null = python -m pipx install ggshield

# Authenticating ggshield without suppressing output because it might require user interaction
ggshield auth login

# Scanning repository with ggshield, keeping the output visible
ggshield secret scan repo https://github.com/DefinetlyNotAI/Test-generator.git

# Serving the application, suppressing the initial startup messages but allowing subsequent output
$null = waitress-serve --listen=*:5000 wsgi_server:app
