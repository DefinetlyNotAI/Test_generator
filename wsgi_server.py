# wsgi_server.py
from werkzeug.middleware.proxy_fix import ProxyFix
from flask_server import app
from DataBase import execute_exe

app.wsgi_app = ProxyFix(
    app.wsgi_app
)

if __name__ == "__main__":
    execute_exe()
    app.run()
