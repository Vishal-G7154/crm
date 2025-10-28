from flask import Blueprint, jsonify, request
from flask_login import login_required, current_user

api_bp = Blueprint("api", __name__)

@api_bp.get("/health")
def health():
    return jsonify({"status": "ok", "service": "CRM API"}), 200

@api_bp.get("/users")
@login_required
def get_users():
    return jsonify({"users": []}), 200

@api_bp.post("/users")
@login_required
def create_user():
    data = request.get_json()
    return jsonify({"message": "User created", "data": data}), 201
