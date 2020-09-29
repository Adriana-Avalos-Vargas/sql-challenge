--Adriana Avalos Vargas

--1. List the following details of each employee: employee number, last name, first name sex and salary
SELECT
	T1.emp_no,
	T1.last_name,
	T1.first_name,
	T1.sex,
	T2.salary
FROM employees as T1
INNER JOIN salaries as T2 on T1.emp_no = T2.emp_no;

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
	first_name,
	last_name,
	hire_date
FROM 
	employees
WHERE 
	EXTRACT(YEAR FROM hire_date)  = 1986
	
--3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, 
--first name.

SELECT
	T3.dept_no,
	T3.dept_name,
	T1.emp_no,
	T1.last_name,
	T1.first_name
FROM employees as T1
INNER JOIN dept_manager as T2 on T1.emp_no = T2.emp_no
INNER JOIN departments as T3 on T2.dept_no = T3.dept_no;

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT
	T1.emp_no,
	T2.last_name,
	T2.first_name,
	T3.dept_name
FROM dept_emp as T1
INNER JOIN employees as T2 on T1.emp_no = T2.emp_no
INNER JOIN departments as T3 on T1.dept_no = T3.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT
	first_name,
	last_name,
	sex
FROM
	employees
WHERE
	first_name like 'Hercules' 
AND
	last_name like 'B%';
	
--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT
	T1.emp_no,
	T2.last_name,
	T2.first_name,
	T3.dept_name
FROM dept_emp as T1
INNER JOIN employees as T2 on T1.emp_no = T2.emp_no
INNER JOIN departments as T3 on T1.dept_no = T3.dept_no
WHERE
	T3.dept_name like 'Sales';


--7. List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT
	T1.emp_no,
	T2.last_name,
	T2.first_name,
	T3.dept_name
FROM dept_emp as T1
INNER JOIN employees as T2 on T1.emp_no = T2.emp_no
INNER JOIN departments as T3 on T1.dept_no = T3.dept_no
WHERE
	T3.dept_name like 'Sales'
OR
	T3.dept_name like 'Development';
	
--8.In descending order, list the frequency count of employee last names, i.e., 
-- how many employees share each last name.

SELECT last_name, count(*) FROM employees
group by last_name
ORDER BY COUNT(*) DESC;
