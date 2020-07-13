-- Data Engineering
DROP TABLE IF EXISTS departments CASCADE;
DROP TABLE IF EXISTS employees CASCADE;
DROP TABLE IF EXISTS dept_emp CASCADE;
DROP TABLE IF EXISTS dept_manager CASCADE;
DROP TABLE IF EXISTS salaries CASCADE;
DROP TABLE IF EXISTS titles CASCADE;

-- Create tables 
CREATE TABLE "departments" (
    -- Department number is a primary key and it is- 
    -- found aslo in department employees and department manager list
	"dept_no" VARCHAR   NOT NULL,
    -- Department name
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "titles" (
	-- Title id is a primary key
    -- Title id also found in employees as emp_title_id
    "title_id" VARCHAR   NOT NULL,
    -- List of titles
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "employees" (
	-- Employees number is a primary key
	-- Employees number found in department employees,department manager-
	-- & in their salaries
    "emp_no" INT   NOT NULL,
    -- Employees have a title id
    -- So, this employees(emp_title_id) has relationship with-
    -- the composite foreign key titles(title_id)
    "emp_title_id" VARCHAR   NOT NULL,
    -- Employees birth date
    "birth_date" DATE   NOT NULL,
    -- Employees first name
    "first_name" VARCHAR   NOT NULL,
    -- Employees last name
    "last_name" VARCHAR   NOT NULL,
    -- Employees sex
    "sex" VARCHAR   NOT NULL,
    -- Employees hired date
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "dept_emp" (
    -- Employees number in department employees-
    -- which shared a unique keys with employees(emp_no)
    "emp_no" INT   NOT NULL,
    -- Department number in department employees-
    -- which shared a unique keys with dept_emp(dept_no)
    "dept_no" VARCHAR   NOT NULL
);

CREATE TABLE "dept_manager" (
	-- Department number in department manger list-
    -- which shared a unique keys with dept_emp(dept_no)
    "dept_no" VARCHAR   NOT NULL,
    -- Employees number in department manger list
    -- which shared a unique keys with employees(emp_no)
    "emp_no" INT   NOT NULL
);

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    -- Employees salaries
    "salary" INT   NOT NULL
);

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

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


-- Query * FROM Each Table Confirming Data
SELECT * FROM departments;
SELECT * FROM titles;
SELECT * FROM employees;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM salaries;


	
	
	
	
	
	
	
	
	
	
