SELECT * FROM person

ALTER TABLE person
    ADD COLUMN gender VARCHAR(10),
    ADD CONSTRAINT chek_gender CHECK (gender IN ('male', 'female'));

INSERT INTO person VALUES(7, 'kisui na', 59, 'female')

ALTER TABLE person
    DROP COLUMN gender

ALTER Table person
    RENAME COLUMN age to user_age


ALTER Table person
    alter COLUMN user_age set NOT NULL

ALTER Table person
    alter COLUMN user_age DROP NOT NULL