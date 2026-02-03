import os

class Config:
    SECRET_KEY = 'dev-key-change-this'
    # користувач root, без пароля
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:@localhost/university_db'
    SQLALCHEMY_TRACK_MODIFICATIONS = False