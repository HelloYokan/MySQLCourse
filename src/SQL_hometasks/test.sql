CREATE DATABASE  IF NOT EXISTS school;
USE school;
CREATE TABLE IF NOT EXISTS subject (
	subject_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL UNIQUE,
    koef FLOAT NOT NULL
);
CREATE TABLE IF NOT EXISTS room(
	room_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    room_name VARCHAR(100) NOT NULL,
    seats INT NOT NULL,
    subject_id INT NOT NULL UNIQUE,
    FOREIGN KEY(subject_id) REFERENCES subject(subject_id)
);
CREATE TABLE IF NOT EXISTS teacher (
	teacher_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    teacher_name VARCHAR(100) NOT NULL,
    teacher_date_of_birth DATE NOT NULL,
	subject_id INT NOT NULL,
    FOREIGN KEY (subject_id) REFERENCES subject(subject_id)
);
CREATE TABLE IF NOT EXISTS student (
	student_id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	student_name VARCHAR(100) NOT NULL,
    student_date_of_birth DATE NOT NULL
);
CREATE TABLE IF NOT EXISTS teacher_student(
	teacher_id INT NOT NULL,
    student_id INT NOT NULL,
    CONSTRAINT id PRIMARY KEY (teacher_id,student_id),
    FOREIGN KEY (teacher_id) REFERENCES teacher (teacher_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);
INSERT INTO subject(subject_name, koef)
VALUES
	('Математика', 0.4),
    ('Фізика',0.3),
    ('Хімія',0.1),
    ('Фізкультура', 0.2);
INSERT INTO room(room_name, seats, subject_id)
VALUES
	('Математичний клас',30, 1),
    ('Фізичний клас',35,2),
    ('Хімічний клас',29,3),
    ('Спортзал',50,4);

INSERT INTO student(student_name, student_date_of_birth)
VALUES
	('Ігор','2010-11-23'),
    ('Аня','2010-06-03'),
    ('Саша','2011-08-25'),
    ('Василь','2015-04-16'),
    ('Женя','2015-02-01');

INSERT INTO teacher(teacher_name, teacher_date_of_birth, subject_id)
VALUES
	('Олександр Олександрович','1974-09-11', 1),
    ('Василь Васильович','1980-04-24', 1),
    ('Микола Іванович', '1970-07-19',2),
    ('Ольга Іванівна','1996-04-14',3),
    ('Юрій Євгенійович', '1970-03-02',4),
    ('Марія Петрівна', '1986-09-11',4);

INSERT INTO teacher_student(teacher_id, student_id)
VALUES
		(1, 2),
       (2, 1),
       (2, 3),
       (3, 4),
       (3, 1),
       (4, 2),
       (4, 4),
       (2, 5),
       (1, 3);

-- DROP DATABASE school;
-- DROP TABLE student, teacher, room, subject;
-- SELECT * FROM subject;
-- SELECT * FROM student;
-- SELECT * FROM teacher;
-- 1)Вивести всіх вчителів, які народилися пізніше ніж 1980 рік.
SELECT teacher_name FROM teacher WHERE teacher_date_of_birth > '1980-01-01';
-- 2)Вивести всіх учнів, в яких ім’я НЕ починається на B
SELECT student_name FROM student WHERE NOT student_name LIKE '%М';
-- 3)Відсортувати предмети за koef
SELECT subject_name FROM subject GROUP BY koef;
-- 4)Вивести всю інформацію про найстаршого вчителя
SELECT * FROM teacher WHERE teacher_date_of_birth IN ( SELECT MIN(teacher_date_of_birth) FROM teacher);
-- 5)вивести скільки аудиторій є у школі.
SELECT COUNT(room_id) FROM room;
-- 6)Вивести загальну кількість місць у всіх аудиторіях в школі
SELECT SUM(seats) FROM room;
-- 7)Вивести всіх учнів, які народилися у році від 2000 до 2005
SELECT * FROM student WHERE student_date_of_birth BETWEEN '2010-01-01' AND '2015-01-01';
-- 8)Перейменувати поле name у таблиці Вчитель на teacher_name
ALTER TABLE teacher RENAME COLUMN teacher_name TO teacher;
-- 9)Вивести всіх вчителів, які викладають фізику
SELECT teacher FROM teacher INNER JOIN subject ON teacher.subject_id = subject.subject_id
WHERE subject_name = 'фізкультура';
-- 10)Вивести всіх учнів, яких вчить вчитель “Ольга Миколаївна”
SELECT * FROM student INNER JOIN teacher_student on student.student_id = teacher_student.student_id
INNER JOIN teacher ON teacher_student.teacher_id = teacher.teacher_id
WHERE teacher = 'Ольга Іванівна';
-- 11)Вивести всіх вчителів, які вчать “Петра”
SELECT * FROM teacher INNER JOIN teacher_student on teacher.teacher_id = teacher_student.teacher_id
INNER JOIN student ON teacher_student.student_id = student.student_id
WHERE student_name = 'Саша';
-- 12)Вивести аудиторію, у якій викладають біологію
SELECT room_name FROM room WHERE room_name='математичний клас';
-- 13)Вивести аудиторію в якій викладає вчитель “Дмитро Богданович”.
SELECT room_name FROM room INNER JOIN subject ON room.subject_id = subject.subject_id
INNER JOIN teacher ON subject.subject_id = teacher.subject_id
WHERE teacher = 'Микола Іванович';
-- 14)Вивести вчителі, який викладає у аудиторії для хімії
SELECT
    teacher
FROM
    teacher
        INNER JOIN
    subject ON teacher.subject_id = subject.subject_id
        INNER JOIN
    room ON subject.subject_id = room.subject_id
WHERE
    room_name = 'Хімічний клас';



