from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, TextAreaField, DateField, SelectField
from wtforms.validators import DataRequired, Email, EqualTo, Length
from flask_wtf.file import FileField, FileAllowed, FileRequired

class LoginForm(FlaskForm):
    email = StringField('Email', validators=[DataRequired(), Email()])
    password = PasswordField('Пароль', validators=[DataRequired()])
    submit = SubmitField('Увійти')

class RegistrationForm(FlaskForm):
    username = StringField('Логін', validators=[DataRequired(), Length(min=2, max=20)])
    email = StringField('Email', validators=[DataRequired(), Email()])
    full_name = StringField('ПІБ', validators=[DataRequired()])
    group_code = StringField('Група (напр. ІПЗ-11)', validators=[DataRequired()])
    
    password = PasswordField('Пароль', validators=[DataRequired()])
    confirm_password = PasswordField('Повторіть пароль', validators=[DataRequired(), EqualTo('password')])
    submit = SubmitField('Зареєструватися')

class RecordForm(FlaskForm):
    title = StringField('Назва події', validators=[DataRequired()])
    category = SelectField('Категорія', coerce=int)
    
    evidence = FileField('Доказ (фото або PDF)', validators=[
        FileRequired(), 
        FileAllowed(['jpg', 'png', 'jpeg', 'pdf'], 'Лише зображення або PDF!')
    ])
    
    event_date = DateField('Дата події', format='%Y-%m-%d', validators=[DataRequired()])
    result_value = StringField('Результат (напр. "1 місце")', validators=[DataRequired()])
    description = TextAreaField('Опис', validators=[DataRequired()])
    submit = SubmitField('Подати заявку')

# --- ФОРМА ДЛЯ АДМІНА (з вибором студента) ---
class AdminRecordForm(FlaskForm):
    student = SelectField('Студент', coerce=int, validators=[DataRequired()])
    
    title = StringField('Назва події', validators=[DataRequired()])
    category = SelectField('Категорія', coerce=int)
    
    evidence = FileField('Доказ (фото або PDF)', validators=[
        FileAllowed(['jpg', 'png', 'jpeg', 'pdf'], 'Лише зображення або PDF!')
    ])
    
    event_date = DateField('Дата події', format='%Y-%m-%d', validators=[DataRequired()])
    result_value = StringField('Результат', validators=[DataRequired()])
    description = TextAreaField('Опис', validators=[DataRequired()])
    submit = SubmitField('Зберегти запис')

# --- АДМІН: РЕДАГУВАННЯ КОРИСТУВАЧА ---
class EditUserForm(FlaskForm):
    username = StringField('Логін', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired(), Email()])
    full_name = StringField('ПІБ', validators=[DataRequired()])
    group_code = StringField('Група', validators=[DataRequired()])
    role = SelectField('Роль', choices=[('student', 'Студент'), ('admin', 'Адміністратор')])
    submit = SubmitField('Зберегти зміни')

# --- НАЛАШТУВАННЯ ПРОФІЛЮ ---
class UpdateProfileForm(FlaskForm):
    username = StringField('Логін', validators=[DataRequired()])
    email = StringField('Email', validators=[DataRequired(), Email()])
    full_name = StringField('ПІБ', validators=[DataRequired()])
    group_code = StringField('Група', validators=[DataRequired()])
    submit_info = SubmitField('💾 Оновити дані')

# --- ЗМІНА ПАРОЛЯ ---
class ChangePasswordForm(FlaskForm):
    current_password = PasswordField('Поточний пароль', validators=[DataRequired()])
    new_password = PasswordField('Новий пароль', validators=[DataRequired(), Length(min=6)])
    confirm_new_password = PasswordField('Підтвердження', validators=[DataRequired(), EqualTo('new_password')])
    submit_pass = SubmitField('🔐 Змінити пароль')

# --- АДМІН: ДОДАВАННЯ КАТЕГОРІЇ ---
class CategoryForm(FlaskForm):
    name = StringField('Назва категорії', validators=[DataRequired()])
    submit = SubmitField('Додати категорію')