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
	('Pride and Prejudice',DEFAULT,'1813-03-02', 'Philosophy','21923', 300, 'Jane', 'Austen', 'JaneAusten@gmail.com', 40,'1787-03-02',DEFAULT),
	('To Kill a Mockingbird','ld through the eyes of loveable rogues Scout and Jem, it also created one of literature’s most beloved heroes',
    '1960-11-25', 'Romance','20353', 400, 'Jane', 'Austen', 'Harper@gmail.com', 40,'1787-03-02', 'Pulitzer-prize '),
	('The Great Gatsby',DEFAULT,'1825-08-25', 'Adventure','21323', 300, 'F. Scott', 'Fitzgerald ', 'Gatsby@gmail.com',50,'1795-11-02',DEFAULT),
	('In Cold Blood',DEFAULT,'1965-03-02', 'Thriller','25323', 300, 'Truman ', 'Capote ', 'Capote@gmail.com', 25,'1917-03-27', DEFAULT),
	('Brave New World',DEFAULT,'1932-5-19', 'Philosophy','20363', 300, 'Aldous', 'Huxley', 'Aldous@gmail.com', 40,'1896-04-07', DEFAULT);

DROP TABLE book;
-- витягнути всі книги
SELECT * FROM book;

-- витягнути книги з id 5, 10, 13
SELECT
    book.id AS ID
FROM
    book
WHERE
    id IN (5,10,13);

-- витягнути всі книги де кількість сторінок більше 150
SELECT * FROM book WHERE book.author_age > 30;

--  витягнути книги, в яких автори не мають нагород
SELECT book.name_of_the_book as Book_name FROM book WHERE book.author_awards IS NULL;

-- - витягнути книгу по email автора
SELECT book.name_of_the_book AS Book_Name FROM book WHERE book.author_email = 'Gatsby@gmail.com';

-- витягнути книгу по isbn
SELECT book.name_of_the_book AS Book_name FROM book WHERE book.isbn = '20363';

-- витягнути всіх книги які належать до певної категорії
SELECT book.name_of_the_book AS Book_name FROM book WHERE book.category = 'philosophy';

-- - витягнути книги в яких кількість сторінок більше 200 та вік автора більше 25
SELECT book.name_of_the_book AS Book_name FROM book WHERE book.amount_of_pages > 200 AND book.author_age > 25;

--  витягнути книги, в яких категорія "комедія" або "драма"(назви категорії можете змінити)
SELECT book.name_of_the_book AS Book_name FROM book WHERE book.category = 'adventure' OR book.category = 'Thriller';

-- - витягнути книги та посортувати за назвою
SELECT book.name_of_the_book AS Book_name FROM book ORDER BY book.name_of_the_book ASC;

-- - витягнути книги та посортувати за email автора
SELECT book.author_email AS Book_name FROM book ORDER BY book.author_email ASC;

--  витягнути книги та посортувати за кількістю сторінок(проти алфавіту)
SELECT book.name_of_the_book AS Book_name, book.amount_of_pages AS Book_pages FROM book ORDER BY book.amount_of_pages DESC;
 -- витягнути унікальні значення категорій
SELECT DISTINCT
    book.category AS Unique_category
FROM
    book;
--  витягнути унікальні імена авторів
SELECT DISTINCT book.author_name AS Author_name FROM book;

-- - витягнути книги які було написано після '1900-01-01'
SELECT book.name_of_the_book AS Book_name, book.date_of_publishing AS Publishing_date FROM book WHERE book.date_of_publishing > '1900-01-01';

-- - витягнути книги які було написано до '2010-01-01'
SELEct book.name_of_the_book AS Book_name, book.date_of_publishing AS Publishing_Date FROM book WHERE book.date_of_publishing < '1950-01-01';