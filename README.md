# Employee Database-SQL: A Mystery in Two Parts

![Sql](EmployeeSQL/Images/postsql.gif)

## Background

This repository discusses a research project on the employee database at  Pewlett Hackard Corporation from the 1980s and 1990s. All that remains of the database of employees from that period is in six CSV files.

On this project,  a table was created that holds employees data in the CSVs, import the CSVs into a SQL database, and the data exploration was conducted to answering the research questions, and discussed in the following parts:

## 1. Data Modeling

To model the employee data a  basic data modeling technique called  Entity-Relationship Diagrams (ERD) was used. By using this technique six employee database entities or tables are identified, these entities are `employees`, `departments`, `salaries`, `titles`, `department managers`, and `department employees`. The attribute or the data type of the entities also presented. At last, the ER diagram was drawn to visualize the relationships between entities/objects (primary key or foreign keys in a database). To read the detailed description of the employee database click the following link and download the PDF file. [Employees_db_modeling.pdf](EmployeeSQL/ERD/Employees_db_modeling.pdf)

The ER diagram also looks as follows: 

![ERD](EmployeeSQL/ERD/Employees_db_ERD.png)

## 2. Data Engineering

By using the available information a table schema for each of the six CSV files was created, and the data types, primary keys, foreign keys, and constraints also developed. The order of the table is based on the primary, and foreign arrangements. 

**Note** to import each  CSV file into the corresponding SQL table the order strictly should be followed to avoid errors. 

Click the following link to see the actual schema file [Employees_db_schema.sql](EmployeeSQL/Employees_db_schema.sql) 

## 3. Data Analysis

After completing the importing process a Postgresql analysiss was perfomed and you can find the full query in this file [Employees_db_Query.sql](EmployeeSQL/Employees_db_Query.sql)   

The analysis query performed, and cascaded in the following formats: 

1. The query to list the following details of each employee: employee number, last name, first name, sex, and salary

```SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

   ```
   
2. The query to list first name, last name, and hire date for employees who were hired in 1986.

```
SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1987-01-01';

 ```
 
3. The query list the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
```employee number, last name, first name.
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments
JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;
 ```

4. The query to list the department of each employee with the following information: employee number, last name, first name, and department name.
 ```SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;
 
 ```
5. The query to list first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

```SELECT first_name, last_name,sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

 ```

6. The query to list all employees in the Sales department, including their employee number, last name, first name, and department name.

```SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

 ```
7. The query to list all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

```SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development'
 ```

8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

```SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;

 ```

## 4. Data Testing and Validation (Python)

In order to test, and validate the dataset in this part a python code created on jupyter notebook. The code generate a visualization of the data, wich proves the reliablity of the database. In order to import the SQL database in to Pandas without importing the CSV, but just by sourcing from SQL database use the following code.Input your postgresql username and password in the config.py file, and malke sure your pgAdmin host, port, and database adjusted correctly.To look the python code vsit the following jupyter viewer page.  
   ```
   # Dependencies
   from sqlalchemy import create_engine
   from config import username, password
   import pandas as pd
   import matplotlib.pyplot as plt
   import numpy as n
   import seaborn as sns
   
   engine = create_engine(f'postgresql://{username}:{password}@localhost:5432/Employees_db')
   connection = engine.connect()
   ```
* Consult [SQLAlchemy documentation](https://docs.sqlalchemy.org/en/latest/core/engines.html#postgresql) for more information.

## A histogram to visualize the most common salary ranges for employees.
![Histogram](EmployeeSQL/Images/employee_salary_distribution.png)


## A bar chart of average salary by title
![Bar chart](EmployeeSQL/Images/average_salary_by_title.png)

## Epilogue(Searching somone ID by using ID number)

In this part I provide an evidence for any one who asked to "Search an Id" from the database, for example let seacrh employee ID number 499942 and It looks as follows the search result in pandas. :smile: 

<table border="1" class="dataframe">
  <thead>
    <tr style="text-align: right;">
      <th></th>
      <th>emp_no</th>
      <th>emp_title_id</th>
      <th>birth_date</th>
      <th>first_name</th>
      <th>last_name</th>
      <th>sex</th>
      <th>hire_date</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>0</th>
      <td>499942</td>
      <td>e0004</td>
      <td>1963-01-10</td>
      <td>April</td>
      <td>Foolsday</td>
      <td>F</td>
      <td>1997-02-10</td>
    </tr>
  </tbody>
</table>

### Copyright

Trilogy Education Services © 2019. All Rights Reserved.
