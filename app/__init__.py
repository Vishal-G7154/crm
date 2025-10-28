from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_login import LoginManager
from flask_mail import Mail

# Globals
db = SQLAlchemy()
login_manager = LoginManager()
mail = Mail()

def create_app(config_object="config.settings.DevConfig"):
    app = Flask(__name__)
    app.config.from_object(config_object)

    # Initialize extensions
    db.init_app(app)
    login_manager.init_app(app)
    mail.init_app(app)
    
    # Configure login manager
    login_manager.login_view = "auth.login_page"
    login_manager.login_message = "Please log in to access this page."
    login_manager.login_message_category = "info"

    # Import models
    from .models import User
    
    @login_manager.user_loader
    def load_user(user_id):
        return User.query.get(int(user_id))

    # Register blueprints
    from .api.views import api_bp
    from .auth.views import auth_bp

    app.register_blueprint(api_bp, url_prefix="/api")
    app.register_blueprint(auth_bp, url_prefix="/auth")

    @app.get("/")
    def index():
        from flask import render_template
        return render_template("index.html")

    return app
