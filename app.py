from flask import Flask
from app.api.views import api_bp
from app.api.models import db   # (you'll create models.py next)
from config import Config

app = Flask(__name__)
app.config.from_object(Config)   # Load database URI and settings

# Initialize database
db.init_app(app)

# Register blueprint (your routes)
app.register_blueprint(api_bp)

if __name__ == "__main__":
    with app.app_context():
        db.create_all()  # Create tables if they don't exist yet
    app.run(debug=True)

