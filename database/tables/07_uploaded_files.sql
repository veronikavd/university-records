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