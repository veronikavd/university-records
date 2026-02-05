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
USE university_db;

DROP TABLE IF EXISTS categories;

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    icon VARCHAR(50),
    description VARCHAR(255)
);

INSERT INTO categories (`description`, `name`, `icon`, `id`) VALUES ('Опис категорії', '🏆 Спортивні рекорди', 'bi-trophy', '1');
INSERT INTO categories (`description`, `name`, `icon`, `id`) VALUES ('Опис категорії', '🎓 Академічні олімпіади', 'bi-mortarboard', '2');
INSERT INTO categories (`description`, `name`, `icon`, `id`) VALUES ('Опис категорії', '💻 Хакатони та ІТ-конкурси', 'bi-laptop', '3');
INSERT INTO categories (`description`, `name`, `icon`, `id`) VALUES ('Опис категорії', '🎨 Творчі фестивалі', 'bi-palette', '4');
INSERT INTO categories (`description`, `name`, `icon`, `id`) VALUES ('Опис категорії', '🌍 Міжнародні перемоги', 'bi-globe', '5');
INSERT INTO categories (`description`, `name`, `icon`, `id`) VALUES ('Опис категорії', '⭐️ Особливі рекорди ПНУ', 'bi-star', '6');
USE university_db;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(64) NOT NULL UNIQUE,
    email VARCHAR(120) NOT NULL UNIQUE,
    password_hash VARCHAR(256) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    group_code VARCHAR(20),
    role VARCHAR(20) NOT NULL DEFAULT 'student',
    faculty_id INT,
    FOREIGN KEY (faculty_id) REFERENCES faculties(id) ON DELETE SET NULL
);

INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES (1, 'admin', 'admin@pnu.edu.ua', 'Адміністратор ПНУ', 'admin', 'admin', NULL, 1);

