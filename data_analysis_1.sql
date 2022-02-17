--List the following details of each employee: 
--employee number, last name, first name, sex, and salary.

select last_name, first_name, sex, salary
from employees
inner join salaries
on employees.emp_no = salaries.emp_no;