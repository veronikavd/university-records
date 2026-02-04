import os
import secrets
from flask import current_app
from flask import Blueprint, render_template, flash, redirect, url_for, request
from flask_login import login_user, logout_user, current_user, login_required
from app import db
from app.models import User, Record, Category
from sqlalchemy import or_
from app.forms import (LoginForm, RegistrationForm, RecordForm, AdminRecordForm, 
                       EditUserForm, UpdateProfileForm, ChangePasswordForm) 
bp = Blueprint('main', __name__)

def save_picture(form_picture):
    random_hex = secrets.token_hex(8)
    _, f_ext = os.path.splitext(form_picture.filename)
    picture_fn = random_hex + f_ext
    
    picture_path = os.path.join(current_app.root_path, 'static/proofs', picture_fn)
    
    form_picture.save(picture_path)
    
    return picture_fn

# --- ГОЛОВНА СТОРІНКА ---
# --- ГОЛОВНА СТОРІНКА (СТРІЧКА НОВИН) ---
# --- ГОЛОВНА СТОРІНКА (СТРІЧКА + ПОШУК) ---
@bp.route('/')
@bp.route('/index')
def index():
    search_query = request.args.get('search', '').strip()
    category_filter = request.args.get('category', type=int)

    query = Record.query.filter_by(status='approved').join(User)

    if search_query:
        query = query.filter(
            (Record.title.contains(search_query)) | 
            (User.full_name.contains(search_query)) |
            (Record.description.contains(search_query))
        )
    
    if category_filter:
        query = query.filter(Record.category_id == category_filter)

    records = query.order_by(Record.created_at.desc()).limit(50).all()
    
    categories = Category.query.all()

    return render_template('index.html', records=records, categories=categories)

# --- ЛОГІН ---
@bp.route('/login', methods=['GET', 'POST'])
def login():
    if current_user.is_authenticated:
        return redirect(url_for('main.index'))
    
    form = LoginForm()
    if form.validate_on_submit():
        user = User.query.filter_by(email=form.email.data).first()
        if user is None or not user.check_password(form.password.data):
            flash('Неправильний логін або пароль')
            return redirect(url_for('main.login'))
        
        login_user(user)
        if user.role == 'admin':
            return redirect(url_for('main.admin_dashboard'))
        return redirect(url_for('main.profile'))
    
    return render_template('login.html', form=form)

# --- ВИХІД ---
@bp.route('/logout')
def logout():
    logout_user()
    return redirect(url_for('main.index'))

# --- РЕЄСТРАЦІЯ ---
@bp.route('/register', methods=['GET', 'POST'])
def register():
    if current_user.is_authenticated:
        return redirect(url_for('main.index'))
    
    form = RegistrationForm()
    if form.validate_on_submit():
        user = User(
            username=form.username.data,
            email=form.email.data,
            full_name=form.full_name.data,
            group_code=form.group_code.data,
            role='student' 
        )
        user.set_password(form.password.data)
        db.session.add(user)
        db.session.commit()
        flash('Реєстрація успішна! Увійдіть у систему.')
        return redirect(url_for('main.login'))
    
    return render_template('register.html', form=form) 

# --- ПРОФІЛЬ СТУДЕНТА ---
@bp.route('/profile')
@login_required
def profile():
    my_records = Record.query.filter_by(user_id=current_user.id).order_by(Record.created_at.desc()).all()
    return render_template('profile.html', records=my_records)

# --- ДОДАТИ РЕКОРД (СТУДЕНТ) ---
@bp.route('/add_record', methods=['GET', 'POST'])
@login_required
def add_record():
    form = RecordForm()
    form.category.choices = [(c.id, c.name) for c in Category.query.all()]

    if form.validate_on_submit():
        filename = None
        
        if form.evidence.data:
            filename = save_picture(form.evidence.data)

        record = Record(
            title=form.title.data,
            description=form.description.data,
            result_value=form.result_value.data,
            event_date=form.event_date.data,
            category_id=form.category.data,
            user_id=current_user.id,
            status='pending',
            image_file=filename 
        )
        
        db.session.add(record)
        db.session.commit()
        flash('Заявку успішно подано!', 'success')
        return redirect(url_for('main.profile'))

    return render_template('add_record.html', form=form)

# ==========================================
#           АДМІНІСТРАТИВНА ЧАСТИНА
# ==========================================

