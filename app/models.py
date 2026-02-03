from datetime import datetime
from flask_login import UserMixin
from app import db

class User(UserMixin, db.Model):
    __tablename__ = 'users'

    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(64), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password_hash = db.Column(db.String(256), nullable=False)
    full_name = db.Column(db.String(100), nullable=False)
    faculty = db.Column(db.String(100), nullable=True)
    group_code = db.Column(db.String(20), nullable=True)
    role = db.Column(db.String(20), default='student', nullable=False)
    
    records = db.relationship('Record', backref='author', lazy='dynamic')
    achievements = db.relationship('Achievement', backref='owner', lazy='dynamic')

class Category(db.Model):
    __tablename__ = 'categories'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)
    description = db.Column(db.String(255), nullable=True)
    
    records = db.relationship('Record', backref='category', lazy='dynamic')

class Record(db.Model):
    __tablename__ = 'records'

    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(200), nullable=False)
    description = db.Column(db.Text, nullable=True)
    result_value = db.Column(db.String(100), nullable=False)
    event_date = db.Column(db.Date, nullable=False)
    status = db.Column(db.String(20), default='pending')
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))
    category_id = db.Column(db.Integer, db.ForeignKey('categories.id'))
    
    proofs = db.relationship('UploadedFile', backref='record', lazy=True)

class UploadedFile(db.Model):
    __tablename__ = 'uploaded_files'

    id = db.Column(db.Integer, primary_key=True)
    filename = db.Column(db.String(255), nullable=False)
    file_path = db.Column(db.String(255), nullable=False)
    uploaded_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    record_id = db.Column(db.Integer, db.ForeignKey('records.id'))

class Achievement(db.Model):
    __tablename__ = 'achievements'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.String(255), nullable=True)
    points = db.Column(db.Integer, default=0)
    awarded_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))