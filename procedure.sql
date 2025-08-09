

CREATE Procedure remove_emp (emp_id INT)
LANGUAGE plpgsql
AS
$$
    DECLARE
    test_var INT;
    BEGIN
        SELECT employee_id INTO test_var FROM employees WHERE employee_id = emp_id;
        DELETE FROM employees WHERE employee_id = test_var;

        RAISE NOTICE 'Employee remove successfully';
    END
$$

call remove_emp(11)

SELECT * FROM employees