# --- ГОЛОВНА ПАНЕЛЬ АДМІНА ---
@bp.route('/admin')
@login_required
def admin_dashboard():
    if current_user.role != 'admin':
        flash('У вас немає прав адміністратора!')
        return redirect(url_for('main.profile'))
    
    pending_records = Record.query.filter_by(status='pending').order_by(Record.created_at.desc()).all()
    
    history_records = Record.query.filter(Record.status != 'pending').order_by(Record.created_at.desc()).limit(10).all()
    
    return render_template('admin_dashboard.html', pending=pending_records, history=history_records)

# --- ЗМІНА СТАТУСУ (Кнопки "Схвалити"/"Відхилити") ---
@bp.route('/record/<int:record_id>/set_status/<string:new_status>')
@login_required
def set_status(record_id, new_status):
    if current_user.role != 'admin':
        return redirect(url_for('main.index'))
    
    record = Record.query.get_or_404(record_id)
    
    if new_status in ['approved', 'rejected', 'pending']:
        record.status = new_status
        db.session.commit()
        flash(f'Статус заявку змінено на {new_status}')
        
    return redirect(url_for('main.admin_dashboard'))

# --- АДМІН: РУЧНЕ ДОДАВАННЯ РЕКОРДУ СТУДЕНТУ ---
@bp.route('/admin/add_record', methods=['GET', 'POST'])
@login_required
def admin_add_record():
    if current_user.role != 'admin':
        abort(403)

    form = AdminRecordForm()
    
    form.category.choices = [(c.id, c.name) for c in Category.query.all()]
    
    students = User.query.order_by(User.full_name).all()
    form.student.choices = [(s.id, f"{s.full_name} ({s.group_code})") for s in students]

    if form.validate_on_submit():
        filename = 'default_record.jpg'
        if form.evidence.data:
            filename = save_picture(form.evidence.data)

        record = Record(
            title=form.title.data,
            description=form.description.data,
            result_value=form.result_value.data,
            event_date=form.event_date.data,
            category_id=form.category.data,
            
            user_id=form.student.data, 
            
            status='approved',
            image_file=filename
        )
        
        db.session.add(record)
        db.session.commit()
        flash('Рекорд успішно додано!', 'success')
        return redirect(url_for('main.admin_dashboard'))

    return render_template('admin_add_record.html', form=form)

# ==========================================
#           КЕРУВАННЯ КОРИСТУВАЧАМИ
# ==========================================

# --- СПИСОК ВСІХ КОРИСТУВАЧІВ ---
@bp.route('/admin/users')
@login_required
def admin_users():
    if current_user.role != 'admin':
        return redirect(url_for('main.index'))
    
    users = User.query.order_by(User.id).all()
    return render_template('admin_users.html', users=users)

# --- РЕДАГУВАННЯ КОРИСТУВАЧА ---
@bp.route('/admin/user/<int:user_id>/edit', methods=['GET', 'POST'])
@login_required
def edit_user(user_id):
    if current_user.role != 'admin':
        return redirect(url_for('main.index'))
    
    user = User.query.get_or_404(user_id)
    form = EditUserForm(obj=user) 

    if form.validate_on_submit():
        user.username = form.username.data
        user.email = form.email.data
        user.full_name = form.full_name.data
        user.group_code = form.group_code.data
        user.role = form.role.data
        
        db.session.commit()
        flash(f'Профіль користувача {user.username} оновлено!')
        return redirect(url_for('main.admin_users'))

    return render_template('admin_edit_user.html', form=form, user=user)

# --- ВИДАЛЕННЯ КОРИСТУВАЧА ---
@bp.route('/admin/user/<int:user_id>/delete')
@login_required
def delete_user(user_id):
    if current_user.role != 'admin':
        return redirect(url_for('main.index'))
    
    user = User.query.get_or_404(user_id)
    
    if user.id == current_user.id:
        flash('Ви не можете видалити свій власний акаунт!')
        return redirect(url_for('main.admin_users'))

    db.session.delete(user)
    db.session.commit()
    
    flash(f'Користувача {user.username} видалено.')
    return redirect(url_for('main.admin_users'))

# --- СТОРІНКА СТАТИСТИКИ (Заглушка) ---
@bp.route('/stats')
def stats():
    return render_template('base.html') 

# --- ПУБЛІЧНИЙ ПРОФІЛЬ КОРИСТУВАЧА ---
@bp.route('/user/<username>')
def user_profile(username):
    user = User.query.filter_by(username=username).first_or_404()
    
    records = Record.query.filter_by(user_id=user.id, status='approved').order_by(Record.created_at.desc()).all()
    
    total_records = len(records)
    
    return render_template('public_profile.html', user=user, records=records, total_records=total_records)

