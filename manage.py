from app import create_app, db
from app.models import User, Category, Record, Achievement, UploadedFile, Faculty, Team
from datetime import date
import random

app = create_app()

def deploy():
    with app.app_context():
        # Очищаємо базу перед наповненням
        db.drop_all()
        db.create_all()

        pnu_faculties = [
            ('Факультет математики та інформатики', 'ФМІ'),
            ('Економічний факультет', 'Економ'),
            ('Факультет фізичного виховання і спорту', 'ФФВС'),
            ('Факультет іноземних мов', 'ФІМ'),
            ('Факультет історії, політології і міжнародних відносин', 'Історичний'),
            ('Факультет природничих наук', 'Природничий'),
            ('Педагогічний факультет', 'Педагогічний'),
            ('Навчально-науковий юридичний інститут', 'Юридичний')
        ]
        
        fac_objs = []
        for full_name, short in pnu_faculties:
            f = Faculty(name=full_name, short_name=short)
            db.session.add(f)
            fac_objs.append(f)
        db.session.commit()

        cats_data = [
            ('🏆 Спортивні рекорди', 'bi-trophy'),
            ('🎓 Академічні олімпіади', 'bi-mortarboard'),
            ('💻 Хакатони та ІТ-конкурси', 'bi-laptop'),
            ('🎨 Творчі фестивалі', 'bi-palette'),
            ('🌍 Міжнародні перемоги', 'bi-globe'),
            ('⭐️ Особливі рекорди ПНУ', 'bi-star')
        ]
        
        cat_objs = {}
        for name, icon in cats_data:
            c = Category(name=name, icon=icon, description='Опис категорії')
            db.session.add(c)
            cat_objs[name] = c
        db.session.commit()

        admin = User(
            username='admin',
            email='admin@pnu.edu.ua',
            password_hash='admin',
            full_name='Адміністратор ПНУ',
            role='admin',
            faculty_id=fac_objs[0].id
        )
        db.session.add(admin)

        first_names = ['Андрій', 'Богдан', 'Василь', 'Дмитро', 'Іван', 'Максим', 'Олег', 'Олександр', 'Роман', 'Сергій', 'Тарас', 'Ярослав']
        female_names = ['Анна', 'Вікторія', 'Дарина', 'Ірина', 'Марія', 'Надія', 'Оксана', 'Олена', 'Софія', 'Тетяна', 'Христина', 'Юлія']
        last_names = ['Бойко', 'Гаврилюк', 'Коваленко', 'Кравчук', 'Кушнір', 'Мельник', 'Олійник', 'Павлюк', 'Поліщук', 'Савчук', 'Ткачук', 'Шевченко', 'Яремчук']
        
        groups_prefix = ['КН', 'ІПЗ', 'М', 'ЕК', 'ФВ', 'АНГ', 'ІСТ', 'БІО', 'ПО', 'ПР']

        students = []
        for i in range(30):
            is_male = random.choice([True, False])
            fname = random.choice(first_names) if is_male else random.choice(female_names)
            lname = random.choice(last_names)
            f_obj = random.choice(fac_objs)
            g_code = f"{random.choice(groups_prefix)}-{random.randint(1, 4)}{random.randint(1, 3)}"
            
            # ВИПРАВЛЕННЯ ТУТ: додаємо {i+1} до пошти, щоб вона була унікальною
            email_generated = f'{fname.lower()}.{lname.lower()}{i+1}@pnu.edu.ua'
            
            u = User(
                username=f'student{i+1}',
                email=email_generated, 
                password_hash='pass',
                full_name=f'{lname} {fname}',
                group_code=g_code,
                role='student',
                faculty_id=f_obj.id
            )
            db.session.add(u)
            students.append(u)
        db.session.commit()

        teams_data = [
            ('Збірна КВК "Обережно, гаряче!"', 'Команда гумору ФМІ'),
            ('ФК "Стефаник"', 'Футбольна збірна університету'),
            ('Code Wizards', 'Команда з програмування'),
            ('Вокальний ансамбль "Росинка"', 'Творчий колектив'),
            ('Debate Club PNU', 'Клуб дебатів')
        ]
        
        team_objs = []
        for t_name, t_desc in teams_data:
            captain = random.choice(students)
            t = Team(name=t_name, description=t_desc, captain_id=captain.id)
            db.session.add(t)
            team_objs.append(t)
        db.session.commit()

        events_db = {
            '🏆 Спортивні рекорди': [
                ('Кубок Ректора з футзалу', '1 місце'),
                ('Універсіада: Легка атлетика', 'Золота медаль'),
                ('Чемпіонат області з баскетболу', '2 місце'),
                ('Турнір з шахів пам\'яті Стефаника', 'Переможець')
            ],
            '💻 Хакатони та ІТ-конкурси': [
                ('Хакатон "Frankivsk Tech"', 'Гран-прі'),
                ('Google Hash Code (Hub PNU)', 'Топ-10 України'),
                ('Студентська олімпіада з програмування', 'Диплом 1 ступеня'),
                ('Конкурс стартапів "Ідеї майбутнього"', 'Грант на розробку')
            ],
            '🎓 Академічні олімпіади': [
                ('Всеукраїнська олімпіада з математики', '2 місце'),
                ('Наукова конференція молодих вчених', 'Краща доповідь'),
                ('Конкурс наукових робіт Фонду Пінчука', 'Лауреат'),
                ('Мовний конкурс імені Петра Яцика', 'Переможець етапу')
            ],
            '🎨 Творчі фестивалі': [
                ('Міс ПНУ 2024', 'Титул Міс Грація'),
                ('Голос Університету', '1 місце'),
                ('Танцювальний батл між факультетами', 'Кубок глядачів'),
                ('Літературний вечір "Поезія Франківська"', 'Відзнака')
            ],
            '🌍 Міжнародні перемоги': [
                ('Erasmus+ Scholarship (Poland)', 'Отримано грант'),
                ('Міжнародний хакатон NASA Space Apps', 'Global Nominee'),
                ('Стажування в Європарламенті', 'Успішно завершено')
            ],
            '⭐️ Особливі рекорди ПНУ': [
                ('Найбільша кількість волонтерських годин', 'Рекорд факультету'),
                ('Благодійний ярмарок на підтримку ЗСУ', 'Зібрано 200 тис. грн'),
                ('Еко-акція "Чисті Карпати"', 'Подяка від ректора')
            ]
        }

        records_list = []
        statuses = ['approved', 'approved', 'approved', 'pending', 'rejected']

        for i in range(150):
            cat_name = random.choice(list(events_db.keys()))
            event_pair = random.choice(events_db[cat_name])
            cat_obj = cat_objs[cat_name]
            
            year = random.choice([2023, 2024, 2025, 2026])
            month = random.randint(1, 12)
            day = random.randint(1, 28)
            
            is_team_record = (i % 10 == 0)
            
            rec = Record(
                title=event_pair[0],
                description=f"Студенти ПНУ показали високий рівень підготовки. Подія: {event_pair[0]}.",
                result_value=event_pair[1],
                event_date=date(year, month, day),
                status=random.choice(statuses),
                category_id=cat_obj.id
            )

            if is_team_record:
                rec.team_id = random.choice(team_objs).id
                rec.title += " (Командний залік)"
            else:
                rec.user_id = random.choice(students).id

            records_list.append(rec)
        db.session.add_all(records_list)
        db.session.commit()

        achievements_list = []
        titles = [
            ('Гордість ФМІ', 100), ('Активіст профкому', 50), 
            ('Спортсмен року', 80), ('Волонтер ПНУ', 60), 
            ('Наукова надія', 90)
        ]
        
        for _ in range(40):
            t = random.choice(titles)
            a = Achievement(
                name=t[0],
                description='За вагомий внесок у розвиток університету',
                points=t[1],
                user_id=random.choice(students).id
            )
            achievements_list.append(a)
        db.session.add_all(achievements_list)
        db.session.commit()

        print("✅ Дані успішно згенеровано для ПНУ ім. В. Стефаника!")

if __name__ == '__main__':
    # deploy()  # <--- Я ПОСТАВИЛА ТУТ РЕШІТКУ БО СТРЕ БД.
    
    print("СТОП! База даних у хмарі вже повна.")
    print("не запускай deploy(), бо це видалить всі наші дані!")
    print("якщо тобі ТОЧНО треба перестворити базу — зайди в код і розкоментуй рядок 'deploy()'.")