from datetime import datetime
from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
from app import db, login_manager

# --- ФУНКЦІЯ ЗАВАНТАЖЕННЯ КОРИСТУВАЧА ---
@login_manager.user_loader
def load_user(user_id):
    return User.query.get(int(user_id))

# ==========================================
# 1. ДОВІДНИКИ (Факультети, Категорії)
# ==========================================

class Faculty(db.Model):
    __tablename__ = 'faculties'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(150), unique=True, nullable=False)
    short_name = db.Column(db.String(20), nullable=False)
    
    users = db.relationship('User', backref='faculty_rel', lazy='dynamic')

class Category(db.Model):
    __tablename__ = 'categories'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), unique=True, nullable=False)
    icon = db.Column(db.String(50), nullable=True)
    description = db.Column(db.String(255), nullable=True)
    
    records = db.relationship('Record', backref='category', lazy='dynamic')

# ==========================================
# 2. КОРИСТУВАЧІ ТА КОМАНДИ
# ==========================================

class User(UserMixin, db.Model):
    __tablename__ = 'users'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(64), unique=True, nullable=False)
    email = db.Column(db.String(120), unique=True, nullable=False)
    password_hash = db.Column(db.String(256), nullable=False)
    full_name = db.Column(db.String(100), nullable=False)
    group_code = db.Column(db.String(20), nullable=True)
    role = db.Column(db.String(20), default='student', nullable=False)
    
    faculty_id = db.Column(db.Integer, db.ForeignKey('faculties.id'))
    
    records = db.relationship('Record', backref='author', lazy='dynamic')
    achievements = db.relationship('Achievement', backref='owner', lazy='dynamic')
    teams_captain = db.relationship('Team', backref='captain', lazy='dynamic')

    @property
    def badge(self):
        count = 0
        for r in self.records:
            if r.status == 'approved':
                count += 1
        
        if count >= 10:
            return {'name': 'Гордість факультету', 'icon': 'bi-trophy-fill', 'color': 'warning'} # 🥇 Золотий
        elif count >= 5:
            return {'name': 'Активіст', 'icon': 'bi-star-fill', 'color': 'danger'} # 🥈 Червоний
        elif count >= 1:
            return {'name': 'Дебют', 'icon': 'bi-award-fill', 'color': 'primary'} # 🥉 Синій
        
        return None 

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

class Team(db.Model):
    __tablename__ = 'teams'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.String(255), nullable=True)
    
    captain_id = db.Column(db.Integer, db.ForeignKey('users.id'))
    
    records = db.relationship('Record', backref='team_rel', lazy='dynamic')

# ==========================================
# 3. РЕКОРДИ, ДОСЯГНЕННЯ ТА ФАЙЛИ
# ==========================================

class Record(db.Model):
    __tablename__ = 'records' 
    id = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(140), nullable=False)
    description = db.Column(db.Text, nullable=False)
    result_value = db.Column(db.String(50), nullable=False)
    event_date = db.Column(db.Date, nullable=False)

    image_file = db.Column(db.String(100), nullable=True, default='default_record.jpg')

    status = db.Column(db.String(20), default='pending')
    created_at = db.Column(db.DateTime, index=True, default=datetime.utcnow)
    
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))
    category_id = db.Column(db.Integer, db.ForeignKey('categories.id'))

    team_id = db.Column(db.Integer, db.ForeignKey('teams.id'), nullable=True)
    
    files = db.relationship('UploadedFile', backref='record', lazy='dynamic')

    def __repr__(self):
        return f'<Record {self.title}>'

class Achievement(db.Model):
    __tablename__ = 'achievements'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(100), nullable=False)
    description = db.Column(db.String(255), nullable=True)
    points = db.Column(db.Integer, default=0)
    awarded_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    user_id = db.Column(db.Integer, db.ForeignKey('users.id'))

class UploadedFile(db.Model):
    __tablename__ = 'uploaded_files'
    id = db.Column(db.Integer, primary_key=True)
    filename = db.Column(db.String(255), nullable=False)
    file_path = db.Column(db.String(255), nullable=False)
    uploaded_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    record_id = db.Column(db.Integer, db.ForeignKey('records.id'))