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