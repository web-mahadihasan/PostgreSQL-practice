
CREATE TABLE publisher(
    publisher_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
)

INSERT INTO publisher (name, email) VALUES
('O’Reilly Media', 'info@oreilly.com'),
('Penguin Random House', 'contact@penguinrandomhouse.com'),
('HarperCollins', 'support@harpercollins.com'),
('Simon', 'hello@simonandschuster.com'),
('Macmillan Publishers', 'inquiries@macmillan.com');


SELECT * FROM publisher;

CREATE TABLE books(
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    publisher_id INT, FOREIGN KEY(publisher_id) REFERENCES publisher(publisher_id) ON DELETE CASCADE,
    publication_date DATE NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    in_stock BOOLEAN NOT NULL DEFAULT TRUE
);

-- Insert sample data into books table
INSERT INTO books (title, author, publisher_id, publication_date, price, in_stock) VALUES
('Learning SQL', 'Alan Beaulieu', 1, '2021-03-15', 34.99, TRUE),
('Python Crash Course', 'Eric Matthes', 2, '2019-05-03', 39.95, TRUE),
('The Pragmatic Programmer', 'Andrew Hunt', 3, '1999-10-30', 42.00, TRUE),
('Clean Code', 'Robert C. Martin', 4, '2008-08-11', 49.99, TRUE),
('Effective Java', 'Joshua Bloch', 5, '2018-01-06', 45.50, TRUE),
('You Don’t Know JS', 'Kyle Simpson', 1, '2020-07-10', 29.99, FALSE),
('Eloquent JavaScript', 'Marijn Haverbeke', 2, '2018-12-04', 35.00, TRUE),
('Design Patterns', 'Erich Gamma', 3, '1994-11-21', 54.95, TRUE),
('Introduction to Algorithms', 'Thomas H. Cormen', 4, '2009-07-31', 89.75, FALSE),
('Deep Learning', 'Ian Goodfellow', 5, '2016-11-18', 79.99, TRUE);

SELECT * FROM books;


ALTER TABLE books DROP CONSTRAINT books_publisher_id_fkey;


ALTER TABLE books ADD CONSTRAINT books_publisher_id_fkey FOREIGN key (publisher_id) REFERENCES publisher(publisher_id) ON DELETE CASCADE;


DELETE FROM publisher WHERE publisher_id = 4;

DROP TABLE publisher;

-- inner join
SELECT b.title, b.author, p.name, p.email FROM books b INNER JOIN publisher p on b.publisher_id = p.publisher_id;


-- left join 


-- Right join 