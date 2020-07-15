from flask_api import FlaskAPI
from flask_cors import CORS

from api.app import api
from client_app import client

app = FlaskAPI(__name__)
CORS(app)

app.register_blueprint(client, url_prefix="/")
app.register_blueprint(api, url_prefix="/api")

if __name__ == "__main__":
    app.run(debug=True)