INSERT INTO users VALUES (2, 'student1', 'yuliya.yaremchuk1@pnu.edu.ua', 'Яремчук Юлія', 'ІСТ-43', 'student', 'pass', 1);
INSERT INTO users VALUES (3, 'student2', 'andrii.pavliuk2@pnu.edu.ua', 'Павлюк Андрій', 'ІСТ-33', 'student', 'pass', 3);
INSERT INTO users VALUES (4, 'student3', 'yaroslav.savchuk3@pnu.edu.ua', 'Савчук Ярослав', 'БІО-13', 'student', 'pass', 7);
INSERT INTO users VALUES (5, 'student4', 'nadiia.tkachuk4@pnu.edu.ua', 'Ткачук Надія', 'ПО-32', 'student', 'pass', 1);
INSERT INTO users VALUES (6, 'student5', 'ivan.melnyk5@pnu.edu.ua', 'Мельник Іван', 'ФВ-11', 'student', 'pass', 1);
INSERT INTO users VALUES (7, 'student6', 'anna.oliinyk6@pnu.edu.ua', 'Олійник Анна', 'ФВ-12', 'student', 'pass', 6);
INSERT INTO users VALUES (8, 'student7', 'daryna.oliinyk7@pnu.edu.ua', 'Олійник Дарина', 'КН-43', 'student', 'pass', 1);
INSERT INTO users VALUES (9, 'student8', 'nadiia.pavliuk8@pnu.edu.ua', 'Павлюк Надія', 'ФВ-31', 'student', 'pass', 6);
INSERT INTO users VALUES (10, 'student9', 'andrii.tkachuk9@pnu.edu.ua', 'Ткачук Андрій', 'ПР-13', 'student', 'pass', 2);
INSERT INTO users VALUES (11, 'student10', 'anna.oliinyk10@pnu.edu.ua', 'Олійник Анна', 'ПО-42', 'student', 'pass', 5);
INSERT INTO users VALUES (12, 'student11', 'andrii.kushnir11@pnu.edu.ua', 'Кушнір Андрій', 'БІО-32', 'student', 'pass', 3);
INSERT INTO users VALUES (13, 'student12', 'anna.boiko12@pnu.edu.ua', 'Бойко Анна', 'ФВ-33', 'student', 'pass', 3);
INSERT INTO users VALUES (14, 'student13', 'yaroslav.polishchuk13@pnu.edu.ua', 'Поліщук Ярослав', 'ПО-13', 'student', 'pass', 7);
INSERT INTO users VALUES (15, 'student14', 'oleksandr.havryliuk14@pnu.edu.ua', 'Гаврилюк Олександр', 'ЕК-12', 'student', 'pass', 1);
INSERT INTO users VALUES (16, 'student15', 'sofiia.polishchuk15@pnu.edu.ua', 'Поліщук Софія', 'М-12', 'student', 'pass', 4);
INSERT INTO users VALUES (17, 'student16', 'dmytro.kushnir16@pnu.edu.ua', 'Кушнір Дмитро', 'АНГ-11', 'student', 'pass', 1);
INSERT INTO users VALUES (18, 'student17', 'oleh.oliinyk17@pnu.edu.ua', 'Олійник Олег', 'М-22', 'student', 'pass', 6);
INSERT INTO users VALUES (19, 'student18', 'dmytro.havryliuk18@pnu.edu.ua', 'Гаврилюк Дмитро', 'ПО-42', 'student', 'pass', 4);
INSERT INTO users VALUES (20, 'student19', 'yaroslav.pavliuk19@pnu.edu.ua', 'Павлюк Ярослав', 'ФВ-33', 'student', 'pass', 8);
INSERT INTO users VALUES (21, 'student20', 'sofiia.kovalenko20@pnu.edu.ua', 'Коваленко Софія', 'ФВ-33', 'student', 'pass', 1);
INSERT INTO users VALUES (22, 'student21', 'olena.oliinyk21@pnu.edu.ua', 'Олійник Олена', 'ПР-22', 'student', 'pass', 8);
INSERT INTO users VALUES (23, 'student22', 'oleksandr.kravchuk22@pnu.edu.ua', 'Кравчук Олександр', 'М-21', 'student', 'pass', 8);
INSERT INTO users VALUES (24, 'student23', 'maksym.savchuk23@pnu.edu.ua', 'Савчук Максим', 'ФВ-23', 'student', 'pass', 4);
INSERT INTO users VALUES (25, 'student24', 'vasyl.savchuk24@pnu.edu.ua', 'Савчук Василь', 'БІО-11', 'student', 'pass', 7);
INSERT INTO users VALUES (26, 'student25', 'olena.tkachuk25@pnu.edu.ua', 'Ткачук Олена', 'ПО-21', 'student', 'pass', 7);
INSERT INTO users VALUES (27, 'student26', 'oksana.boiko26@pnu.edu.ua', 'Бойко Оксана', 'ІПЗ-33', 'student', 'pass', 4);
INSERT INTO users VALUES (28, 'student27', 'anna.havryliuk27@pnu.edu.ua', 'Гаврилюк Анна', 'ФВ-21', 'student', 'pass', 8);
INSERT INTO users VALUES (29, 'student28', 'sofiia.yaremchuk28@pnu.edu.ua', 'Яремчук Софія', 'ПО-12', 'student', 'pass', 4);
INSERT INTO users VALUES (30, 'student29', 'olena.pavliuk29@pnu.edu.ua', 'Павлюк Олена', 'АНГ-22', 'student', 'pass', 5);
INSERT INTO users VALUES (31, 'student30', 'oleksandr.polishchuk30@pnu.edu.ua', 'Поліщук Олександр', 'ПР-43', 'student', 'pass', 1);
INSERT INTO users VALUES (32, 'student31', 'roman.koval31@pnu.edu.ua', 'Коваль Роман', 'ІСТ-11', 'student', 'pass', 1);
INSERT INTO users VALUES (33, 'student32', 'viktoriia.bondar32@pnu.edu.ua', 'Бондар Вікторія', 'ЕК-31', 'student', 'pass', 2);
INSERT INTO users VALUES (34, 'student33', 'denys.moroz33@pnu.edu.ua', 'Мороз Денис', 'ФВ-22', 'student', 'pass', 3);
INSERT INTO users VALUES (35, 'student34', 'kateryna.lysenko34@pnu.edu.ua', 'Лисенко Катерина', 'АНГ-41', 'student', 'pass', 4);
INSERT INTO users VALUES (36, 'student35', 'maksym.shvets35@pnu.edu.ua', 'Швець Максим', 'ІСТ-22', 'student', 'pass', 5);
INSERT INTO users VALUES (37, 'student36', 'alina.petrenko36@pnu.edu.ua', 'Петренко Аліна', 'БІО-41', 'student', 'pass', 6);
INSERT INTO users VALUES (38, 'student37', 'bohdan.litvinov37@pnu.edu.ua', 'Літвінов Богдан', 'ПО-33', 'student', 'pass', 7);
INSERT INTO users VALUES (39, 'student38', 'maria.rudnitska38@pnu.edu.ua', 'Рудницька Марія', 'ПР-11', 'student', 'pass', 8);
INSERT INTO users VALUES (40, 'student39', 'vitalii.klymneko39@pnu.edu.ua', 'Клименко Віталій', 'ІПЗ-12', 'student', 'pass', 1);
INSERT INTO users VALUES (41, 'student40', 'yana.zhuk40@pnu.edu.ua', 'Жук Яна', 'ЕК-22', 'student', 'pass', 2);
INSERT INTO users VALUES (42, 'student41', 'nazar.honchar41@pnu.edu.ua', 'Гончар Назар', 'ФВ-41', 'student', 'pass', 3);
INSERT INTO users VALUES (43, 'student42', 'yuliia.zakharova42@pnu.edu.ua', 'Захарова Юлія', 'НІМ-31', 'student', 'pass', 4);
INSERT INTO users VALUES (44, 'student43', 'volodymyr.panasenko43@pnu.edu.ua', 'Панасенко Володимир', 'ПОЛ-21', 'student', 'pass', 5);
INSERT INTO users VALUES (45, 'student44', 'olha.fedorova44@pnu.edu.ua', 'Федорова Ольга', 'ГЕО-13', 'student', 'pass', 6);
INSERT INTO users VALUES (46, 'student45', 'dmytro.syrota45@pnu.edu.ua', 'Сирота Дмитро', 'ПО-11', 'student', 'pass', 7);
INSERT INTO users VALUES (47, 'student46', 'tetiana.martynenko46@pnu.edu.ua', 'Мартиненко Тетяна', 'ПР-33', 'student', 'pass', 8);
INSERT INTO users VALUES (48, 'student47', 'artem.solovei47@pnu.edu.ua', 'Соловей Артем', 'КН-21', 'student', 'pass', 1);
INSERT INTO users VALUES (49, 'student48', 'oksana.kyrylenko48@pnu.edu.ua', 'Кириленко Оксана', 'ОБЛ-12', 'student', 'pass', 2);
INSERT INTO users VALUES (50, 'student49', 'rostyslav.zayets49@pnu.edu.ua', 'Заєць Ростислав', 'ФВ-13', 'student', 'pass', 3);
INSERT INTO users VALUES (51, 'student50', 'iryna.osypenko50@pnu.edu.ua', 'Осипенко Ірина', 'АНГ-33', 'student', 'pass', 4);
INSERT INTO users VALUES (52, 'student51', 'mykola.doroshenko51@pnu.edu.ua', 'Дорошенко Микола', 'ІСТ-41', 'student', 'pass', 5);
INSERT INTO users VALUES (53, 'student52', 'nataliia.lytvenko52@pnu.edu.ua', 'Литвенко Наталія', 'ХІМ-22', 'student', 'pass', 6);
INSERT INTO users VALUES (54, 'student53', 'serhii.boiko53@pnu.edu.ua', 'Бойко Сергій', 'ПО-23', 'student', 'pass', 7);
INSERT INTO users VALUES (55, 'student54', 'anastasiia.melnyk54@pnu.edu.ua', 'Мельник Анастасія', 'ПР-41', 'student', 'pass', 8);
INSERT INTO users VALUES (56, 'student55', 'yevhen.kozlov55@pnu.edu.ua', 'Козлов Євген', 'МАТ-31', 'student', 'pass', 1);
INSERT INTO users VALUES (57, 'student56', 'liubov.stepanenko56@pnu.edu.ua', 'Степаненко Любов', 'ЕК-43', 'student', 'pass', 2);
INSERT INTO users VALUES (58, 'student57', 'vadym.yurchenko57@pnu.edu.ua', 'Юрченко Вадим', 'ФВ-32', 'student', 'pass', 3);
INSERT INTO users VALUES (59, 'student58', 'halyna.kostenko58@pnu.edu.ua', 'Костенко Галина', 'ФРА-11', 'student', 'pass', 4);
INSERT INTO users VALUES (60, 'student59', 'oleg.tarasenko59@pnu.edu.ua', 'Тарасенко Олег', 'ПОЛ-33', 'student', 'pass', 5);
INSERT INTO users VALUES (61, 'student60', 'svitlana.hryhorenko60@pnu.edu.ua', 'Григоренко Світлана', 'БІО-23', 'student', 'pass', 6);
INSERT INTO users VALUES (62, 'student61', 'andrii.bondarenko61@pnu.edu.ua', 'Бондаренко Андрій', 'ПО-41', 'student', 'pass', 7);
INSERT INTO users VALUES (63, 'student62', 'olena.karpenko62@pnu.edu.ua', 'Карпенко Олена', 'ПР-21', 'student', 'pass', 8);
INSERT INTO users VALUES (64, 'student63', 'viktor.semenenko63@pnu.edu.ua', 'Семененко Віктор', 'ІПЗ-22', 'student', 'pass', 1);
INSERT INTO users VALUES (65, 'student64', 'marina.onyshchenko64@pnu.edu.ua', 'Онищенко Марина', 'МЕН-11', 'student', 'pass', 2);
INSERT INTO users VALUES (66, 'student65', 'pavlo.dudka65@pnu.edu.ua', 'Дудка Павло', 'ФВ-21', 'student', 'pass', 3);
INSERT INTO users VALUES (67, 'student66', 'krystyna.voloshyn66@pnu.edu.ua', 'Волошин Кристина', 'АНГ-13', 'student', 'pass', 4);
INSERT INTO users VALUES (68, 'student67', 'taras.savchenko67@pnu.edu.ua', 'Савченко Тарас', 'ІСТ-32', 'student', 'pass', 5);
INSERT INTO users VALUES (69, 'student68', 'alla.romanenko68@pnu.edu.ua', 'Романенко Алла', 'ГЕО-31', 'student', 'pass', 6);
INSERT INTO users VALUES (70, 'student69', 'ivan.mykhailenko69@pnu.edu.ua', 'Михайленко Іван', 'ПО-12', 'student', 'pass', 7);
INSERT INTO users VALUES (71, 'student70', 'veronika.lysak70@pnu.edu.ua', 'Лисак Вероніка', 'ПР-12', 'student', 'pass', 8);
INSERT INTO users VALUES (72, 'student71', 'roman.bilous71@pnu.edu.ua', 'Білоус Роман', 'КН-11', 'student', 'pass', 1);
INSERT INTO users VALUES (73, 'student72', 'daria.pavlenko72@pnu.edu.ua', 'Павленко Дарія', 'ФІН-33', 'student', 'pass', 2);
INSERT INTO users VALUES (74, 'student73', 'maksym.tkachenko73@pnu.edu.ua', 'Ткаченко Максим', 'ФВ-42', 'student', 'pass', 3);
INSERT INTO users VALUES (75, 'student74', 'yuliia.popova74@pnu.edu.ua', 'Попова Юлія', 'НІМ-21', 'student', 'pass', 4);
INSERT INTO users VALUES (76, 'student75', 'serhii.denysenko75@pnu.edu.ua', 'Денисенко Сергій', 'ПОЛ-12', 'student', 'pass', 5);
INSERT INTO users VALUES (77, 'student76', 'olha.vasylenko76@pnu.edu.ua', 'Василенко Ольга', 'ХІМ-41', 'student', 'pass', 6);
INSERT INTO users VALUES (78, 'student77', 'dmytro.kovalenko77@pnu.edu.ua', 'Коваленко Дмитро', 'ПО-31', 'student', 'pass', 7);
INSERT INTO users VALUES (79, 'student78', 'tetiana.shevchenko78@pnu.edu.ua', 'Шевченко Тетяна', 'ПР-32', 'student', 'pass', 8);
INSERT INTO users VALUES (80, 'student79', 'artem.ivanov79@pnu.edu.ua', 'Іванов Артем', 'МАТ-23', 'student', 'pass', 1);
INSERT INTO users VALUES (81, 'student80', 'oksana.kulyk80@pnu.edu.ua', 'Кулик Оксана', 'ЕК-11', 'student', 'pass', 2);
INSERT INTO users VALUES (82, 'student81', 'rostyslav.lytvyneko81@pnu.edu.ua', 'Литвиненко Ростислав', 'ФВ-12', 'student', 'pass', 3);
INSERT INTO users VALUES (83, 'student82', 'iryna.babenko82@pnu.edu.ua', 'Бабенко Ірина', 'АНГ-21', 'student', 'pass', 4);
INSERT INTO users VALUES (84, 'student83', 'mykola.rud83@pnu.edu.ua', 'Рудь Микола', 'ІСТ-21', 'student', 'pass', 5);
INSERT INTO users VALUES (85, 'student84', 'nataliia.kryvonos84@pnu.edu.ua', 'Кривонос Наталія', 'БІО-12', 'student', 'pass', 6);
INSERT INTO users VALUES (86, 'student85', 'yevhen.nazarenko85@pnu.edu.ua', 'Назаренко Євген', 'ПО-22', 'student', 'pass', 7);
INSERT INTO users VALUES (87, 'student86', 'anastasiia.polishchuk86@pnu.edu.ua', 'Поліщук Анастасія', 'ПР-42', 'student', 'pass', 8);
INSERT INTO users VALUES (88, 'student87', 'vadym.yakovenko87@pnu.edu.ua', 'Яковенко Вадим', 'ІСТ-12', 'student', 'pass', 1);
INSERT INTO users VALUES (89, 'student88', 'liubov.fedorchuk88@pnu.edu.ua', 'Федорчук Любов', 'МЕН-23', 'student', 'pass', 2);
INSERT INTO users VALUES (90, 'student89', 'halyna.prykhodko89@pnu.edu.ua', 'Приходько Галина', 'ФВ-31', 'student', 'pass', 3);
INSERT INTO users VALUES (91, 'student90', 'oleg.shymko90@pnu.edu.ua', 'Шимко Олег', 'ФРА-22', 'student', 'pass', 4);
INSERT INTO users VALUES (92, 'student91', 'svitlana.moskalenko91@pnu.edu.ua', 'Москаленко Світлана', 'ПОЛ-13', 'student', 'pass', 5);
INSERT INTO users VALUES (93, 'student92', 'andrii.antonenko92@pnu.edu.ua', 'Антоненко Андрій', 'ГЕО-42', 'student', 'pass', 6);
INSERT INTO users VALUES (94, 'student93', 'olena.kravchenko93@pnu.edu.ua', 'Кравченко Олена', 'ПО-43', 'student', 'pass', 7);
INSERT INTO users VALUES (95, 'student94', 'viktor.pohrebniak94@pnu.edu.ua', 'Погребняк Віктор', 'ПР-11', 'student', 'pass', 8);
INSERT INTO users VALUES (96, 'student95', 'marina.sydorenko95@pnu.edu.ua', 'Сидоренко Марина', 'ІПЗ-32', 'student', 'pass', 1);
INSERT INTO users VALUES (97, 'student96', 'pavlo.koshovyi96@pnu.edu.ua', 'Кошовий Павло', 'ФІН-12', 'student', 'pass', 2);
INSERT INTO users VALUES (98, 'student97', 'krystyna.didenko97@pnu.edu.ua', 'Діденко Кристина', 'ФВ-22', 'student', 'pass', 3);
INSERT INTO users VALUES (99, 'student98', 'taras.shapoval98@pnu.edu.ua', 'Шаповал Тарас', 'АНГ-31', 'student', 'pass', 4);
INSERT INTO users VALUES (100, 'student99', 'alla.holub99@pnu.edu.ua', 'Голуб Алла', 'ІСТ-31', 'student', 'pass', 5);
INSERT INTO users VALUES (101, 'student100', 'ivan.protsenko100@pnu.edu.ua', 'Проценко Іван', 'ХІМ-13', 'student', 'pass', 6);
INSERT INTO users VALUES (102, 'student101', 'veronika.klymchuk101@pnu.edu.ua', 'Климчук Вероніка', 'ПО-11', 'student', 'pass', 7);
INSERT INTO users VALUES (103, 'student102', 'roman.ovcharenko102@pnu.edu.ua', 'Овчаренко Роман', 'ПР-23', 'student', 'pass', 8);
INSERT INTO users VALUES (104, 'student103', 'daria.marchenko103@pnu.edu.ua', 'Марченко Дарія', 'КН-32', 'student', 'pass', 1);
INSERT INTO users VALUES (105, 'student104', 'maksym.tyshchenko104@pnu.edu.ua', 'Тищенко Максим', 'ОБЛ-31', 'student', 'pass', 2);
INSERT INTO users VALUES (106, 'student105', 'yuliia.yarova105@pnu.edu.ua', 'Ярова Юлія', 'ФВ-43', 'student', 'pass', 3);
INSERT INTO users VALUES (107, 'student106', 'serhii.novikov106@pnu.edu.ua', 'Новіков Сергій', 'НІМ-12', 'student', 'pass', 4);
INSERT INTO users VALUES (108, 'student107', 'olha.makarenko107@pnu.edu.ua', 'Макаренко Ольга', 'ПОЛ-42', 'student', 'pass', 5);
INSERT INTO users VALUES (109, 'student108', 'dmytro.bondar108@pnu.edu.ua', 'Бондар Дмитро', 'БІО-31', 'student', 'pass', 6);
INSERT INTO users VALUES (110, 'student109', 'tetiana.shulha109@pnu.edu.ua', 'Шульга Тетяна', 'ПО-32', 'student', 'pass', 7);
INSERT INTO users VALUES (111, 'student110', 'artem.zinchenko110@pnu.edu.ua', 'Зінченко Артем', 'ПР-31', 'student', 'pass', 8);
INSERT INTO users VALUES (112, 'student111', 'oksana.lytvyn111@pnu.edu.ua', 'Литвин Оксана', 'МАТ-42', 'student', 'pass', 1);
INSERT INTO users VALUES (113, 'student112', 'rostyslav.zakharenko112@pnu.edu.ua', 'Захаренко Ростислав', 'ЕК-21', 'student', 'pass', 2);
INSERT INTO users VALUES (114, 'student113', 'iryna.kolomiiets113@pnu.edu.ua', 'Коломієць Ірина', 'ФВ-11', 'student', 'pass', 3);
INSERT INTO users VALUES (115, 'student114', 'mykola.soroka114@pnu.edu.ua', 'Сорока Микола', 'АНГ-42', 'student', 'pass', 4);
INSERT INTO users VALUES (116, 'student115', 'nataliia.pylypenko115@pnu.edu.ua', 'Пилипенко Наталія', 'ІСТ-23', 'student', 'pass', 5);
INSERT INTO users VALUES (117, 'student116', 'yevhen.honcharenko116@pnu.edu.ua', 'Гончаренко Євген', 'ГЕО-12', 'student', 'pass', 6);
INSERT INTO users VALUES (118, 'student117', 'anastasiia.vlasenko117@pnu.edu.ua', 'Власенко Анастасія', 'ПО-21', 'student', 'pass', 7);
INSERT INTO users VALUES (119, 'student118', 'vadym.derevianko118@pnu.edu.ua', 'Дерев\'янко Вадим', 'ПР-41', 'student', 'pass', 8);
INSERT INTO users VALUES (120, 'student119', 'liubov.kornienko119@pnu.edu.ua', 'Корнієнко Любов', 'ІПЗ-41', 'student', 'pass', 1);
INSERT INTO users VALUES (121, 'student120', 'halyna.kalinina120@pnu.edu.ua', 'Калініна Галина', 'МЕН-32', 'student', 'pass', 2);
INSERT INTO users VALUES (122, 'student121', 'oleg.myroshnychenko121@pnu.edu.ua', 'Мирошниченко Олег', 'ФВ-33', 'student', 'pass', 3);
INSERT INTO users VALUES (123, 'student122', 'svitlana.sydoruk122@pnu.edu.ua', 'Сидорук Світлана', 'ФРА-31', 'student', 'pass', 4);
INSERT INTO users VALUES (124, 'student123', 'andrii.semenyuk123@pnu.edu.ua', 'Семенюк Андрій', 'ПОЛ-23', 'student', 'pass', 5);
INSERT INTO users VALUES (125, 'student124', 'olena.romaniuk124@pnu.edu.ua', 'Романюк Олена', 'ХІМ-32', 'student', 'pass', 6);
INSERT INTO users VALUES (126, 'student125', 'viktor.voitsekhovskyi125@pnu.edu.ua', 'Войцеховський Віктор', 'ПО-41', 'student', 'pass', 7);
INSERT INTO users VALUES (127, 'student126', 'marina.kucherenko126@pnu.edu.ua', 'Кучеренко Марина', 'ПР-13', 'student', 'pass', 8);
INSERT INTO users VALUES (128, 'student127', 'pavlo.kostenko127@pnu.edu.ua', 'Костенко Павло', 'ІСТ-42', 'student', 'pass', 1);
INSERT INTO users VALUES (129, 'student128', 'krystyna.danylenko128@pnu.edu.ua', 'Даниленко Кристина', 'ФІН-21', 'student', 'pass', 2);
INSERT INTO users VALUES (130, 'student129', 'taras.kravets129@pnu.edu.ua', 'Кравець Тарас', 'ФВ-21', 'student', 'pass', 3);
INSERT INTO users VALUES (131, 'student130', 'alla.moiseienko130@pnu.edu.ua', 'Моісеєнко Алла', 'АНГ-12', 'student', 'pass', 4);
INSERT INTO users VALUES (132, 'student131', 'ivan.lytvynenko131@pnu.edu.ua', 'Литвиненко Іван', 'ІСТ-13', 'student', 'pass', 5);
INSERT INTO users VALUES (133, 'student132', 'veronika.zhuravlova132@pnu.edu.ua', 'Журавльова Вероніка', 'БІО-42', 'student', 'pass', 6);
INSERT INTO users VALUES (134, 'student133', 'roman.panasiuk133@pnu.edu.ua', 'Панасюк Роман', 'ПО-13', 'student', 'pass', 7);
INSERT INTO users VALUES (135, 'student134', 'daria.fedorenko134@pnu.edu.ua', 'Федоренко Дарія', 'ПР-21', 'student', 'pass', 8);
INSERT INTO users VALUES (136, 'student135', 'maksym.poplavskyi135@pnu.edu.ua', 'Поплавський Максим', 'КН-41', 'student', 'pass', 1);
INSERT INTO users VALUES (137, 'student136', 'yuliia.kolesnyk136@pnu.edu.ua', 'Колесник Юлія', 'ЕК-33', 'student', 'pass', 2);
INSERT INTO users VALUES (138, 'student137', 'serhii.zhylin137@pnu.edu.ua', 'Жилін Сергій', 'ФВ-41', 'student', 'pass', 3);
INSERT INTO users VALUES (139, 'student138', 'olha.hrytsenko138@pnu.edu.ua', 'Гриценко Ольга', 'НІМ-41', 'student', 'pass', 4);
INSERT INTO users VALUES (140, 'student139', 'dmytro.chernenko139@pnu.edu.ua', 'Черненко Дмитро', 'ПОЛ-31', 'student', 'pass', 5);
INSERT INTO users VALUES (141, 'student140', 'tetiana.stepaniuk140@pnu.edu.ua', 'Степанюк Тетяна', 'ГЕО-21', 'student', 'pass', 6);
INSERT INTO users VALUES (142, 'student141', 'artem.kyrychenko141@pnu.edu.ua', 'Кириченко Артем', 'ПО-33', 'student', 'pass', 7);
INSERT INTO users VALUES (143, 'student142', 'oksana.melnychenko142@pnu.edu.ua', 'Мельниченко Оксана', 'ПР-33', 'student', 'pass', 8);
INSERT INTO users VALUES (144, 'student143', 'rostyslav.bilokin143@pnu.edu.ua', 'Білокінь Ростислав', 'ІПЗ-11', 'student', 'pass', 1);
INSERT INTO users VALUES (145, 'student144', 'iryna.savyn144@pnu.edu.ua', 'Савин Ірина', 'ОБЛ-22', 'student', 'pass', 2);
INSERT INTO users VALUES (146, 'student145', 'mykola.volkov145@pnu.edu.ua', 'Волков Микола', 'ФВ-13', 'student', 'pass', 3);
INSERT INTO users VALUES (147, 'student146', 'nataliia.soboleva146@pnu.edu.ua', 'Соболєва Наталія', 'АНГ-23', 'student', 'pass', 4);
INSERT INTO users VALUES (148, 'student147', 'yevhen.titov147@pnu.edu.ua', 'Тітов Євген', 'ІСТ-33', 'student', 'pass', 5);
INSERT INTO users VALUES (149, 'student148', 'anastasiia.soloviova148@pnu.edu.ua', 'Соловйова Анастасія', 'ХІМ-23', 'student', 'pass', 6);
INSERT INTO users VALUES (150, 'student149', 'vadym.yermolenko149@pnu.edu.ua', 'Єрмоленко Вадим', 'ПО-22', 'student', 'pass', 7);
USE university_db;

