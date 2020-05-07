-- List the following details of each employee: employee number, last name, first name, gender, and salary.
select * from departments;

select employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
from employees
INNER JOIN salaries ON employees.emp_no=salaries.emp_no;


-- List employees who were hired in 1986.
select *
from employees
WHERE extract(year from hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select  departments.dept_no,departments.dept_name,dep_manager.emp_no,employees.last_name, employees.first_name,dep_manager.from_date,dep_manager.to_date
from dep_manager
inner join employees on employees.emp_no = dep_manager.emp_no
inner join departments on departments.dept_no = dep_manager.dept_no;


-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select dep_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dep_emp
inner join departments on dep_emp.dept_no = departments.dept_no
inner join employees on dep_emp.emp_no= employees.emp_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
select employees.first_name, employees.last_name
from employees
where first_name = 'Hercules' AND last_name like 'B__%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name,employees.first_name, departments.dept_name
from dep_emp
join departments on departments.dept_no =  dep_emp.dept_no
join employees on employees.emp_no =  dep_emp.emp_no
where departments.dept_name = 'Sales';


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no, employees.last_name,employees.first_name, departments.dept_name
from dep_emp
join departments on departments.dept_no =  dep_emp.dept_no
join employees on employees.emp_no =  dep_emp.emp_no
where departments.dept_name = 'Sales' OR departments.dept_name = 'Development' ;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT COUNT(last_name),last_name
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
