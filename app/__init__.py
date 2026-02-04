from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_login import LoginManager
from config import Config

db = SQLAlchemy()
migrate = Migrate()
login_manager = LoginManager()

login_manager.login_view = 'main.login' 
login_manager.login_message = "Будь ласка, увійдіть у систему."

def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)

    db.init_app(app)
    migrate.init_app(app, db)
    login_manager.init_app(app)

    # --- РЕЄСТРАЦІЯ BLUEPRINT (МАРШРУТІВ) ---
    from app.routes import bp as main_bp
    app.register_blueprint(main_bp)

    with app.app_context():
        from app import models

    return app 