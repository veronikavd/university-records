from app import create_app, db
from app.models import User, Category, Record
from datetime import datetime

app = create_app()

def deploy():
    with app.app_context():
        print("🔄 Connecting to MySQL...")
        db.create_all()
        print("✅ Tables created.")

        if Category.query.count() == 0:
            categories = [
                Category(name='Спорт', description='Змагання'),
                Category(name='Наука', description='Олімпіади'),
                Category(name='IT', description='Хакатони')
            ]
            db.session.add_all(categories)
            db.session.commit()
            print("📦 Categories added.")

        if User.query.count() == 0:
            student = User(username='student1', email='s@test.com', password_hash='123', full_name='Іван Тест')
            admin = User(username='admin', email='a@test.com', password_hash='123', full_name='Адмін', role='admin')
            db.session.add_all([student, admin])
            db.session.commit()
            print("👤 Users added.")

        if Record.query.count() == 0:
            usr = User.query.filter_by(username='student1').first()
            cat = Category.query.filter_by(name='IT').first()
            rec = Record(title='Хакатон', result_value='1 місце', event_date=datetime.now(), user_id=usr.id, category_id=cat.id)
            db.session.add(rec)
            db.session.commit()
            print("🏅 Record added.")

        print("🚀 MySQL Database Ready!")

if __name__ == '__main__':
    deploy()