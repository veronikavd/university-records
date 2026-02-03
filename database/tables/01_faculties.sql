USE university_db;

DROP TABLE IF EXISTS faculties;

CREATE TABLE faculties (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL UNIQUE,
    short_name VARCHAR(20) NOT NULL
);

INSERT INTO faculties (`short_name`, `id`, `name`) VALUES ('ФМІ', '1', 'Факультет математики та інформатики');
INSERT INTO faculties (`short_name`, `id`, `name`) VALUES ('Економ', '2', 'Економічний факультет');
INSERT INTO faculties (`short_name`, `id`, `name`) VALUES ('ФФВС', '3', 'Факультет фізичного виховання і спорту');
INSERT INTO faculties (`short_name`, `id`, `name`) VALUES ('ФІМ', '4', 'Факультет іноземних мов');
INSERT INTO faculties (`short_name`, `id`, `name`) VALUES ('Історичний', '5', 'Факультет історії, політології і міжнародних відносин');
INSERT INTO faculties (`short_name`, `id`, `name`) VALUES ('Природничий', '6', 'Факультет природничих наук');
INSERT INTO faculties (`short_name`, `id`, `name`) VALUES ('Педагогічний', '7', 'Педагогічний факультет');
INSERT INTO faculties (`short_name`, `id`, `name`) VALUES ('Юридичний', '8', 'Навчально-науковий юридичний інститут');