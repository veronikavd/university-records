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