from app import create_app, db
from app.models import User, Category, Record, Achievement, UploadedFile
from datetime import datetime, date

app = create_app()

def deploy():
    with app.app_context():
        db.drop_all()
        db.create_all()

        categories_data = [
            ('🏆 Спортивні рекорди', 'Перемоги у змаганнях, естафетах, турнірах'),
            ('🎓 Академічні олімпіади', 'Наукові роботи, олімпіади, конференції'),
            ('💻 Хакатони та ІТ-конкурси', 'Програмування, дизайн, GameDev'),
            ('🎨 Творчі фестивалі', 'Музика, танці, художнє мистецтво'),
            ('🌍 Міжнародні перемоги', 'Участь у закордонних грантах та конкурсах'),
            ('⭐️ Особливі рекорди', 'Унікальні досягнення факультету')
        ]
        
        for name, desc in categories_data:
            db.session.add(Category(name=name, description=desc))
        db.session.commit()

        admin = User(
            username='admin', 
            email='admin@univ.edu', 
            password_hash='admin', 
            full_name='Головний Адміністратор', 
            role='admin'
        )
        
        student1 = User(
            username='ivan_k', 
            email='ivan@mail.com', 
            password_hash='pass', 
            full_name='Іван Коваленко', 
            faculty='Факультет Математики та Інформатики', 
            group_code='КН-31'
        )
        
        student2 = User(
            username='maria_s', 
            email='maria@mail.com', 
            password_hash='pass', 
            full_name='Марія Савчук', 
            faculty='Економічний Факультет', 
            group_code='ЕК-22'
        )

        student3 = User(
            username='petro_d', 
            email='petro@mail.com', 
            password_hash='pass', 
            full_name='Петро Дрозд', 
            faculty='Факультет Фізичного Виховання', 
            group_code='ФВ-11'
        )

        db.session.add_all([admin, student1, student2, student3])
        db.session.commit()

        cat_it = Category.query.filter_by(name='💻 Хакатони та ІТ-конкурси').first()
        cat_sport = Category.query.filter_by(name='🏆 Спортивні рекорди').first()
        cat_science = Category.query.filter_by(name='🎓 Академічні олімпіади').first()
        cat_world = Category.query.filter_by(name='🌍 Міжнародні перемоги').first()

        records = [
            Record(
                title='NASA Space Apps Challenge', 
                description='Створення ШІ для аналізу зірок', 
                result_value='1 місце (Global Winner)', 
                event_date=date(2023, 10, 5), 
                status='approved', 
                user_id=student1.id, 
                category_id=cat_it.id
            ),
            Record(
                title='Всеукраїнська олімпіада з програмування', 
                description='Алгоритмічні задачі', 
                result_value='2 місце', 
                event_date=date(2024, 4, 12), 
                status='approved', 
                user_id=student1.id, 
                category_id=cat_it.id
            ),
            Record(
                title='Чемпіонат області з легкої атлетики', 
                description='Біг на 100 метрів', 
                result_value='Золота медаль', 
                event_date=date(2025, 5, 20), 
                status='approved', 
                user_id=student3.id, 
                category_id=cat_sport.id
            ),
            Record(
                title='Конкурс стартапів "Economy Future"', 
                description='Проєкт екологічного пакування', 
                result_value='Грант 1000$', 
                event_date=date(2025, 9, 15), 
                status='approved', 
                user_id=student2.id, 
                category_id=cat_world.id
            ),
            Record(
                title='Google Code Jam 2026', 
                description='Кваліфікаційний раунд', 
                result_value='Top 100', 
                event_date=date(2026, 1, 10), 
                status='pending', 
                user_id=student1.id, 
                category_id=cat_it.id
            )
        ]
        db.session.add_all(records)
        db.session.commit()

        achievements = [
            Achievement(name='Легенда коду', description='За 5 перемог в хакатонах', points=50, user_id=student1.id),
            Achievement(name='Спортсмен року', description='За рекорд області', points=30, user_id=student3.id),
            Achievement(name='Дебют року', description='Перша перемога', points=10, user_id=student2.id)
        ]
        db.session.add_all(achievements)
        db.session.commit()

if __name__ == '__main__':
    deploy()