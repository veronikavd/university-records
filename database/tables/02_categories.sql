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