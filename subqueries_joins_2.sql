-- Create sales table
CREATE TABLE sales_data (
    sale_id INT,
    customer_id INT,
    amount DECIMAL(10, 2)
);

-- Insert values into sales table
INSERT INTO sales_data (sale_id, customer_id, amount) VALUES
(1, 101, 200.00),
(2, 102, 150.00),
(3, 103, 300.00),
(4, 104, 180.00),
(5, 105, 220.00),
(6, 106, 250.00),
(7, 107, 180.00),
(8, 108, 190.00),
(9, 109, 270.00),
(10, 110, 210.00);

CREATE TABLE customers (
    customer_id INT,
    name VARCHAR(50),
    country VARCHAR(50)
);

INSERT INTO customers (customer_id, name, country) VALUES
(101, 'Alice', 'USA'),
(102, 'Bob', 'Canada'),
(103, 'Charlie', 'UK'),
(104, 'David', 'Australia'),
(105, 'Emily', 'USA'),
(106, 'Frank', 'Canada'),
(107, 'Grace', 'UK'),
(108, 'Henry', 'Australia'),
(109, 'Isabel', 'USA'),
(110, 'Jack', 'Canada');

select * from sales_data;

-- subquery 1
SELECT sales_data.customer_id, customers.name
FROM sales_data
INNER JOIN customers ON customers.customer_id = sales_data.customer_id
WHERE sales_data.amount >= 200;


-- subquery 2
select name
from customers
where customer_id in (select customer_id from sales_data where amount = 0);

-- customer that did not buy any product
select customers.name
from customers
INNER JOIN sales ON sales.customer_id = customers.customer_id
where sales.amount = 0;

/* query to get customer id who have purchased more than avg amount. */
select customer_id from sales_data
group by customer_id
having avg(amount) > (select avg(amount) from sales_data);

--- purchase greater than average amount
select customer_id from sales_data
group by customer_id
having avg(amount) > (select avg(amount) from sales_data) ;

--- join query on customer id
select customers.name , customers.country
from customers
inner join sales_data on sales_data.customer_id = customers.customer_id;

/* the total sales amounts for each country. */
select 
     customers.country , 
	 sum(sales_data.amount) as total_sales_amount,
     RANK() OVER(ORDER BY SUM(sales_data.amount) DESC) AS country_rank
from
    customers
inner join sales_data on sales_data.customer_id = customers.customer_id
group by customers.country ORDER BY total_sales_amount DESC;

select * from customers
Inner join sales_data on sales_data.customer_id = customers.customer_id
where sales_data.amount > 200;