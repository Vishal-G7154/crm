from flask import Blueprint, jsonify, request , render_template
from flask_login import login_required, current_user
from app.api.models import db, Enquiry

api_bp = Blueprint("api", __name__ ,template_folder='../templates')

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
@api_bp.route("/enquiry", methods=['GET','POST'])                                 ####
def enquiry_form():
    if request.method == 'POST':
        name  = request.form['name']
        email = request.form['email']
        phone = request.form['phone']
        message = request.form['message']

        print(f"Enquiry received:\nName: {name}\nEmail: {email}\nPhone: {phone}\nMessage: {message}")

        new_enquiry = Enquiry(name=name, email=email, phone=phone, message=message)
        db.session.add(new_enquiry)
        db.session.commit()

        return render_template('enquiry_form.html', success=True, name=name)
    else:
        return render_template('enquiry_form.html', success=False)                   ###

 