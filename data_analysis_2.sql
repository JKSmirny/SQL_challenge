--List first name, last name, and hire date
--for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees 
--WHERE hire_date <('01-01-1987') and hire_date > ('12-31-1985');
WHERE hire_date BETWEEN ('01-01-1986') AND ('12-31-1986');