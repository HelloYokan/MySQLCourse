CREATE DATABASE library;

CREATE TABLE book (
	book_name varchar(120) NOT NULL,
	book_about varchar(100) DEFAULT "Description is abcent",
    created_at date NOT NULL,
    author_name varchar(30) NOT NULL,
    category varchar(30) NOT NULL
);

INSERT INTO book(book_name, book_about, created_at, author_name, category)
VALUES

-- ("This is 1984","A book about distopia world",'1945-03-02' ,"George Orwel","anti-utopia"),
('Outsider','A book about pereption and degradation of one man','1942-09-11','Albert Camus','philosophy'),
('Myth of Sisyphus','A book about suicide', '1942-05-25','Albert Camus', 'philosophy');

SELECT * FROM book


