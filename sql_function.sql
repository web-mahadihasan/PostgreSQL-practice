

SELECT * FROM employees

CREATE Function emp_count()
RETURNS INT
LANGUAGE SQL
AS
$$
    SELECT count(*) FROM employees
$$

SELECT emp_count();

CREATE OR REPLACE FUNCTION delete_employee(emp_id INT)
RETURNS VoID
LANGUAGE SQL
AS
$$
    DELETE FROM employees WHERE employee_id = emp_id;
$$

SELECT * FROM employees

SELECT delete_employee();


CREATE or REPLACE FUNCTION update_dep_id(dept_id INT)
RETURNS void
LANGUAGE SQL
AS
$$
    UPDATE employees
    SET department_id = dept_id
    WHERE department_id is NULL
$$

SELECT update_dep_id(1)