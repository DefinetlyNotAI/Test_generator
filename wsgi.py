# wsgi.py
from werkzeug.middleware.proxy_fix import ProxyFix
from flask_server import app  # Import your Flask app

app.wsgi_app = ProxyFix(app.wsgi_app)  # Apply proxy fix if your app is behind a reverse proxy

if __name__ == '__main__':
    app.run()
