-- Creating a Database
CREATE database Learning;

-- Defining the database
use Learning;

-- Creating a table Frame name Employees
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10, 2)
);

-- Inserting the data in the table
INSERT INTO employees (first_name, last_name, department, hire_date, salary)
SELECT 
    CASE 
        WHEN RAND() < 0.1 THEN 'John'
        WHEN RAND() < 0.2 THEN 'Emily'
        WHEN RAND() < 0.3 THEN 'Michael'
        WHEN RAND() < 0.4 THEN 'Sarah'
        WHEN RAND() < 0.5 THEN 'David'
        WHEN RAND() < 0.6 THEN 'Jessica'
        WHEN RAND() < 0.7 THEN 'Daniel'
        WHEN RAND() < 0.8 THEN 'Ashley'
        WHEN RAND() < 0.9 THEN 'James'
        ELSE 'Sophia'
    END AS first_name,
    
    CASE 
        WHEN RAND() < 0.1 THEN 'Smith'
        WHEN RAND() < 0.2 THEN 'Johnson'
        WHEN RAND() < 0.3 THEN 'Williams'
        WHEN RAND() < 0.4 THEN 'Jones'
        WHEN RAND() < 0.5 THEN 'Brown'
        WHEN RAND() < 0.6 THEN 'Davis'
        WHEN RAND() < 0.7 THEN 'Miller'
        WHEN RAND() < 0.8 THEN 'Wilson'
        WHEN RAND() < 0.9 THEN 'Moore'
        ELSE 'Taylor'
    END AS last_name,

    CASE 
        WHEN RAND() < 0.2 THEN 'Engineering'
        WHEN RAND() < 0.4 THEN 'HR'
        WHEN RAND() < 0.6 THEN 'Sales'
        WHEN RAND() < 0.8 THEN 'Marketing'
        ELSE 'Finance'
    END AS department,

    DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 3650) DAY) AS hire_date, -- Random hire date within the last 10 years

    ROUND((RAND() * 40000 + 50000), 2) AS salary  -- Random salary between 50,000 and 90,000
FROM 
    (SELECT 1 FROM information_schema.tables LIMIT 1000) AS temp;


-- Checking the whole table
use Learning;
select * from employees;

-- Practive Questions

-- Question: List the full names of all employees who work in the Engineering department and have a salary above $75,000. 
-- Order the results by the hire date, with the most recent hires first.


Select 
    concat (first_name, ' ' , last_name) as full_name, 
    date(hire_date) as Hiring_Data 
from employees 
where salary >=75000 and department = 'Engineering';



-- 1. Retrieve Employee Information (Filtering & Basic SELECT)
-- You need to create a report that shows details of employees who were hired after 2018 and work in the Engineering or Marketing department.

-- Question: Write a query to select the employee_id, first_name, last_name, department, hire_date, and salary of all employees hired after January 1, 2018, 
-- who work in the Engineering or Marketing department. The results should be ordered by hire_date.

use Learning;
select concat (first_name, ' ' ,last_name) as full_name , department,hire_date 
from employees 
where hire_date > '2018-01-01' and department in ('Engineering','Marketing') 
ORDER BY hire_date asc;


-- 2. Salary Distribution by Department (Aggregates & Filtering)
-- Your manager is interested in understanding the salary distribution across departments. You need to show the minimum, maximum, and average salary per department, 
-- but only for departments where the average salary is above $60,000.

-- -- Question: Write a query to retrieve the department, minimum salary, maximum salary, and average salary for departments where the average salary exceeds $60,000.

use Learning;
SELECT department,
       SUM(salary) AS Total_Salary,
       MIN(salary) AS Minimum_Salary,
       MAX(salary) AS Maximum_Salary,
       ROUND(AVG(salary), 2) AS avg_salary
FROM employees
GROUP BY department
HAVING avg_salary > 60000;


-- 3. Newly Hired Employees (Filtering with WHERE)
-- Your task is to create a list of new hires who joined the company in the last 6 months and have a salary greater than $70,000. 
-- This list will help HR plan salary reviews for recent hires.

-- Question: Write a query to find all employees who were hired in the last 6 months and whose salary is greater than $70,000. 
-- Return their first_name, last_name, hire_date, and salary.

use Learning;
SELECT first_name, last_name, hire_date, salary
FROM employees
where hire_date > DATE_SUB(CURRENT_DATE(),INTERVAL 6 month)
and salary > 70000;


-- 6. Comparing Salary by Tenure (Aggregates & Filtering)
-- You need to analyze whether employees who have been with the company for more than 5 years are earning 
-- more on average than employees who have been with the company for less than 5 years.

-- Question: Write a query to compare the average salary of employees who have been with the company for more than 5 years versus those 
-- who have been with the company for 5 years or less. Return the tenure category ('More than 5 years' or '5 years or less') and the corresponding average salary.

use Learning;
select 
    CASE
    when hire_date <= DATE_SUB(CURRENT_DATE(),INTERVAL 5 year) then 'More Than 5 Year'
    else 'Less than 5 Year'
    END as Tenure_Category,
    ROUND(avg(salary),2) as avg_salary
from employees
GROUP BY Tenure_Category;

INSERT INTO employees (
    employee_id,
    first_name,
    last_name,
    department,
    hire_date,
    salary
  )
VALUES (
    employee_id:int,
    'first_name:varchar',
    'last_name:varchar',
    'department:varchar',
    'hire_date:date',
    'salary:decimal'
  );


-- 7. Top Earners in Each Department (Ranking & Aggregates)
-- The company wants to recognize the highest-paid employees in each department. You are required to identify the top earner from each department.

-- Question: Write a query to find the highest-paid employee in each department. Return the first_name, last_name, department, and salary of these top earners.


use Learning;
Select *
from employees
where salary IN  (
    select max(salary) from employees GROUP BY department
)

-- 8. Employees Hired Before a Certain Date (Filtering with WHERE)
-- Your task is to generate a list of employees who were hired before the year 2015 but are still active. HR needs this list for long-service awards.

-- Question: Write a query to retrieve the first_name, last_name, hire_date, and department of employees who were hired before January 1, 2015.

use Learning;
Select 
    first_name,
    last_name,
    hire_date,
    department
from employees
where hire_date < '2015-01-01';




