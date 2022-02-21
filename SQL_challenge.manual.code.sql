-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/6egmyr
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE departments (
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        dept_no
     )
);

CREATE TABLE titles (
    title_id VARCHAR   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE employees (
    emp_no int   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    birth_date date   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR   NOT NULL,
    hire_data date   NOT NULL,
    CONSTRAINT pk_employees PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE dept_emp (
    emp_no int   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    CONSTRAINT pk_dept_emp PRIMARY KEY (
        emp_no,dept_no
     )
);

CREATE TABLE dept_manager (
    dept_no VARCHAR   NOT NULL,
    emp_no int   NOT NULL,
    CONSTRAINT pk_dept_manager PRIMARY KEY (
        dept_no,emp_no
     )
);

CREATE TABLE salaries (
    emp_no int   NOT NULL,
    salary int   NOT NULL,
    CONSTRAINT pk_salaries PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE dept_employee (
    emp_no int   NOT NULL,
    dept_no VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_dept_employee PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE employees_dept_name (
    emp_no int   NOT NULL,
    last_name VARCHAR   NOT NULL,
    first_name VARCHAR   NOT NULL,
    dept_name VARCHAR   NOT NULL,
    CONSTRAINT pk_employees_dept_name PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE employees_title (
    emp_no int   NOT NULL,
    emp_title_id VARCHAR   NOT NULL,
    salary int   NOT NULL,
    CONSTRAINT pk_employees_title PRIMARY KEY (
        emp_no
     )
);

CREATE TABLE employees_gender (
    emp_no int   NOT NULL,
    sex VARCHAR   NOT NULL,
    salary int   NOT NULL,
    CONSTRAINT pk_employees_gender PRIMARY KEY (
        emp_no
     )
);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE employees_dept_name ADD CONSTRAINT fk_employees_dept_name_emp_no FOREIGN KEY(last_name, first_name)
REFERENCES employees (last_name, first_name);

ALTER TABLE employees_dept_name ADD CONSTRAINT fk_employees_dept_name_dept_no FOREIGN KEY(dept_no)
REFERENCES dept_emp (dept_no);

ALTER TABLE employees_dept_name ADD CONSTRAINT fk_employees_dept_name_dept_name FOREIGN KEY(dept_name)
REFERENCES departments (dept_name);

ALTER TABLE employees_title ADD CONSTRAINT fk_employees_title_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE employees_title ADD CONSTRAINT fk_employees_title_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE employees_title ADD CONSTRAINT fk_employees_title_salary FOREIGN KEY(salary)
REFERENCES salaries (salary);

ALTER TABLE employees_gender ADD CONSTRAINT fk_employees_gender_emp_no_sex FOREIGN KEY(emp_no, sex)
REFERENCES employees (emp_no, sex);

ALTER TABLE employees_gender ADD CONSTRAINT fk_employees_gender_salary FOREIGN KEY(salary)
REFERENCES salaries (salary);

