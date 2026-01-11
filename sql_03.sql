CREATE DATABASE sql_practice;
USE sql_practice;

CREATE TABLE employees(
	emp_id INT PRIMARY KEY,
    name varchar(50),
    department varchar(50),
    salary int,
    hire_date date
	);
    
INSERT INTO employees VALUES
(1, 'Ravi', 'IT', 60000, '2022-01-10'),
(2, 'Anil', 'HR', 45000, '2021-03-15'),
(3, 'Sita', 'IT', 75000, '2020-07-20'),
(4, 'Kiran', 'Finance', 50000, '2023-02-01'),
(5, 'Meena', 'HR', 48000, '2022-11-12');
Insert into employees values
(6,"geetha", "HR", 25000,'2021-03-15'),
(7,"sheela", "HR", 25000,'2021-03-15'),
(8,"maala", "HR", 25000,'2021-03-15'),
(9,"suamaya", "HR", 25000,'2021-03-15'),
(10,"sameenah", "HR", 25000,'2021-03-15');

select * from employees;

select name, salary from employees;

select *
from employees
where department = "IT";

SELECT name, salary
FROM employees
WHERE salary > 50000;

SELECT name, salary
FROM employees
ORDER BY salary DESC;

select name, department
from employees
where department = "HR";

select name, department
from employees
where department = "IT";

select name,salary
from Employees
where salary between 45000 and 60000;

 -- show employees whose name starts with 'R'
 select *
 from employees
 where name like 'R%';
 
 select * from employees;
 
 -- list employees who are not from HR
 select name, department
 from employees
 where department != 'HR';
 
 -- display employees names and salaries, sorted by salary ascending
 select name , salary
 from employees
 order by salary asc;
 
 -- fetch employees whose hire date is before 2022
 select name, hire_date
 from employees
 where hire_date < '2022-01-01';
 
 -- show only unique departments from the table
SELECT department
FROM employees
GROUP BY department;

-- find employees whose salary is exactly 50,000 and 75,000
select name, salary
from employees
where salary = 50000 or salary = 75000;
 
 -- count the total number of employees
 select count(name) as employees_count
 from employees;
 
 -- find average salary if all employees
 select avg(salary) as average_salary
 from employees;
 
 -- get the maximum salary in the company
 select max(salary) as maximum_salary
 from employees;
 
 -- count how many employees are in each department
select department , count(department) as emp_count
from employees
group by department;

-- find total salary paid to the IT department
select department , sum(salary) as total_salary_paid
from employees
where department = "IT"
group by department;

-- show departments having more than 1 employee
select department
from employees
group by department
having count(*) > 1;

-- display the minimum salary per department
select department, min(salary) as min_salary
from employees
group by department;

-- find department where the average salary is greater than 50000
select department
from employees
group by department
having avg(salary) > 50000;

------------------------------------------------------------------------------------------------
-- absolute foundations(clause behaviou)
-- select only employee names
select name
from employees;

-- rename columns using alias
select name as emp_name, salary as monthly_salary
from employees;

-- remove duplicate departments
select distinct department
from employees;

-- fetch employees with salary >= 50000
select *
from employees
where salary >= 50000;

-- Fetch employees hired in 2022
SELECT *
FROM employees
WHERE hire_date BETWEEN '2022-01-01' AND '2022-12-31';

-- employees whose department is IT or HR
select * 
from employees
where department in ('IT' , 'HR');

-- employees not in finance
select *
from employees
where department <> "Finance";

-- employees whose name contains "a"
select * 
from employees
where name like "%a%";

-- employees hired after 2021 and salary > 50K
select *
from employees
where hire_date > '2021-12-31'
	and salary > 50000;
    
-- highest paid employee
select *
from employees
order by salary desc
limit 1;

-- top three highest salaries
select *
from employees
order by salary DESC
limit 3;

-- sort by department , then salary descending
SELECT *
FROM employees
ORDER BY department, salary DESC;

-- Total salary per department
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- average salary per department
select department, avg(salary) as avg_salary
from employees
group by department;

-- departments with exactly one employee
select department
from employees
group by department
having count(*) = 1;

-- department with highest average salary
select department
from employees
group by department
order by avg(salary) desc
limit 1;

-- employees earning more than average salary
select max(salary)
from employees
where salary <(
	select max(salary)
    from employees
);

-- employees earning same salary as someone else
select * 
from employees
where salary in(
	select salary
    from employees
    group by salary
    having count(*) > 1
);

-- highest paid employee per department
select *
from employees e
where salary = (
	select max(salary)
    from employees
    where department = e.department
);


 select * from employees;
 
 
 
 





