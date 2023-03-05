CREATE DATABASE IF NOT EXISTS library;
USE library;

CREATE TABLE IF NOT EXISTS book(
id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
name_of_the_book VARCHAR(120) NOT NULL,
description TEXT DEFAULT ('Description is absent'),
date_of_publishing DATE DEFAULT ('2018-01-01'),
category VARCHAR(30) NOT NULL,
isbn VARCHAR(20) NOT NULL UNIQUE,
amount_of_pages INT NOT NULL,
author_name VARCHAR(45) NOT NULL,
author_surname VARCHAR(45) NOT NULL,
author_email VARCHAR(50) NOT NULL UNIQUE,
author_age INT NOT NULL,
author_birthday DATE NOT NULL,
author_awards VARCHAR(120)
);
INSERT INTO book(name_of_the_book, description, date_of_publishing, category, isbn, amount_of_pages,
author_name, author_surname, author_email, author_age, author_birthday, author_awards)
VALUES
	('Pride and Prejudice',DEFAULT,'1813-03-02', 'Philosophy','21923', 250, 'Jane', 'Austen', 'JaneAusten@gmail.com', 40,'1787-03-02',DEFAULT),
	('To Kill a Mockingbird','ld through the eyes of loveable rogues Scout and Jem, it also created one of literature’s most beloved heroes',
    '1960-11-25', 'Romance','20353', 400, 'Jane', 'Austen', 'Harper@gmail.com', 40,'1787-03-02', 'Pulitzer-prize '),
	('The Great Gatsby',DEFAULT,'1825-08-25', 'Adventure','21323', 350, 'F. Scott', 'Fitzgerald ', 'Gatsby@gmail.com',50,'1795-11-02',DEFAULT),
	('In Cold Blood',DEFAULT,'1965-03-02', 'Thriller','25323', 500, 'Truman ', 'Capote ', 'Capote@gmail.com', 25,'1917-03-27', DEFAULT),
	('Brave New World',DEFAULT,'1932-5-19', 'Philosophy','20363',600, 'Aldous', 'Huxley', 'Aldous@gmail.com', 40,'1896-04-07', DEFAULT);

DROP TABLE book;

-- витягнути всі книжки
SELECT * FROM book;

 -- змінити прізвище автора в 2х книжках
 UPDATE book SET author_name = 'Uknown author' WHERE id IN (1,3);

-- підрахувати кількість книжок, в яких автори мають нагороди
SELECT COUNT(book.name_of_the_book) AS Book_with_awards FROM book WHERE book.author_awards IS NOT NULL;

-- вивести інформацію про книжку з найменшою кількістю сторінок
SELECT book.name_of_the_book  AS book_name , MIN(book.amount_of_pages) AS min_amount FROM book;

--  вивести максимальну кількість сторінок
SELECT MAX(book.amount_of_pages) AS  Max_pages FROM book;
--  вивести середню ціну книжки(ну я виводжу середню кіл-ть сторінок, бо ціни в нас нема)
SELECT AVG(book.amount_of_pages) AS AVG_pages FROM book;
--  порахувати суму книжок за категорією
SELECT
    book.name_of_the_book AS Book_name,
    book.category AS category,
    COUNT(category) AS Amount
FROM
    book
WHERE
    book.category IN (SELECT
            book.category
        FROM
            book
        GROUP BY category
        HAVING COUNT(*) > 1);
-- вивести інформацію про книжку з найменшою ціною(ну в нашому випадку з мін кіл-тю сторінок)
SELECT MIN(amount_of_pages), name_of_the_book, description FROM book;
-- 10. написати 3 запити, використавши різні види пошуку за співпадіннями(like)
SELECT * FROM book WHERE category LIKE 'p%';
SELECT * FROM book WHERE name_of_the_book LIKE 'B%d';
SELECT * FROM book WHERE category LIKE 'a__%';
--  3 запити на видалення книжки(за id, name, isbn)
DELETE FROM book WHERE id = 1;
DELETE FROM book WHERE name_of_the_book = 'Brave new world';
DELETE FROM book WHERE isbn = '20363';