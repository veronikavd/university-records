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

INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('1', 'admin', 'admin@pnu.edu.ua', 'Адміністратор ПНУ', 'admin', 'admin', NULL, '1');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('2', 'student1', 'юлія.яремчук1@pnu.edu.ua', 'Яремчук Юлія', 'student', 'pass', 'ІСТ-43', '1');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('3', 'student2', 'андрій.павлюк2@pnu.edu.ua', 'Павлюк Андрій', 'student', 'pass', 'ІСТ-33', '3');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('4', 'student3', 'ярослав.савчук3@pnu.edu.ua', 'Савчук Ярослав', 'student', 'pass', 'БІО-13', '7');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('5', 'student4', 'надія.ткачук4@pnu.edu.ua', 'Ткачук Надія', 'student', 'pass', 'ПО-32', '1');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('6', 'student5', 'іван.мельник5@pnu.edu.ua', 'Мельник Іван', 'student', 'pass', 'ФВ-11', '1');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('7', 'student6', 'анна.олійник6@pnu.edu.ua', 'Олійник Анна', 'student', 'pass', 'ФВ-12', '6');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('8', 'student7', 'дарина.олійник7@pnu.edu.ua', 'Олійник Дарина', 'student', 'pass', 'КН-43', '1');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('9', 'student8', 'надія.павлюк8@pnu.edu.ua', 'Павлюк Надія', 'student', 'pass', 'ФВ-31', '6');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('10', 'student9', 'андрій.ткачук9@pnu.edu.ua', 'Ткачук Андрій', 'student', 'pass', 'ПР-13', '2');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('11', 'student10', 'анна.олійник10@pnu.edu.ua', 'Олійник Анна', 'student', 'pass', 'ПО-42', '5');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('12', 'student11', 'андрій.кушнір11@pnu.edu.ua', 'Кушнір Андрій', 'student', 'pass', 'БІО-32', '3');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('13', 'student12', 'анна.бойко12@pnu.edu.ua', 'Бойко Анна', 'student', 'pass', 'ФВ-33', '3');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('14', 'student13', 'ярослав.поліщук13@pnu.edu.ua', 'Поліщук Ярослав', 'student', 'pass', 'ПО-13', '7');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('15', 'student14', 'олександр.гаврилюк14@pnu.edu.ua', 'Гаврилюк Олександр', 'student', 'pass', 'ЕК-12', '1');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('16', 'student15', 'софія.поліщук15@pnu.edu.ua', 'Поліщук Софія', 'student', 'pass', 'М-12', '4');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('17', 'student16', 'дмитро.кушнір16@pnu.edu.ua', 'Кушнір Дмитро', 'student', 'pass', 'АНГ-11', '1');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('18', 'student17', 'олег.олійник17@pnu.edu.ua', 'Олійник Олег', 'student', 'pass', 'М-22', '6');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('19', 'student18', 'дмитро.гаврилюк18@pnu.edu.ua', 'Гаврилюк Дмитро', 'student', 'pass', 'ПО-42', '4');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('20', 'student19', 'ярослав.павлюк19@pnu.edu.ua', 'Павлюк Ярослав', 'student', 'pass', 'ФВ-33', '8');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('21', 'student20', 'софія.коваленко20@pnu.edu.ua', 'Коваленко Софія', 'student', 'pass', 'ФВ-33', '1');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('22', 'student21', 'олена.олійник21@pnu.edu.ua', 'Олійник Олена', 'student', 'pass', 'ПР-22', '8');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('23', 'student22', 'олександр.кравчук22@pnu.edu.ua', 'Кравчук Олександр', 'student', 'pass', 'М-21', '8');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('24', 'student23', 'максим.савчук23@pnu.edu.ua', 'Савчук Максим', 'student', 'pass', 'ФВ-23', '4');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('25', 'student24', 'василь.савчук24@pnu.edu.ua', 'Савчук Василь', 'student', 'pass', 'БІО-11', '7');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('26', 'student25', 'олена.ткачук25@pnu.edu.ua', 'Ткачук Олена', 'student', 'pass', 'ПО-21', '7');
INSERT INTO users (`id`, `username`, `email`, `full_name`, `role`, `password_hash`, `group_code`, `faculty_id`) VALUES ('27', 'student26', 'оксана.бойко26@pnu.edu.ua', 'Бойко Оксана', 'student', 'pass', 'ІПЗ-