create database assignment_12;

-- Creating Database & Tables

CREATE TABLE `assignment_12`.`customers` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `customer_name` VARCHAR(50) NOT NULL,
  `phone_number` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`customer_id`));
  
CREATE TABLE `assignment_12`.`pizzas` (
  `pizza_name` VARCHAR(30) NOT NULL,
  `price` DECIMAL(4, 2) NOT NULL,
  PRIMARY KEY (`pizza_name`));
  
CREATE TABLE `assignment_12`.`orders`(
  `order_id` INT NOT NULL AUTO_INCREMENT,
  `date_time` DATETIME NOT NULL,
  PRIMARY KEY (`order_id`));
  
CREATE TABLE `assignment_12`. `customers_orders` (
	`customer_id` INT NOT NULL,
    `order_id` INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
    );
    
CREATE TABLE `assignment_12`. `pizzas_orders` (
    `pizza_name` VARCHAR(30) NOT NULL,
    `order_id` INT NOT NULL,
	FOREIGN KEY (pizza_name) REFERENCES pizzas (pizza_name),
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
    );
    
    -- Populating tables with provided data
    
INSERT INTO customers (customer_name, phone_number)
VALUES ('Trevor Page', '226-555-4982');

INSERT INTO customers (customer_name, phone_number)
VALUES ('John Doe', '555-555-9498');

INSERT INTO pizzas (pizza_name, price)
VALUES('Pepperoni & Cheese', 7.99);

INSERT INTO pizzas (pizza_name, price)
VALUES('Vegetarian', 9.99);

INSERT INTO pizzas (pizza_name, price)
VALUES('Meat Lovers', 14.99);

INSERT INTO pizzas (pizza_name, price)
VALUES('Hawaiian', 12.99);

INSERT INTO orders (date_time)
VALUES ('2014-09-10 9:47:00');

INSERT INTO orders (date_time)
VALUES ('2014-09-10 13:20:00');

INSERT INTO orders (date_time)
VALUES ('2014-09-10 9:47:00');

INSERT INTO customers_orders(customer_id, order_id)
VALUES (1, 1);

INSERT INTO customers_orders(customer_id, order_id)
VALUES (2, 2);

INSERT INTO customers_orders(customer_id, order_id)
VALUES (1, 3);

INSERT INTO pizzas_orders(pizza_name, order_id)
VALUES('Pepperoni & Cheese', 1);

INSERT INTO pizzas_orders(pizza_name, order_id)
VALUES('Meat Lovers', 1);

INSERT INTO pizzas_orders(pizza_name, order_id)
VALUES('Vegetarian', 2);

INSERT INTO pizzas_orders(pizza_name, order_id)
VALUES('Meat Lovers', 2);

INSERT INTO pizzas_orders(pizza_name, order_id)
VALUES('Meat Lovers', 2);

INSERT INTO pizzas_orders(pizza_name, order_id)
VALUES('Meat Lovers', 3);

INSERT INTO pizzas_orders(pizza_name, order_id)
VALUES('Hawaiian', 3);

-- Create query to show how much each unique customer spent

SELECT c.customer_name, SUM(price) AS total_spent
FROM customers c
JOIN customers_orders co ON c.customer_id = co.customer_id
JOIN orders o ON co.order_id = o.order_id
JOIN pizzas_orders po ON o.order_id = po.order_id
JOIN  pizzas p ON po.pizza_name = p.pizza_name
GROUP BY c.customer_name;

-- Create query to show who spent the most on a specific date

SELECT c.customer_name, DATE(o.date_time) AS order_date, SUM(price) AS total_spent
FROM customers c
JOIN customers_orders co ON c.customer_id = co.customer_id
JOIN orders o ON co.order_id = o.order_id
JOIN pizzas_orders po ON o.order_id = po.order_id
JOIN pizzas p ON po.pizza_name = p.pizza_name
GROUP BY c.customer_name, order_date;










    

  
  
