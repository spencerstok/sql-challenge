DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_manager;

CREATE TABLE employees( -- Caps/Indentation are not needed to run however its best practice
	emp_no VARCHAR(15) PRIMARY KEY, 
	emp_title_id VARCHAR(10) NOT NULL, -- INT is also one for numbers
	birth_date DATE NOT NULL, -- BOOLEAN can be used for TRUE/FALSE columns
	first_name VARCHAR(40) NOT NULL, -- (5) the smaller the numbers the more efficient it is
	last_name VARCHAR(40) NOT NULL, -- VARCHAR is more efficient than TEXT
	sex VARCHAR (1) NOT NULL,
	hire_date DATE NOT NULL
);

CREATE TABLE salaries( 
	emp_no VARCHAR(15) PRIMARY KEY, 
	salary VARCHAR(10) NOT NULL 
);

CREATE TABLE titles( 
	title_id VARCHAR(15) NOT NULL, 
	title VARCHAR(20) NOT NULL 
);

CREATE TABLE dept_emp( 
	emp_no VARCHAR(15), 
	dept_no VARCHAR(10) NOT NULL 
);

CREATE TABLE departments( 
	dept_no VARCHAR(15) PRIMARY KEY, 
	dept_name VARCHAR(30) NOT NULL 
);

CREATE TABLE dept_manager( 
	dept_no VARCHAR(15) NOT NULL, 
	emp_no VARCHAR(10) NOT NULL 
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

-- Query * FROM Each Table Confirming Data
SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;