from flask_mail import Mail, Message
from app import mail

class EmailService:
    def __init__(self):
        self.mail = mail
    
    def send_welcome_email(self, to_email, username):
        msg = Message(
            subject="Welcome to CRM",
            recipients=[to_email],
            html=f"<h1>Welcome {username}!</h1><p>Your CRM account has been created.</p>"
        )
        self.mail.send(msg)
    
    def send_notification(self, to_email, subject, message):
        msg = Message(
            subject=subject,
            recipients=[to_email],
            html=f"<p>{message}</p>"
        )
        self.mail.send(msg)
