-- --1. Employee Details (employee number, last name, first name, gender, and salary)
select sal.emp_no, emp.last_name, emp.first_name, emp.sex, sal.salary
from employees as emp
inner join salaries as sal
on sal.emp_no = emp.emp_no


-- -- 2.Employees who were hired in 1986
select first_name,last_name, hire_date 
from employees 
where extract(year from hire_date) = 1986;

-- -- 3. Department manager(department number, department name, employee number, and last name, first name)
select distinct on (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager 
inner join departments 
on dept_manager.dept_no= departments.dept_no
inner join employees 
on dept_manager.emp_no = employees.emp_no
order by dept_manager.dept_no, employees.hire_date DESC;

-- -- 4. Department of each employee: ()
--employee number, last name, first name, and department name.
select emp.emp_no, emp.last_name, emp.first_name,dep.dept_name
from employees as emp
left join dept_emp as dep_e
on emp.emp_no = dep_e.emp_no
inner join departments as dep
on dep_e.dept_no = dep.dept_no
order by emp.emp_no, emp.hire_date DESC;


-- -- 5. List all employees whose first name = "Hercules" and last names begin with "B.
select emp.last_name, emp.first_name, emp.sex
from employees as emp
where (emp.first_name = 'Hercules') and (lower(emp.last_name) like 'b%')
order by emp.last_name;

-- -- 6.List all employees in the Sales department: (employee number, last+firstname, and dept name_ 
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
;
-- -- 7. List all employees in the Sales and Development departments
-- -- (employee number, last name, first name, dept name)
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development'


-- -- 8. list the frequency count of employee last names in Descending order
select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by frequency desc;

