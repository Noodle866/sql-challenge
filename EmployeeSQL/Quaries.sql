-- Salary by employee
SELECT emp.emp_no,
       emp.last_name,
	   emp.first_name,
	   emp.sex,
	   sal.salary
FROM employees AS emp
	LEFT JOIN salaries AS sal
	ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

-- Employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees 
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- Manager of each department
SELECT dm.dept_no,
	   d.dept_name,
	   dm.emp_no,
	   e.last_name,
	   e.first_name
FROM dept_manager AS dm
	INNER JOIN departments AS d
		ON (dm.dept_no = d.dept_no)
	INNER JOIN employees AS e
		ON (dm.emp_no = e.emp_no);

-- Department of each employee
SELECT e.emp_no,
       e.last_name,
	   e.first_name,
	   d.dept_name
FROM employees as e 
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
ORDER BY e.emp_no;		

-- Employees whos first name is "hercules" and last name begins with "b"
SELECT first_name, last_name, birth_date, sex
FROM employees 
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Employees in the sales department
SELECT e.emp_no,
       e.last_name,
	   e.first_name,
	   d.dept_name
FROM employees as e 
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'		
ORDER BY e.emp_no;		

-- Employees in sales and development department
SELECT e.emp_no,
       e.last_name,
	   e.first_name,
	   d.dept_name
FROM employees as e 
	INNER JOIN dept_emp AS de
		ON (e.emp_no = de.emp_no)
	INNER JOIN departments AS d
		ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')		
ORDER BY e.emp_no;		

-- The frequency of employee last names
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY count(last_name) desc;