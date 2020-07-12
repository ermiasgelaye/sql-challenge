drop table if exists departments cascade;
drop table if exists dept_emp cascade;
drop table if exists dept_manager cascade;
drop table if exists employees cascade;
drop table if exists salaries cascade;
drop table if exists titles cascade;

create table departments (
	dept_no varchar(10) PRIMARY KEY not null,
	dept_name varchar(100) not null
);

create table employees (
	emp_no int primary key not null,
	birth_date date not null,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	gender varchar(1) not null,
	hire_date date not null
);

create table dept_emp (
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	dept_no varchar(10) not null,
	foreign key (dept_no) references departments (dept_no),
	from_date date not null,
	to_date date not null
);

create table dept_manager (
	dept_no varchar(10) not null,
	foreign key (dept_no) references departments (dept_no),
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	from_date date not null,
	to_date date not null
);

create table salaries (
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	salary int not null,
	from_date date not null,
	to_date date not null
);

create table titles (
	emp_no int not null,
	foreign key (emp_no) references employees(emp_no),
	title varchar(30) not null,
	from_date date not null,
	to_date date not null
);

/*
IMPORTANT NOTE:
If the csv files are not located in C:\data\ or you are using a mac,
change the csv path to the location of the csv files on your system 
before running the following to import the data from the csvs.
*/

copy departments from 'C:\data\departments.csv'
with (format CSV, HEADER);

select * from departments;

copy employees from 'C:\data\employees.csv'
with (format CSV, HEADER);

select * from employees;

copy dept_emp from 'C:\data\dept_emp.csv'
with (format CSV, HEADER);

select * from dept_emp;

copy dept_manager from 'C:\data\dept_manager.csv'
with (format CSV, HEADER);

select * from dept_manager;

copy salaries from 'C:\data\salaries.csv'
with (format CSV, HEADER);

select * from salaries;

copy titles from 'C:\data\titles.csv'
with (format CSV, HEADER);

select * from titles;