DROP TABLE IF EXISTS teams;

CREATE TABLE teams (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    captain_id INT,
    FOREIGN KEY (captain_id) REFERENCES users(id) ON DELETE SET NULL
);

INSERT INTO teams (`name`, `captain_id`, `description`, `id`) VALUES ('Збірна КВК "Обережно, гаряче!"', '3', 'Команда гумору ФМІ', '1');
INSERT INTO teams (`name`, `captain_id`, `description`, `id`) VALUES ('ФК "Стефаник"', '31', 'Футбольна збірна університету', '2');
INSERT INTO teams (`name`, `captain_id`, `description`, `id`) VALUES ('Code Wizards', '29', 'Команда з програмування', '3');
INSERT INTO teams (`name`, `captain_id`, `description`, `id`) VALUES ('Вокальний ансамбль "Росинка"', '4', 'Творчий колектив', '4');
INSERT INTO teams (`name`, `captain_id`, `description`, `id`) VALUES ('Debate Club PNU', '26', 'Клуб дебатів', '5');
USE university_db;

DROP TABLE IF EXISTS records;

CREATE TABLE records (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    result_value VARCHAR(100) NOT NULL,
    event_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_id INT,
    team_id INT,
    category_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL,
    FOREIGN KEY (team_id) REFERENCES teams(id) ON DELETE SET NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Стажування в Європарламенті.', 'Успішно завершено', 'approved', '2026-02-03 20:35:39', NULL, '3', '5', 'Стажування в Європарламенті (Командний залік)', '1', '2023-08-26');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Благодійний ярмарок на підтримку ЗСУ.', 'Зібрано 200 тис. грн', 'rejected', '2026-02-03 20:35:40', '17', NULL, '6', 'Благодійний ярмарок на підтримку ЗСУ', '2', '2024-02-22');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Мовний конкурс імені Петра Яцика.', 'Переможець етапу', 'approved', '2026-02-03 20:35:40', '17', NULL, '2', 'Мовний конкурс імені Петра Яцика', '3', '2026-11-05');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Erasmus+ Scholarship (Poland).', 'Отримано грант', 'approved', '2026-02-03 20:35:40', '5', NULL, '5', 'Erasmus+ Scholarship (Poland)', '4', '2024-10-18');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Хакатон "Frankivsk Tech".', 'Гран-прі', 'approved', '2026-02-03 20:35:40', '12', NULL, '3', 'Хакатон "Frankivsk Tech"', '5', '2026-11-08');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Erasmus+ Scholarship (Poland).', 'Отримано грант', 'approved', '2026-02-03 20:35:40', '17', NULL, '5', 'Erasmus+ Scholarship (Poland)', '6', '2024-03-04');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Найбільша кількість волонтерських годин.', 'Рекорд факультету', 'approved', '2026-02-03 20:35:40', '31', NULL, '6', 'Найбільша кількість волонтерських годин', '7', '2026-08-12');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Конкурс наукових робіт Фонду Пінчука.', 'Лауреат', 'approved', '2026-02-03 20:35:40', '27', NULL, '2', 'Конкурс наукових робіт Фонду Пінчука', '8', '2024-02-20');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Конкурс наукових робіт Фонду Пінчука.', 'Лауреат', 'approved', '2026-02-03 20:35:40', '5', NULL, '2', 'Конкурс наукових робіт Фонду Пінчука', '9', '2025-09-07');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Танцювальний батл між факультетами.', 'Кубок глядачів', 'approved', '2026-02-03 20:35:40', '11', NULL, '4', 'Танцювальний батл між факультетами', '10', '2026-09-18');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Найбільша кількість волонтерських годин.', 'Рекорд факультету', 'approved', '2026-02-03 20:35:40', NULL, '5', '6', 'Найбільша кількість волонтерських годин (Командний залік)', '11', '2023-12-11');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Студентська олімпіада з програмування.', 'Диплом 1 ступеня', 'approved', '2026-02-03 20:35:40', '14', NULL, '3', 'Студентська олімпіада з програмування', '12', '2026-12-10');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Еко-акція "Чисті Карпати".', 'Подяка від ректора', 'pending', '2026-02-03 20:35:40', '22', NULL, '6', 'Еко-акція "Чисті Карпати"', '13', '2023-08-11');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Голос Університету.', '1 місце', 'approved', '2026-02-03 20:35:40', '15', NULL, '4', 'Голос Університету', '14', '2026-02-20');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Міс ПНУ 2024.', 'Титул Міс Грація', 'approved', '2026-02-03 20:35:41', '29', NULL, '4', 'Міс ПНУ 2024', '15', '2023-11-15');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Найбільша кількість волонтерських годин.', 'Рекорд факультету', 'approved', '2026-02-03 20:35:41', '17', NULL, '6', 'Найбільша кількість волонтерських годин', '16', '2023-11-16');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Міжнародний хакатон NASA Space Apps.', 'Global Nominee', 'approved', '2026-02-03 20:35:41', '11', NULL, '5', 'Міжнародний хакатон NASA Space Apps', '17', '2024-09-10');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Наукова конференція молодих вчених.', 'Краща доповідь', 'pending', '2026-02-03 20:35:41', '16', NULL, '2', 'Наукова конференція молодих вчених', '18', '2025-09-15');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Конкурс наукових робіт Фонду Пінчука.', 'Лауреат', 'pending', '2026-02-03 20:35:41', '3', NULL, '2', 'Конкурс наукових робіт Фонду Пінчука', '19', '2026-11-25');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Голос Університету.', '1 місце', 'pending', '2026-02-03 20:35:41', '2', NULL, '4', 'Голос Університету', '20', '2023-04-21');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Erasmus+ Scholarship (Poland).', 'Отримано грант', 'pending', '2026-02-03 20:35:41', NULL, '5', '5', 'Erasmus+ Scholarship (Poland) (Командний залік)', '21', '2024-12-06');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Мовний конкурс імені Петра Яцика.', 'Переможець етапу', 'rejected', '2026-02-03 20:35:41', '18', NULL, '2', 'Мовний конкурс імені Петра Яцика', '22', '2023-02-05');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Конкурс наукових робіт Фонду Пінчука.', 'Лауреат', 'approved', '2026-02-03 20:35:41', '25', NULL, '2', 'Конкурс наукових робіт Фонду Пінчука', '23', '2023-08-10');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Міжнародний хакатон NASA Space Apps.', 'Global Nominee', 'approved', '2026-02-03 20:35:41', '26', NULL, '5', 'Міжнародний хакатон NASA Space Apps', '24', '2024-08-28');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Стажування в Європарламенті.', 'Успішно завершено', 'approved', '2026-02-03 20:35:41', '21', NULL, '5', 'Стажування в Європарламенті', '25', '2025-09-11');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Стажування в Європарламенті.', 'Успішно завершено', 'pending', '2026-02-03 20:35:41', '30', NULL, '5', 'Стажування в Європарламенті', '26', '2023-04-06');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Турнір з шахів пам\'яті Стефаника.', 'Переможець', 'approved', '2026-02-03 20:35:41', '17', NULL, '1', 'Турнір з шахів пам\'яті Стефаника', '27', '2026-07-15');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Найбільша кількість волонтерських годин.', 'Рекорд факультету', 'approved', '2026-02-03 20:35:41', '2', NULL, '6', 'Найбільша кількість волонтерських годин', '28', '2026-12-21');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Міжнародний хакатон NASA Space Apps.', 'Global Nominee', 'approved', '2026-02-03 20:35:41', '24', NULL, '5', 'Міжнародний хакатон NASA Space Apps', '29', '2025-06-12');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Мовний конкурс імені Петра Яцика.', 'Переможець етапу', 'approved', '2026-02-03 20:35:42', '11', NULL, '2', 'Мовний конкурс імені Петра Яцика', '30', '2023-06-10');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Хакатон "Frankivsk Tech".', 'Гран-прі', 'approved', '2026-02-03 20:35:42', NULL, '4', '3', 'Хакатон "Frankivsk Tech" (Командний залік)', '31', '2025-03-28');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Літературний вечір "Поезія Франківська".', 'Відзнака', 'pending', '2026-02-03 20:35:42', '26', NULL, '4', 'Літературний вечір "Поезія Франківська"', '32', '2024-10-19');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Чемпіонат області з баскетболу.', '2 місце', 'rejected', '2026-02-03 20:35:42', '21', NULL, '1', 'Чемпіонат області з баскетболу', '33', '2024-12-06');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Чемпіонат області з баскетболу.', '2 місце', 'rejected', '2026-02-03 20:35:42', '2', NULL, '1', 'Чемпіонат області з баскетболу', '34', '2026-04-07');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Кубок Ректора з футзалу.', '1 місце', 'rejected', '2026-02-03 20:35:42', '9', NULL, '1', 'Кубок Ректора з футзалу', '35', '2024-09-26');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Хакатон "Frankivsk Tech".', 'Гран-прі', 'approved', '2026-02-03 20:35:42', '2', NULL, '3', 'Хакатон "Frankivsk Tech"', '36', '2025-12-28');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Благодійний ярмарок на підтримку ЗСУ.', 'Зібрано 200 тис. грн', 'rejected', '2026-02-03 20:35:42', '23', NULL, '6', 'Благодійний ярмарок на підтримку ЗСУ', '37', '2026-06-28');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Еко-акція "Чисті Карпати".', 'Подяка від ректора', 'approved', '2026-02-03 20:35:42', '4', NULL, '6', 'Еко-акція "Чисті Карпати"', '38', '2023-06-23');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Студентська олімпіада з програмування.', 'Диплом 1 ступеня', 'approved', '2026-02-03 20:35:42', '14', NULL, '3', 'Студентська олімпіада з програмування', '39', '2026-12-24');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Конкурс стартапів "Ідеї майбутнього".', 'Грант на розробку', 'pending', '2026-02-03 20:35:42', '8', NULL, '3', 'Конкурс стартапів "Ідеї майбутнього"', '40', '2025-01-02');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Конкурс наукових робіт Фонду Пінчука.', 'Лауреат', 'pending', '2026-02-03 20:35:42', NULL, '5', '2', 'Конкурс наукових робіт Фонду Пінчука (Командний залік)', '41', '2025-07-13');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Турнір з шахів пам\'яті Стефаника.', 'Переможець', 'approved', '2026-02-03 20:35:42', '2', NULL, '1', 'Турнір з шахів пам\'яті Стефаника', '42', '2023-07-10');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Голос Університету.', '1 місце', 'approved', '2026-02-03 20:35:42', '7', NULL, '4', 'Голос Університету', '43', '2025-06-16');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Хакатон "Frankivsk Tech".', 'Гран-прі', 'pending', '2026-02-03 20:35:42', '24', NULL, '3', 'Хакатон "Frankivsk Tech"', '44', '2026-08-16');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Google Hash Code (Hub PNU).', 'Топ-10 України', 'pending', '2026-02-03 20:35:43', '17', NULL, '3', 'Google Hash Code (Hub PNU)', '45', '2024-05-07');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Erasmus+ Scholarship (Poland).', 'Отримано грант', 'rejected', '2026-02-03 20:35:43', '27', NULL, '5', 'Erasmus+ Scholarship (Poland)', '46', '2026-05-01');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Літературний вечір "Поезія Франківська".', 'Відзнака', 'approved', '2026-02-03 20:35:43', '24', NULL, '4', 'Літературний вечір "Поезія Франківська"', '47', '2026-01-03');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Наукова конференція молодих вчених.', 'Краща доповідь', 'approved', '2026-02-03 20:35:43', '26', NULL, '2', 'Наукова конференція молодих вчених', '48', '2026-02-21');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Хакатон "Frankivsk Tech".', 'Гран-прі', 'pending', '2026-02-03 20:35:43', '21', NULL, '3', 'Хакатон "Frankivsk Tech"', '49', '2023-05-10');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Літературний вечір "Поезія Франківська".', 'Відзнака', 'approved', '2026-02-03 20:35:43', '4', NULL, '4', 'Літературний вечір "Поезія Франківська"', '50', '2025-08-20');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Танцювальний батл між факультетами.', 'Кубок глядачів', 'pending', '2026-02-03 20:35:43', NULL, '4', '4', 'Танцювальний батл між факультетами (Командний залік)', '51', '2026-09-08');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Благодійний ярмарок на підтримку ЗСУ.', 'Зібрано 200 тис. грн', 'rejected', '2026-02-03 20:35:43', '3', NULL, '6', 'Благодійний ярмарок на підтримку ЗСУ', '52', '2024-10-04');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Стажування в Європарламенті.', 'Успішно завершено', 'approved', '2026-02-03 20:35:43', '12', NULL, '5', 'Стажування в Європарламенті', '53', '2025-02-03');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Кубок Ректора з футзалу.', '1 місце', 'pending', '2026-02-03 20:35:43', '3', NULL, '1', 'Кубок Ректора з футзалу', '54', '2025-03-16');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Танцювальний батл між факультетами.', 'Кубок глядачів', 'rejected', '2026-02-03 20:35:43', '28', NULL, '4', 'Танцювальний батл між факультетами', '55', '2025-08-20');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Літературний вечір "Поезія Франківська".', 'Відзнака', 'pending', '2026-02-03 20:35:43', '29', NULL, '4', 'Літературний вечір "Поезія Франківська"', '56', '2025-03-17');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Наукова конференція молодих вчених.', 'Краща доповідь', 'approved', '2026-02-03 20:35:43', '4', NULL, '2', 'Наукова конференція молодих вчених', '57', '2025-08-13');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Наукова конференція молодих вчених.', 'Краща доповідь', 'approved', '2026-02-03 20:35:43', '11', NULL, '2', 'Наукова конференція молодих вчених', '58', '2023-02-02');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Студентська олімпіада з програмування.', 'Диплом 1 ступеня', 'rejected', '2026-02-03 20:35:43', '3', NULL, '3', 'Студентська олімпіада з програмування', '59', '2024-02-16');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Універсіада: Легка атлетика.', 'Золота медаль', 'approved', '2026-02-03 20:35:44', '26', NULL, '1', 'Універсіада: Легка атлетика', '60', '2026-04-05');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Студентська олімпіада з програмування.', 'Диплом 1 ступеня', 'approved', '2026-02-03 20:35:44', NULL, '3', '3', 'Студентська олімпіада з програмування (Командний залік)', '61', '2024-07-27');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Конкурс наукових робіт Фонду Пінчука.', 'Лауреат', 'pending', '2026-02-03 20:35:44', '14', NULL, '2', 'Конкурс наукових робіт Фонду Пінчука', '62', '2024-12-06');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Голос Університету.', '1 місце', 'approved', '2026-02-03 20:35:44', '18', NULL, '4', 'Голос Університету', '63', '2024-10-12');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Найбільша кількість волонтерських годин.', 'Рекорд факультету', 'pending', '2026-02-03 20:35:44', '30', NULL, '6', 'Найбільша кількість волонтерських годин', '64', '2025-05-10');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Мовний конкурс імені Петра Яцика.', 'Переможець етапу', 'approved', '2026-02-03 20:35:44', '6', NULL, '2', 'Мовний конкурс імені Петра Яцика', '65', '2023-04-27');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Найбільша кількість волонтерських годин.', 'Рекорд факультету', 'approved', '2026-02-03 20:35:44', '10', NULL, '6', 'Найбільша кількість волонтерських годин', '66', '2023-02-28');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Благодійний ярмарок на підтримку ЗСУ.', 'Зібрано 200 тис. грн', 'approved', '2026-02-03 20:35:44', '3', NULL, '6', 'Благодійний ярмарок на підтримку ЗСУ', '67', '2026-11-05');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Танцювальний батл між факультетами.', 'Кубок глядачів', 'pending', '2026-02-03 20:35:44', '29', NULL, '4', 'Танцювальний батл між факультетами', '68', '2024-08-28');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Міжнародний хакатон NASA Space Apps.', 'Global Nominee', 'rejected', '2026-02-03 20:35:44', '29', NULL, '5', 'Міжнародний хакатон NASA Space Apps', '69', '2023-05-16');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Конкурс наукових робіт Фонду Пінчука.', 'Лауреат', 'approved', '2026-02-03 20:35:44', '5', NULL, '2', 'Конкурс наукових робіт Фонду Пінчука', '70', '2024-05-26');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Міжнародний хакатон NASA Space Apps.', 'Global Nominee', 'pending', '2026-02-03 20:35:44', NULL, '2', '5', 'Міжнародний хакатон NASA Space Apps (Командний залік)', '71', '2026-09-02');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Чемпіонат області з баскетболу.', '2 місце', 'rejected', '2026-02-03 20:35:44', '6', NULL, '1', 'Чемпіонат області з баскетболу', '72', '2023-03-08');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Літературний вечір "Поезія Франківська".', 'Відзнака', 'approved', '2026-02-03 20:35:44', '24', NULL, '4', 'Літературний вечір "Поезія Франківська"', '73', '2023-01-20');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Універсіада: Легка атлетика.', 'Золота медаль', 'approved', '2026-02-03 20:35:44', '7', NULL, '1', 'Універсіада: Легка атлетика', '74', '2025-04-09');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Google Hash Code (Hub PNU).', 'Топ-10 України', 'approved', '2026-02-03 20:35:45', '27', NULL, '3', 'Google Hash Code (Hub PNU)', '75', '2025-08-08');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Міжнародний хакатон NASA Space Apps.', 'Global Nominee', 'pending', '2026-02-03 20:35:45', '8', NULL, '5', 'Міжнародний хакатон NASA Space Apps', '76', '2026-11-01');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Кубок Ректора з футзалу.', '1 місце', 'approved', '2026-02-03 20:35:45', '20', NULL, '1', 'Кубок Ректора з футзалу', '77', '2023-08-06');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Еко-акція "Чисті Карпати".', 'Подяка від ректора', 'pending', '2026-02-03 20:35:45', '16', NULL, '6', 'Еко-акція "Чисті Карпати"', '78', '2026-05-14');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Студентська олімпіада з програмування.', 'Диплом 1 ступеня', 'approved', '2026-02-03 20:35:45', '17', NULL, '3', 'Студентська олімпіада з програмування', '79', '2026-07-03');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Найбільша кількість волонтерських годин.', 'Рекорд факультету', 'approved', '2026-02-03 20:35:45', '6', NULL, '6', 'Найбільша кількість волонтерських годин', '80', '2025-08-25');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Чемпіонат області з баскетболу.', '2 місце', 'approved', '2026-02-03 20:35:45', NULL, '1', '1', 'Чемпіонат області з баскетболу (Командний залік)', '81', '2026-05-20');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Танцювальний батл між факультетами.', 'Кубок глядачів', 'approved', '2026-02-03 20:35:45', '17', NULL, '4', 'Танцювальний батл між факультетами', '82', '2025-03-18');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Еко-акція "Чисті Карпати".', 'Подяка від ректора', 'pending', '2026-02-03 20:35:45', '18', NULL, '6', 'Еко-акція "Чисті Карпати"', '83', '2023-02-05');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Стажування в Європарламенті.', 'Успішно завершено', 'rejected', '2026-02-03 20:35:45', '4', NULL, '5', 'Стажування в Європарламенті', '84', '2025-07-06');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Google Hash Code (Hub PNU).', 'Топ-10 України', 'approved', '2026-02-03 20:35:45', '2', NULL, '3', 'Google Hash Code (Hub PNU)', '85', '2026-12-21');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Хакатон "Frankivsk Tech".', 'Гран-прі', 'approved', '2026-02-03 20:35:45', '23', NULL, '3', 'Хакатон "Frankivsk Tech"', '86', '2023-08-20');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Еко-акція "Чисті Карпати".', 'Подяка від ректора', 'approved', '2026-02-03 20:35:45', '19', NULL, '6', 'Еко-акція "Чисті Карпати"', '87', '2023-06-17');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Стажування в Європарламенті.', 'Успішно завершено', 'approved', '2026-02-03 20:35:45', '3', NULL, '5', 'Стажування в Європарламенті', '88', '2023-08-08');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Кубок Ректора з футзалу.', '1 місце', 'approved', '2026-02-03 20:35:46', '22', NULL, '1', 'Кубок Ректора з футзалу', '89', '2026-12-14');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Google Hash Code (Hub PNU).', 'Топ-10 України', 'approved', '2026-02-03 20:35:46', '19', NULL, '3', 'Google Hash Code (Hub PNU)', '90', '2025-09-08');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Еко-акція "Чисті Карпати".', 'Подяка від ректора', 'approved', '2026-02-03 20:35:46', NULL, '5', '6', 'Еко-акція "Чисті Карпати" (Командний залік)', '91', '2026-05-14');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Конкурс наукових робіт Фонду Пінчука.', 'Лауреат', 'approved', '2026-02-03 20:35:46', '11', NULL, '2', 'Конкурс наукових робіт Фонду Пінчука', '92', '2025-05-21');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Універсіада: Легка атлетика.', 'Золота медаль', 'approved', '2026-02-03 20:35:46', '27', NULL, '1', 'Універсіада: Легка атлетика', '93', '2026-06-09');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Erasmus+ Scholarship (Poland).', 'Отримано грант', 'rejected', '2026-02-03 20:35:46', '9', NULL, '5', 'Erasmus+ Scholarship (Poland)', '94', '2023-01-04');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Благодійний ярмарок на підтримку ЗСУ.', 'Зібрано 200 тис. грн', 'approved', '2026-02-03 20:35:46', '28', NULL, '6', 'Благодійний ярмарок на підтримку ЗСУ', '95', '2025-10-13');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Хакатон "Frankivsk Tech".', 'Гран-прі', 'approved', '2026-02-03 20:35:46', '3', NULL, '3', 'Хакатон "Frankivsk Tech"', '96', '2026-06-23');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Найбільша кількість волонтерських годин.', 'Рекорд факультету', 'rejected', '2026-02-03 20:35:46', '23', NULL, '6', 'Найбільша кількість волонтерських годин', '97', '2023-02-08');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Танцювальний батл між факультетами.', 'Кубок глядачів', 'approved', '2026-02-03 20:35:46', '9', NULL, '4', 'Танцювальний батл між факультетами', '98', '2026-06-03');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Турнір з шахів пам\'яті Стефаника.', 'Переможець', 'approved', '2026-02-03 20:35:46', '15', NULL, '1', 'Турнір з шахів пам\'яті Стефаника', '99', '2024-12-07');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Мовний конкурс імені Петра Яцика.', 'Переможець етапу', 'pending', '2026-02-03 20:35:46', '30', NULL, '2', 'Мовний конкурс імені Петра Яцика', '100', '2024-07-12');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Еко-акція "Чисті Карпати".', 'Подяка від ректора', 'pending', '2026-02-03 20:35:46', NULL, '1', '6', 'Еко-акція "Чисті Карпати" (Командний залік)', '101', '2026-09-04');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Erasmus+ Scholarship (Poland).', 'Отримано грант', 'approved', '2026-02-03 20:35:46', '28', NULL, '5', 'Erasmus+ Scholarship (Poland)', '102', '2023-09-12');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Голос Університету.', '1 місце', 'rejected', '2026-02-03 20:35:46', '9', NULL, '4', 'Голос Університету', '103', '2024-08-09');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Найбільша кількість волонтерських годин.', 'Рекорд факультету', 'approved', '2026-02-03 20:35:47', '9', NULL, '6', 'Найбільша кількість волонтерських годин', '104', '2023-11-15');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Літературний вечір "Поезія Франківська".', 'Відзнака', 'approved', '2026-02-03 20:35:47', '14', NULL, '4', 'Літературний вечір "Поезія Франківська"', '105', '2026-05-06');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Erasmus+ Scholarship (Poland).', 'Отримано грант', 'approved', '2026-02-03 20:35:47', '19', NULL, '5', 'Erasmus+ Scholarship (Poland)', '106', '2025-09-04');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Міжнародний хакатон NASA Space Apps.', 'Global Nominee', 'rejected', '2026-02-03 20:35:47', '31', NULL, '5', 'Міжнародний хакатон NASA Space Apps', '107', '2025-03-28');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Найбільша кількість волонтерських годин.', 'Рекорд факультету', 'pending', '2026-02-03 20:35:47', '8', NULL, '6', 'Найбільша кількість волонтерських годин', '108', '2023-09-08');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Студентська олімпіада з програмування.', 'Диплом 1 ступеня', 'approved', '2026-02-03 20:35:47', '31', NULL, '3', 'Студентська олімпіада з програмування', '109', '2023-02-28');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Благодійний ярмарок на підтримку ЗСУ.', 'Зібрано 200 тис. грн', 'pending', '2026-02-03 20:35:47', '12', NULL, '6', 'Благодійний ярмарок на підтримку ЗСУ', '110', '2026-12-15');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Наукова конференція молодих вчених.', 'Краща доповідь', 'rejected', '2026-02-03 20:35:47', NULL, '2', '2', 'Наукова конференція молодих вчених (Командний залік)', '111', '2025-09-27');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Універсіада: Легка атлетика.', 'Золота медаль', 'approved', '2026-02-03 20:35:47', '23', NULL, '1', 'Універсіада: Легка атлетика', '112', '2025-07-06');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Універсіада: Легка атлетика.', 'Золота медаль', 'approved', '2026-02-03 20:35:47', '11', NULL, '1', 'Універсіада: Легка атлетика', '113', '2026-12-11');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Міс ПНУ 2024.', 'Титул Міс Грація', 'approved', '2026-02-03 20:35:47', '8', NULL, '4', 'Міс ПНУ 2024', '114', '2024-12-05');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Турнір з шахів пам\'яті Стефаника.', 'Переможець', 'approved', '2026-02-03 20:35:47', '17', NULL, '1', 'Турнір з шахів пам\'яті Стефаника', '115', '2025-03-26');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Стажування в Європарламенті.', 'Успішно завершено', 'approved', '2026-02-03 20:35:47', '3', NULL, '5', 'Стажування в Європарламенті', '116', '2024-06-05');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Erasmus+ Scholarship (Poland).', 'Отримано грант', 'pending', '2026-02-03 20:35:47', '4', NULL, '5', 'Erasmus+ Scholarship (Poland)', '117', '2026-10-24');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Стажування в Європарламенті.', 'Успішно завершено', 'approved', '2026-02-03 20:35:48', '6', NULL, '5', 'Стажування в Європарламенті', '118', '2025-10-10');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Турнір з шахів пам\'яті Стефаника.', 'Переможець', 'approved', '2026-02-03 20:35:48', '5', NULL, '1', 'Турнір з шахів пам\'яті Стефаника', '119', '2024-03-15');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Google Hash Code (Hub PNU).', 'Топ-10 України', 'pending', '2026-02-03 20:35:48', '23', NULL, '3', 'Google Hash Code (Hub PNU)', '120', '2025-05-04');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Стажування в Європарламенті.', 'Успішно завершено', 'rejected', '2026-02-03 20:35:48', NULL, '1', '5', 'Стажування в Європарламенті (Командний залік)', '121', '2024-06-07');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Універсіада: Легка атлетика.', 'Золота медаль', 'rejected', '2026-02-03 20:35:48', '13', NULL, '1', 'Універсіада: Легка атлетика', '122', '2023-04-09');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Стажування в Європарламенті.', 'Успішно завершено', 'approved', '2026-02-03 20:35:48', '12', NULL, '5', 'Стажування в Європарламенті', '123', '2025-06-19');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Наукова конференція молодих вчених.', 'Краща доповідь', 'rejected', '2026-02-03 20:35:48', '10', NULL, '2', 'Наукова конференція молодих вчених', '124', '2025-08-28');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Найбільша кількість волонтерських годин.', 'Рекорд факультету', 'approved', '2026-02-03 20:35:48', '29', NULL, '6', 'Найбільша кількість волонтерських годин', '125', '2023-05-13');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Мовний конкурс імені Петра Яцика.', 'Переможець етапу', 'approved', '2026-02-03 20:35:48', '20', NULL, '2', 'Мовний конкурс імені Петра Яцика', '126', '2023-02-24');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Літературний вечір "Поезія Франківська".', 'Відзнака', 'approved', '2026-02-03 20:35:48', '11', NULL, '4', 'Літературний вечір "Поезія Франківська"', '127', '2026-08-09');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Міжнародний хакатон NASA Space Apps.', 'Global Nominee', 'rejected', '2026-02-03 20:35:48', '20', NULL, '5', 'Міжнародний хакатон NASA Space Apps', '128', '2023-01-15');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Студентська олімпіада з програмування.', 'Диплом 1 ступеня', 'rejected', '2026-02-03 20:35:48', '12', NULL, '3', 'Студентська олімпіада з програмування', '129', '2026-02-25');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Танцювальний батл між факультетами.', 'Кубок глядачів', 'pending', '2026-02-03 20:35:48', '18', NULL, '4', 'Танцювальний батл між факультетами', '130', '2026-03-16');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Голос Університету.', '1 місце', 'rejected', '2026-02-03 20:35:48', NULL, '2', '4', 'Голос Університету (Командний залік)', '131', '2026-05-18');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Найбільша кількість волонтерських годин.', 'Рекорд факультету', 'approved', '2026-02-03 20:35:48', '14', NULL, '6', 'Найбільша кількість волонтерських годин', '132', '2025-03-13');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Танцювальний батл між факультетами.', 'Кубок глядачів', 'rejected', '2026-02-03 20:35:48', '16', NULL, '4', 'Танцювальний батл між факультетами', '133', '2025-12-05');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Еко-акція "Чисті Карпати".', 'Подяка від ректора', 'approved', '2026-02-03 20:35:49', '7', NULL, '6', 'Еко-акція "Чисті Карпати"', '134', '2026-10-04');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Наукова конференція молодих вчених.', 'Краща доповідь', 'approved', '2026-02-03 20:35:49', '11', NULL, '2', 'Наукова конференція молодих вчених', '135', '2025-11-09');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Голос Університету.', '1 місце', 'rejected', '2026-02-03 20:35:49', '17', NULL, '4', 'Голос Університету', '136', '2024-05-17');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Еко-акція "Чисті Карпати".', 'Подяка від ректора', 'approved', '2026-02-03 20:35:49', '30', NULL, '6', 'Еко-акція "Чисті Карпати"', '137', '2025-11-07');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Стажування в Європарламенті.', 'Успішно завершено', 'approved', '2026-02-03 20:35:49', '16', NULL, '5', 'Стажування в Європарламенті', '138', '2026-03-21');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Турнір з шахів пам\'яті Стефаника.', 'Переможець', 'rejected', '2026-02-03 20:35:49', '27', NULL, '1', 'Турнір з шахів пам\'яті Стефаника', '139', '2024-04-03');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Erasmus+ Scholarship (Poland).', 'Отримано грант', 'rejected', '2026-02-03 20:35:49', '4', NULL, '5', 'Erasmus+ Scholarship (Poland)', '140', '2025-07-18');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Стажування в Європарламенті.', 'Успішно завершено', 'rejected', '2026-02-03 20:35:49', NULL, '4', '5', 'Стажування в Європарламенті (Командний залік)', '141', '2023-04-17');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Літературний вечір "Поезія Франківська".', 'Відзнака', 'approved', '2026-02-03 20:35:49', '2', NULL, '4', 'Літературний вечір "Поезія Франківська"', '142', '2023-05-24');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Голос Університету.', '1 місце', 'pending', '2026-02-03 20:35:49', '24', NULL, '4', 'Голос Університету', '143', '2023-12-05');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Голос Університету.', '1 місце', 'pending', '2026-02-03 20:35:49', '3', NULL, '4', 'Голос Університету', '144', '2024-03-13');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Турнір з шахів пам\'яті Стефаника.', 'Переможець', 'pending', '2026-02-03 20:35:49', '30', NULL, '1', 'Турнір з шахів пам\'яті Стефаника', '145', '2026-10-08');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Голос Університету.', '1 місце', 'approved', '2026-02-03 20:35:49', '18', NULL, '4', 'Голос Університету', '146', '2025-05-04');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Турнір з шахів пам\'яті Стефаника.', 'Переможець', 'approved', '2026-02-03 20:35:49', '26', NULL, '1', 'Турнір з шахів пам\'яті Стефаника', '147', '2026-07-24');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Стажування в Європарламенті.', 'Успішно завершено', 'approved', '2026-02-03 20:35:50', '28', NULL, '5', 'Стажування в Європарламенті', '148', '2024-04-03');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Універсіада: Легка атлетика.', 'Золота медаль', 'approved', '2026-02-03 20:35:50', '9', NULL, '1', 'Універсіада: Легка атлетика', '149', '2023-06-08');
