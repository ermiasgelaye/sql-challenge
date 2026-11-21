-- =============================================================
-- Employee Database: Data Analysis Queries (PostgreSQL)
-- Run after Employees_db_schema.sql and loading data/*.csv
-- =============================================================

-- 1. Employee number, last name, first name, sex and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
JOIN salaries AS s ON e.emp_no = s.emp_no;

-- 2. First name, last name and hire date of employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
  AND hire_date <  '1987-01-01';

-- 3. Manager of each department: department number and name,
--    manager's employee number, last name and first name
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments AS d
JOIN dept_manager AS dm ON d.dept_no = dm.dept_no
JOIN employees AS e     ON dm.emp_no = e.emp_no;

-- 4. Department of each employee: employee number, last name, first name, department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employees AS e   ON de.emp_no = e.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no;

-- 5. Employees whose first name is "Hercules" and whose last name begins with "B"
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
  AND last_name LIKE 'B%';

-- 6. All employees in the Sales department
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employees AS e   ON de.emp_no = e.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

-- 7. All employees in the Sales and Development departments
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
JOIN employees AS e   ON de.emp_no = e.emp_no
JOIN departments AS d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

-- 8. Frequency count of employee last names, most common first
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;

-- Epilogue: look up employee ID 499942
SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM employees AS e
JOIN titles AS t ON e.emp_title_id = t.title_id
WHERE e.emp_no = 499942;
