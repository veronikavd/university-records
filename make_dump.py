import os
from app import create_app, db
from app.models import User, Faculty, Team, Category, Record, Achievement, UploadedFile

app = create_app()

def generate_data_sql():
    print("⏳ Генерую SQL-файл з даними...")
    
    with app.app_context():
        # Створюємо папку database
        if not os.path.exists('database'):
            os.makedirs('database')

        with open('database/data.sql', 'w', encoding='utf-8') as f:
            f.write("-- ДАМП ДАНИХ (INSERT INTO)\n")
            f.write("USE university_db;\n\n")

            # Список таблиць
            models = [
                (Faculty, 'faculties'),
                (Category, 'categories'),
                (User, 'users'),
                (Team, 'teams'),
                (Record, 'records'),
                (Achievement, 'achievements'),
                (UploadedFile, 'uploaded_files')
            ]

            for model, table_name in models:
                records = model.query.all()
                if records:
                    f.write(f"\n-- Дані для таблиці: {table_name}\n")
                    for row in records:
                        # Формуємо SQL
                        row_data = row.__dict__.copy()
                        row_data.pop('_sa_instance_state', None)
                        
                        cols = []
                        vals = []
                        for k, v in row_data.items():
                            cols.append(f"`{k}`")
                            if v is None: vals.append("NULL")
                            elif isinstance(v, str): vals.append(f"'{v}'")
                            else: vals.append(f"'{str(v)}'")
                        
                        sql = f"INSERT INTO {table_name} ({', '.join(cols)}) VALUES ({', '.join(vals)});\n"
                        f.write(sql)
            
            print("✅ Готово! Файл 'database/data.sql' створено.")

if __name__ == '__main__':
    generate_data_sql()