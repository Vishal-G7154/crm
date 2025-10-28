from flask import Blueprint, jsonify, request, render_template, redirect, url_for, flash
from flask_login import login_user, logout_user, login_required, current_user

auth_bp = Blueprint("auth", __name__)

@auth_bp.get("/ping")
def ping():
    return jsonify({"auth": "ok"}), 200

@auth_bp.get("/login")
def login_page():
    return render_template("auth/login.html")

@auth_bp.post("/login")
def login():
    # TODO: Implement actual login logic
    return jsonify({"message": "Login endpoint"}), 200

@auth_bp.get("/logout")
@login_required
def logout():
    logout_user()
    return redirect(url_for("auth.login_page"))
