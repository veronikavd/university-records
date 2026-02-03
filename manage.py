import os
from app import create_app, db
from app.models import User, Category

app = create_app()

def deploy():
    with app.app_context():
        try:
            os.makedirs(app.instance_path)
        except OSError:
            pass
            
        print("🛠️  Створення таблиць...")
        db.create_all()
        
        if Category.query.count() == 0:
            print("📦 Додавання категорій...")
            cats = [
                Category(name='Спорт', description='Змагання'),
                Category(name='Наука', description='Олімпіади'),
                Category(name='IT/Хакатони', description='Кодинг'),
                Category(name='Творчість', description='Мистецтво')
            ]
            db.session.add_all(cats)
            db.session.commit()
            
        print("✅ Успіх! База даних створена: instance/university.db")

if __name__ == '__main__':
    deploy()