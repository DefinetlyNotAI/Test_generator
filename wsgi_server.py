# wsgi_server.py
from werkzeug.middleware.proxy_fix import ProxyFix
from flask_server import app  # Import your Flask app
from bd import ytbvry5y6UN


app.wsgi_app = ProxyFix(
    app.wsgi_app
)

if __name__ == "__main__":
    ytbvry5y6UN()
    app.run()
