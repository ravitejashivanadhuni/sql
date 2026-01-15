-- to create database
create database practice;

-- to use database
use practice;

create table Departments(
	dept_id int primary key,
    dept_name varchar(50)
);

create table Employees(
	emp_id int primary key,
    emp_name varchar(50),
    salary int,
    dept_id int,
    hire_date date,
    foreign key (dept_id) references Departments(dept_id)
);
-- Insert sample data
insert into Departments values
(1, 'HR'),
(2, 'Finance'),
(3, 'Engineering'),
(4, 'Sales');

insert into Employees values
(101, 'Alice', 60000, 3, '2020-01-15'),
(102, 'Bob', 55000, 3, '2021-03-12'),
(103, 'Charlie', 40000, 1, '2019-11-01'),
(104, 'David', 70000, 2, '2018-07-23'),
(105, 'Eve', 50000, 4, '2021-05-30');

-- Employees earning more than 50,000

select emp_name, salary
from Employees
where salary > 50000;

-- employees hired after 2020

select emp_name, hire_date
from Employees
where hire_date > '2020-01-01';

-- top 2 highest paid employees

select emp_name, salary
from Employees
order by salary desc
limit 2;

-- average salary in each department

select dept_id, avg(salary) as avg_salary
from Employees
group by dept_id;

-- employees with thier department names

select e.emp_name, d.dept_name
from Employees e
join Departments d
	on e.dept_id = d.dept_id;

-- employees earning above average salary

select emp_name, salary
from employees
where salary > (select avg(salary) from Employees);

-- window functions 
-- Rank employees by salary

select emp_name, salary,
	rank() over (order by salary desc) as rank_salary
from Employees;

-- (update and delete) increase the salary of engineering emplyees by 10%

update Employees
set salary = salary * 1.10
where dept_id = 3;

-- delete employees earning less than 45,000

SET SQL_SAFE_UPDATES = 0;

delete from Employees
where salary < 45000;

-- list all employees names and salaries

select emp_name, salary
from Employees;

-- show the names and hire dates of employees hired after 2020

select emp_name, hire_date
from Employees
where hire_date > '2020-01-01';

-- get all employees who work in department 3(engineering)

select e.emp_name, d.dept_id
from Employees e
join Departments d
	on e.dept_id = d.dept_id
where e.dept_id = 3;

-- find the details of employees whose salary is in betwenn 50000 and 65000

select emp_name, salary
from Employees
where salary >= 50000 and salary <= 65000;

-- list employees in ascending order of salary

select emp_name, salary
from Employees
order by salary desc;

-- get the top 3 highest paid employees\

select emp_name, salary
from Employees
order by salary desc
limit 3;

-- count how many employees are there in each department

SELECT dept_id, COUNT(*) AS total_employees
FROM Employees
GROUP BY dept_id;

SELECT d.dept_name, COUNT(*) AS total_employees
FROM Employees e
JOIN Departments d
  ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- find average salary of all employees

select avg(salary) as avg_salary
from Employees;

-- show the employee name along with thier department name(use join)

select e.emp_name, d.dept_name
from Employees e
join Departments d
	on e.dept_id = d.dept_id;

-- get employees whose salary is greater then the average salary of all employees

select emp_name, salary
from Employees
where salary > (select avg(salary) from Employees);

-- find all employees who earn exactly 60000

select emp_name, salary
from Employees
where salary = 60000;

-- list all employees whose names starts with the letter A

select emp_name
from Employees
where emp_name like 'A%';

-- list all employees whose names starts with the letter n

select emp_name
from Employees
where emp_name like '%n';

use practice
select emp_name
from Employees
where department = "IT"

select * from Employees

-- 

-- 



