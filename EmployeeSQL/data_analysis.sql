-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no
ORDER BY s.emp_no;
-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986';
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept.dept_no, dept.dept_name, dept_man.emp_no, e.last_name, e.first_name
FROM departments AS dept
JOIN dept_manager AS dept_man ON dept.dept_no = dept_man.dept_no
JOIN employees AS e ON dept_man.emp_no = e.emp_no;
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, e.last_name, e.first_name, dept.dept_name
FROM dept_emp
JOIN employees AS e ON dept_emp.emp_no = e.emp_no
JOIN departments AS dept ON dept.dept_no = dept_emp.dept_no;
-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT e.first_name, e.last_name, e.sex
FROM employees AS e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, e.last_name, e.first_name, dept.dept_name
FROM dept_emp
JOIN employees AS e ON dept_emp.emp_no = e.emp_no
JOIN departments AS dept ON dept_emp.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales';
-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, e.last_name, e.first_name, dept.dept_name
FROM dept_emp
JOIN employees AS e ON dept_emp.emp_no = e.emp_no
JOIN departments AS dept ON dept_emp.dept_no = dept.dept_no
WHERE dept.dept_name = 'Sales' OR dept.dept_name = 'Development';
-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT e.last_name, COUNT(e.last_name) AS frequency_count
FROM employees AS e
GROUP BY e.last_name
ORDER BY frequency_count DESC;