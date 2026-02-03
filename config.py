import os

class Config:
    SECRET_KEY = 'cloud-pnu-key-secret'

    SQLALCHEMY_DATABASE_URI = 'mysql+pymysql://2oZRFvXxebPBHiU.root:9bYsFfEF8BAzaI42@gateway01.eu-central-1.prod.aws.tidbcloud.com:4000/university_db?ssl_verify_cert=true&ssl_verify_identity=true'

    SQLALCHEMY_TRACK_MODIFICATIONS = False

    SQLALCHEMY_ENGINE_OPTIONS = {
        "pool_recycle": 280,
        "pool_pre_ping": True
    }