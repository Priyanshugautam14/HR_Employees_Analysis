SQL Learning Project
Overview
This repository contains a SQL project designed to practice and demonstrate various SQL skills, 
including database creation, table management, data insertion, and querying. The project focuses on a fictional employee management database to cover a range of SQL functionalities and practices.

Project Structure
Database Creation:

CREATE database Learning;: Creates the database named Learning.
Table Definition:

CREATE TABLE employees (...);: Defines the employees table with columns for employee details.
Data Insertion:

Uses random data generation for testing and practice purposes.
Practice Questions:

Includes SQL queries to address specific business questions, such as filtering employees, aggregating salary data, and comparing employee tenure.
Tables
employees
employee_id: INT, Auto-incremented Primary Key
first_name: VARCHAR(50)
last_name: VARCHAR(50)
department: VARCHAR(50)
hire_date: DATE
salary: DECIMAL(10, 2)
Practice Questions and Queries
Engineering Department Salaries:

Query to list full names of employees in the Engineering department with salaries above $75,000.
Employee Report:

Query to show employee details hired after January 1, 2018, in Engineering or Marketing departments.
Salary Distribution:

Query to retrieve the department-wise minimum, maximum, and average salary for departments with an average salary above $60,000.
New Hires:

Query to find employees hired in the last 6 months with salaries greater than $70,000.
Salary Comparison by Tenure:

Query to compare average salaries for employees with more than 5 years and 5 years or less of tenure.
Top Earners:

Query to identify the highest-paid employee in each department.
Long-Service Awards:

Query to retrieve employees hired before January 1, 2015.
