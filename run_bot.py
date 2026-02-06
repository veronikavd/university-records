import telebot
from telebot import types
from werkzeug.security import generate_password_hash
from sqlalchemy import or_
from app import create_app, db 
from app.models import User, Record

# 1. ТОКЕН
BOT_TOKEN = ''

bot = telebot.TeleBot(BOT_TOKEN)
app = create_app()

user_data = {}

# --- ДОПОМІЖНА ФУНКЦІЯ: ГОЛОВНЕ МЕНЮ ---
def main_menu():
    markup = types.ReplyKeyboardMarkup(resize_keyboard=True, row_width=2)
    btn_reg = types.KeyboardButton("📝 Зареєструватися")
    btn_stats = types.KeyboardButton("📊 Статистика")
    btn_search = types.KeyboardButton("🔍 Пошук")
    markup.add(btn_reg, btn_stats, btn_search)
    return markup

# --- КОМАНДА /start ---
@bot.message_handler(commands=['start'])
def send_welcome(message):
    bot.send_message(
        message.chat.id, 
        "👋 Привіт! Я бот Книги Рекордів.\n"
        "Вибери дію в меню знизу:",
        reply_markup=main_menu()
    )

# --- ОБРОБКА КНОПКИ "📊 СТАТИСТИКА" ТА КОМАНДИ /stats ---
@bot.message_handler(func=lambda message: message.text == "📊 Статистика")
@bot.message_handler(commands=['stats'])
def send_stats(message):
    with app.app_context():
        total_users = User.query.count()
        total_records = Record.query.count()
        approved_records = Record.query.filter_by(status='approved').count()
        
    text = (f"📈 **Статистика Університету**:\n\n"
            f"👤 Студентів: {total_users}\n"
            f"🏆 Всього заявок: {total_records}\n"
            f"✅ Підтверджених рекордів: {approved_records}")
    
    bot.send_message(message.chat.id, text, parse_mode='Markdown')

# --- ОБРОБКА КНОПКИ "🔍 ПОШУК" ---
@bot.message_handler(func=lambda message: message.text == "🔍 Пошук")
def trigger_search(message):
    bot.send_message(
        message.chat.id, 
        "✍️ **Введіть прізвище студента або код групи**:\n"
        "(Наприклад: 'Шевченко' або 'КН-21')",
        parse_mode='Markdown'
    )

# ==========================================
# 🆕 БЛОК РЕЄСТРАЦІЇ
# ==========================================

# 1. Початок
@bot.message_handler(func=lambda message: message.text == "📝 Зареєструватися")
def start_registration(message):
    markup = types.ReplyKeyboardRemove()
    msg = bot.send_message(message.chat.id, "Введіть ваше **Повне ім'я** (ПІБ):", parse_mode='Markdown', reply_markup=markup)
    bot.register_next_step_handler(msg, process_fullname_step)

# 2. Ім'я -> Група
def process_fullname_step(message):
    chat_id = message.chat.id
    user_data[chat_id] = {'full_name': message.text}
    
    msg = bot.send_message(chat_id, "Чудово! Тепер введіть код вашої **Групи** (напр. КН-21):")
    bot.register_next_step_handler(msg, process_group_step)

# 3. Група -> Логін
def process_group_step(message):
    chat_id = message.chat.id
    user_data[chat_id]['group_code'] = message.text
    
    msg = bot.send_message(chat_id, "Придумайте **Логін** (username) для входу на сайт:")
    bot.register_next_step_handler(msg, process_username_step)

# 4. Логін -> Email
def process_username_step(message):
    chat_id = message.chat.id
    username = message.text
    
    with app.app_context():
        if User.query.filter_by(username=username).first():
            bot.send_message(chat_id, "❌ Цей логін зайнятий! Введіть інший:")
            bot.register_next_step_handler(message, process_username_step)
            return

    user_data[chat_id]['username'] = username
    msg = bot.send_message(chat_id, "Введіть ваш **Email**:")
    bot.register_next_step_handler(msg, process_email_step)

# 5. Email -> Пароль
def process_email_step(message):
    chat_id = message.chat.id
    email = message.text

    if '@' not in email:
        msg = bot.send_message(chat_id, "⚠️ Це не email. Спробуйте ще раз:")
        bot.register_next_step_handler(msg, process_email_step)
        return

    with app.app_context():
        if User.query.filter_by(email=email).first():
            bot.send_message(chat_id, "❌ Email вже використовується! Введіть інший:")
            bot.register_next_step_handler(message, process_email_step)
            return

    user_data[chat_id]['email'] = email
    msg = bot.send_message(chat_id, "Останній крок: Придумайте **Пароль**:")
    bot.register_next_step_handler(msg, process_password_step)

# 6. Пароль -> Збереження -> Повернення меню
def process_password_step(message):
    chat_id = message.chat.id
    password = message.text
    data = user_data[chat_id]
    
    try:
        with app.app_context():
            new_user = User(
                username=data['username'],
                email=data['email'],
                full_name=data['full_name'],
                group_code=data['group_code']
            )
            new_user.password_hash = generate_password_hash(password)
            
            db.session.add(new_user)
            db.session.commit()
        
        bot.send_message(
            chat_id, 
            "✅ **Реєстрація успішна!**\n\n"
            f"Логін: `{data['username']}`\n"
            f"Тепер ви можете увійти на сайт.\n\n"
            "Виберіть дію в меню:",
            parse_mode='Markdown',
            reply_markup=main_menu() 
        )
        
    except Exception as e:
        bot.send_message(chat_id, f"❌ Помилка: {str(e)}", reply_markup=main_menu())

# ==========================================
# 🔍 ПОШУК (Ловить будь-який текст)
# ==========================================
@bot.message_handler(func=lambda message: True)
def search_student(message):
    query_text = message.text.strip()
    
    if query_text in ["📝 Зареєструватися", "📊 Статистика", "🔍 Пошук"]:
        return

    if len(query_text) < 2:
        bot.reply_to(message, "⚠️ Введіть мінімум 2 літери для пошуку.")
        return

    with app.app_context():
        students = User.query.filter(
            or_(
                User.full_name.ilike(f'%{query_text}%'),
                User.group_code.ilike(f'%{query_text}%')
            )
        ).all()
        
        if not students:
            bot.reply_to(message, "😔 Нікого не знайдено.")
            return

        response = ""
        found_count = 0
        
        for student in students:
            records = student.records.filter_by(status='approved').all()
            
            if not records:
                continue 

            found_count += 1
            response += f"🎓 **{student.full_name}** ({student.group_code})\n"
            response += f"🏅 Нагород: {len(records)}\n"
            
            for rec in records[:3]:
                response += f" - {rec.title} ({rec.result_value})\n"
            
            response += f"🔗 [Профіль на сайті](http://127.0.0.1:5000/user/{student.username})\n\n"

        if found_count == 0:
            bot.reply_to(message, f"Знайдено студентів ({len(students)}), але у них немає підтверджених рекордів.")
        else:
            bot.send_message(message.chat.id, response, parse_mode='Markdown')

if __name__ == '__main__':
    print("🤖 Бот з меню запущено...")
    try:
        bot.infinity_polling(timeout=10, long_polling_timeout=5)
    except Exception as e:
        print(f"Помилка: {e}")