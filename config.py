import os

class Config:
    SECRET_KEY = 'university-secret-key'
    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://root:@localhost/university_db'
    SQLALCHEMY_TRACK_MODIFICATIONS = False