INSERT INTO records (`description`, `result_value`, `status`, `created_at`, `user_id`, `team_id`, `category_id`, `title`, `id`, `event_date`) VALUES ('Студенти ПНУ показали високий рівень підготовки. Подія: Голос Університету.', '1 місце', 'approved', '2026-02-03 20:35:50', '3', NULL, '4', 'Голос Університету', '150', '2025-02-17');
USE university_db;

DROP TABLE IF EXISTS achievements;

CREATE TABLE achievements (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    points INT DEFAULT 0,
    awarded_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('80', 'Спортсмен року', '1', '2026-02-03 20:35:51', 'За вагомий внесок у розвиток університету', '16');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('50', 'Активіст профкому', '2', '2026-02-03 20:35:52', 'За вагомий внесок у розвиток університету', '6');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('100', 'Гордість ФМІ', '3', '2026-02-03 20:35:52', 'За вагомий внесок у розвиток університету', '27');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('100', 'Гордість ФМІ', '4', '2026-02-03 20:35:52', 'За вагомий внесок у розвиток університету', '13');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('60', 'Волонтер ПНУ', '5', '2026-02-03 20:35:52', 'За вагомий внесок у розвиток університету', '26');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('100', 'Гордість ФМІ', '6', '2026-02-03 20:35:52', 'За вагомий внесок у розвиток університету', '17');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('80', 'Спортсмен року', '7', '2026-02-03 20:35:52', 'За вагомий внесок у розвиток університету', '13');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('80', 'Спортсмен року', '8', '2026-02-03 20:35:52', 'За вагомий внесок у розвиток університету', '7');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('80', 'Спортсмен року', '9', '2026-02-03 20:35:52', 'За вагомий внесок у розвиток університету', '28');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('80', 'Спортсмен року', '10', '2026-02-03 20:35:52', 'За вагомий внесок у розвиток університету', '22');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('50', 'Активіст профкому', '11', '2026-02-03 20:35:52', 'За вагомий внесок у розвиток університету', '21');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('90', 'Наукова надія', '12', '2026-02-03 20:35:52', 'За вагомий внесок у розвиток університету', '9');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('60', 'Волонтер ПНУ', '13', '2026-02-03 20:35:52', 'За вагомий внесок у розвиток університету', '19');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('60', 'Волонтер ПНУ', '14', '2026-02-03 20:35:52', 'За вагомий внесок у розвиток університету', '11');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('50', 'Активіст профкому', '15', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '29');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('60', 'Волонтер ПНУ', '16', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '20');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('100', 'Гордість ФМІ', '17', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '29');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('50', 'Активіст профкому', '18', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '4');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('90', 'Наукова надія', '19', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '4');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('90', 'Наукова надія', '20', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '27');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('80', 'Спортсмен року', '21', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '31');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('80', 'Спортсмен року', '22', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '28');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('100', 'Гордість ФМІ', '23', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '4');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('80', 'Спортсмен року', '24', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '4');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('80', 'Спортсмен року', '25', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '30');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('100', 'Гордість ФМІ', '26', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '8');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('90', 'Наукова надія', '27', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '31');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('80', 'Спортсмен року', '28', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '23');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('90', 'Наукова надія', '29', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '26');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('80', 'Спортсмен року', '30', '2026-02-03 20:35:53', 'За вагомий внесок у розвиток університету', '23');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('90', 'Наукова надія', '31', '2026-02-03 20:35:54', 'За вагомий внесок у розвиток університету', '7');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('80', 'Спортсмен року', '32', '2026-02-03 20:35:54', 'За вагомий внесок у розвиток університету', '17');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('90', 'Наукова надія', '33', '2026-02-03 20:35:54', 'За вагомий внесок у розвиток університету', '25');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('50', 'Активіст профкому', '34', '2026-02-03 20:35:54', 'За вагомий внесок у розвиток університету', '26');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('50', 'Активіст профкому', '35', '2026-02-03 20:35:54', 'За вагомий внесок у розвиток університету', '2');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('50', 'Активіст профкому', '36', '2026-02-03 20:35:54', 'За вагомий внесок у розвиток університету', '15');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('100', 'Гордість ФМІ', '37', '2026-02-03 20:35:54', 'За вагомий внесок у розвиток університету', '31');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('100', 'Гордість ФМІ', '38', '2026-02-03 20:35:54', 'За вагомий внесок у розвиток університету', '20');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('50', 'Активіст профкому', '39', '2026-02-03 20:35:54', 'За вагомий внесок у розвиток університету', '7');
INSERT INTO achievements (`points`, `name`, `id`, `awarded_at`, `description`, `user_id`) VALUES ('80', 'Спортсмен року', '40', '2026-02-03 20:35:54', 'За вагомий внесок у розвиток університету', '4');
USE university_db;

DROP TABLE IF EXISTS uploaded_files;

CREATE TABLE uploaded_files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    filename VARCHAR(255) NOT NULL,
    file_path VARCHAR(255) NOT NULL,
    uploaded_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    record_id INT,
    FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE
);
