create database JavaTeachAndLearn;
use JavaTeachAndLearn;

CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL, 
    email VARCHAR(100) NOT NULL,
    phoneNum VARCHAR(13) NOT NULL,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL,
    role ENUM('guest', 'staff') NOT NULL
);
select * from users; 

DELETE FROM users WHERE user_id = 4;



CREATE TABLE IF NOT EXISTS categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    titlecg VARCHAR(255) NOT NULL UNIQUE,
    desccg TEXT NOT NULL,
    datecg DATE NOT NULL
);
select * from categories;

CREATE TABLE knowledge (
    knowledge_id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    content TEXT,
    created_by INT,
    created_at Date,
    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id),
    CONSTRAINT fk_user
        FOREIGN KEY (created_by)
        REFERENCES users(user_id)
);

select * from knowledge;