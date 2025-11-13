from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Enquiry(db.Model):
    __tablename__ = 'enquiries'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(120), nullable=False)
    phone = db.Column(db.String(20))
    message = db.Column(db.Text)

    def __repr__(self):
        return f"<Enquiry {self.name}>"
