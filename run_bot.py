import telebot
from app import create_app, db 
from app.models import User, Record

BOT_TOKEN = '8330081327:AAFMTPC-v-WHXkW3u8g-UpN6uap7IjCwoqA'

bot = telebot.TeleBot(BOT_TOKEN)

app = create_app()

# --- КОМАНДА /start ---
@bot.message_handler(commands=['start'])
def send_welcome(message):
    bot.reply_to(message, 
                 "👋 Привіт! Я бот Книги Рекордів.\n"
                 "Напиши /stats для статистики або прізвище студента для пошуку.")

# --- КОМАНДА /stats ---
@bot.message_handler(commands=['stats'])
def send_stats(message):
    with app.app_context():
        total_users = User.query.count()
        total_records = Record.query.count()
        approved_records = Record.query.filter_by(status='approved').count()
        
    text = (f"📈 **Статистика**:\n"
            f"👤 Студентів: {total_users}\n"
            f"🏆 Заявок: {total_records}\n"
            f"✅ Рекордів: {approved_records}")
    
    bot.send_message(message.chat.id, text, parse_mode='Markdown')

# --- ПОШУК ЗА ПРІЗВИЩЕМ ---
@bot.message_handler(func=lambda message: True)
def search_student(message):
    query_text = message.text.strip()
    
    if len(query_text) < 3:
        bot.reply_to(message, "⚠️ Введіть мінімум 3 літери.")
        return

    with app.app_context():
        students = User.query.filter(User.full_name.ilike(f'%{query_text}%')).all()
        
        if not students:
            bot.reply_to(message, "😔 Нікого не знайдено.")
            return

        response = ""
        for student in students:
            records = student.records.filter_by(status='approved').all()
            
            if not records:
                continue 

            response += f"🎓 **{student.full_name}** ({student.group_code})\n"
            response += f"🏅 Нагород: {len(records)}\n"
            
            for rec in records[:3]:
                response += f" - {rec.title} ({rec.result_value})\n"
            
            response += f"🔗 [Профіль](http://127.0.0.1:5000/user/{student.username})\n\n"

        if not response:
            bot.reply_to(message, "Знайдено студентів, але у них немає підтверджених рекордів.")
        else:
            bot.send_message(message.chat.id, response, parse_mode='Markdown')

if __name__ == '__main__':
    print("🤖 Бот запущено...")
    bot.infinity_polling()