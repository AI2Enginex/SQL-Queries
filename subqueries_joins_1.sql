CREATE TABLE employees(
    emp_id INT,
    emp_name VARCHAR(50),
    department_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO employees(emp_id, emp_name, department_id, salary) VALUES
(1, 'John', 1, 50000.00),
(2, 'Alice', 2, 55000.00),
(3, 'Bob', 1, 52000.00),
(4, 'Sarah', 3, 60000.00),
(5, 'Michael', 2, 58000.00),
(6, 'Emily', 1, 53000.00),
(7, 'David', 3, 62000.00),
(8, 'Emma', 2, 57000.00),
(9, 'Ryan', 1, 51000.00),
(10, 'Sophia', 3, 59000.00);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    department_head INT
);

INSERT INTO departments (department_id, department_name, department_head) VALUES
(1, 'Sales', 1),
(2, 'Marketing', 2),
(3, 'Finance', 4),
(4, 'Human Resources', 5),
(5, 'Research and Development', 6),
(6, 'Customer Service', 7),
(7, 'Information Technology', 8),
(8, 'Operations', 9),
(9, 'Legal', 10),
(10, 'Quality Assurance', 1);

/* Which employees have salaries higher than the average salary in their department?. */
select emp_name, department_id from employees
where salary > (select avg(salary) from employees);

select employees.emp_name, departments.department_name
from employees
INNER JOIN departments on departments.department_id = employees.department_id
where employees.salary > (select avg(employees.salary) from employees);


SELECT COUNT(*) AS total_employees
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING COUNT(*) > 10
);

---- inner join query
select employees.emp_name, departments.department_name
from employees
INNER JOIN departments on departments.department_id = employees.department_id

/* department with total number of employees. */
select count(employees.emp_id) as total_employees , departments.department_name
from employees
INNER join departments on departments.department_id = employees.department_id
group by departments.department_name 78yyfh;ol


/* department with total number of employees less than 4. */
select count(employees.emp_id) as total_employees , departments.department_name
from employees
INNER join departments on departments.department_id = employees.department_id
group by departments.department_name 
HAVING COUNT(employees.emp_id) < 4;

/* department with total sum of the salary of the employees. */
select sum(employees.salary) as avg_salary , departments.department_name
from employees
INNER join departments on departments.department_id = employees.department_id
group by departments.department_name 

---- departmet
select departments.department_name, avg(employees.salary)
from departments 
INNER JOIN employees on employees.department_id = departments.department_id
group by departments.department_name having avg(employees.salary) > 55000;