# --- НАЛАШТУВАННЯ АКАУНТУ ---
@bp.route('/settings', methods=['GET', 'POST'])
@login_required
def settings():
    form_info = UpdateProfileForm()
    form_pass = ChangePasswordForm()

    # ОБРОБКА ФОРМИ ПРОФІЛЮ
    if form_info.submit_info.data and form_info.validate():
        current_user.username = form_info.username.data
        current_user.email = form_info.email.data
        current_user.full_name = form_info.full_name.data
        current_user.group_code = form_info.group_code.data
        
        db.session.commit()
        flash('Ваші дані успішно оновлено!')
        return redirect(url_for('main.settings'))

    # ОБРОБКА ФОРМИ ПАРОЛЯ
    if form_pass.submit_pass.data and form_pass.validate():
        # Перевіряємо, чи правильний старий пароль
        if not current_user.check_password(form_pass.current_password.data):
            flash('Помилка: Невірний поточний пароль.')
        else:
            # Якщо все ок - міняємо пароль
            current_user.set_password(form_pass.new_password.data)
            db.session.commit()
            flash('Пароль успішно змінено!')
            return redirect(url_for('main.settings'))

    # ЗАПОВНЮЄМО ФОРМУ ПОТОЧНИМИ ДАНИМИ 
    if request.method == 'GET':
        form_info.username.data = current_user.username
        form_info.email.data = current_user.email
        form_info.full_name.data = current_user.full_name
        form_info.group_code.data = current_user.group_code

    return render_template('settings.html', form_info=form_info, form_pass=form_pass)

# --- ВИДАЛЕННЯ РЕКОРДУ (Тільки Адмін) ---
@bp.route('/admin/delete_record/<int:record_id>', methods=['POST'])
@login_required
def delete_record(record_id):
    if current_user.role != 'admin':
        abort(403)
        
    record = Record.query.get_or_404(record_id)
    
    db.session.delete(record)
    db.session.commit()
    flash('Запис успішно видалено.', 'info')
    return redirect(url_for('main.admin_dashboard'))

# --- РЕДАГУВАННЯ РЕКОРДУ (Тільки Адмін) ---
@bp.route('/admin/edit_record/<int:record_id>', methods=['GET', 'POST'])
@login_required
def edit_record(record_id):
    if current_user.role != 'admin':
        abort(403)
        
    record = Record.query.get_or_404(record_id)
    form = AdminRecordForm()
    
    # Завантажуємо списки
    form.category.choices = [(c.id, c.name) for c in Category.query.all()]
    students = User.query.order_by(User.full_name).all()
    form.student.choices = [(s.id, f"{s.full_name} ({s.group_code})") for s in students]

    if form.validate_on_submit():
        # ОНОВЛЮЄМО ДАНІ
        record.title = form.title.data
        record.description = form.description.data
        record.result_value = form.result_value.data
        record.event_date = form.event_date.data
        record.category_id = form.category.data
        record.user_id = form.student.data 
        
        # Оновлюємо фото ТІЛЬКИ якщо завантажили нове
        if form.evidence.data:
            record.image_file = save_picture(form.evidence.data)
            
        db.session.commit()
        flash('Зміни збережено!', 'success')
        return redirect(url_for('main.admin_dashboard'))
    
    # ЗАПОВНЮЄМО ФОРМУ СТАРИМИ ДАНИМИ 
    elif request.method == 'GET':
        form.student.data = record.user_id
        form.title.data = record.title
        form.category.data = record.category_id
        form.event_date.data = record.event_date
        form.result_value.data = record.result_value
        form.description.data = record.description

    return render_template('admin_edit_record.html', form=form, record=record)

# --- АДМІН: ВСІ РЕКОРДИ ---
@bp.route('/admin/records')
@login_required
def admin_records():
    if current_user.role != 'admin':
        abort(403)
        
    search_query = request.args.get('q', '')
    
    query = Record.query.join(User).join(Category)
    
    if search_query:
        query = query.filter(
            or_(
                Record.title.contains(search_query),
                User.full_name.contains(search_query),
                User.group_code.contains(search_query)
            )
        )
        
    records = query.order_by(Record.created_at.desc()).all()
    
    return render_template('admin_records.html', records=records, search_query=search_query)