


CREATE TABLE trigger_user 
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

SELECT * FROM trigger_user

INSERT INTO trigger_user(name, email) VALUES ('Mehedi', 'mehedi@gmail.com'), ('hasan', 'hasan@gmail.com'), ('milu', 'milu@gmail.com');


CREATE TABLE delete_user 
(
    name VARCHAR(50),
    email VARCHAR(50),
    deleteAt TIMESTAMP
)



CREATE FUNCTION delete_user_save()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS
$$
    BEGIN
        INSERT INTO delete_user VALUES(OLD.name, OLD.email, now());
        RAISE NOTICE 'delete user saved';
        RETURN OLD;
    END
$$


CREATE TRIGGER delete_user_trigger
BEFORE DELETE
ON trigger_user
FOR EACH ROW
EXECUTE FUNCTION delete_user_save();


DELETE FROM trigger_user WHERE id = 1

SELECT * FROM delete_user