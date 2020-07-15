from flask import Blueprint, request

api = Blueprint("api", __name__)


@api.route("/hello/", methods=["GET"])
def get_data():
    name = request.args.get("name", "User")
    return {"message": "Hello {}, from the API!".format(name)}
