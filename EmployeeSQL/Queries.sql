--Data analysis
-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.

select employees.emp_no, 
	employees.last_name, 
	employees.first_name, 
	employees.gender, 
	salaries.salary
from employees
inner join salaries on
employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986.
select employees.emp_no,
	employees.first_name,
	employees.last_name,
	EXTRACT (YEAR FROM hire_date) AS YEAR
from employees
where hire_date > '12/31/1985' and hire_date < '01/01/1987';

-- 3. List the manager of each department with the following information: department number, department name,
--    the manager's employee number, last name, first name, and start and end employment dates.
select a.dept_no,
	c.dept_name,
	a.emp_no,
	b.first_name,
	b.last_name,
	a.from_date,
	a.to_date
from dept_manager as a
join employees as b on
a.emp_no = b.emp_no
join departments as c
on c.dept_no = a.dept_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name,
--    and department name.
select a.emp_no,
	a.last_name,
	a.first_name,
	c.dept_name
from employees as a
join dept_emp as b
on a.emp_no = c.emp_no
join departments as c
on c.dept_no = b.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
select employees.first_name,
	employees.last_name
from employees
where first_name = 'Hercules' and last_name like 'B%'; 

-- 6. List all employees in the Sales department, including their employee number, last name,
--    first name, and department name.
select a.emp_no
	, a.last_name
	, a.first_name
	, b.dept_name
from employees as a
join dept_emp as b
on a.emp_no = b.emp_no
join departments as c
on c.dept_no = b.dept_no
where t3.dept_name = 'Sales';

-- 7. List all employees in the Sales and Development departments, including their employee number,
--    last name, first name, and department name.
select a.emp_no
	, a.last_name
	, a.first_name
	, c.dept_name
from employees as a
join dept_emp as b
on a.emp_no = b.emp_no
join departments as c
on c.dept_no = b.dept_no
where c.dept_name = 'Sales' or c.dept_name = 'Development';

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees
--    share each last name.
select last_name, count (last_name) as name_cnt
from employees
group by last_name
order by name_cnt desc;

