-- Задание 1. Используя операторы языка SQL, создайте табличку “sales”. Заполните ее данными
CREATE DATABASE homework2;

USE homework2;

CREATE TABLE sales (
   id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
   order_date DATE NOT NULL,
   count_product INT NOT NULL);

DESC sales;

INSERT INTO sales (
   order_date, count_product)
VALUES 
   ("2022-01-01", 156),
   ("2022-01-02", 180),
   ("2022-01-03", 21),
   ("2022-01-04", 124),
   ("2022-01-05", 341);
   
SELECT * FROM sales;


-- Задание 2. Сгруппируйте значений количества в 3 сегмента — меньше 100, 100-300 и больше 300.

SELECT id,
CASE 
   WHEN count_product < 100 THEN "Маленький заказ"
   WHEN count_product >= 100 AND count_product < 300 THEN "Средний заказ"
   WHEN count_product > 300 THEN "Большой заказ"
END AS "Тип заказа"
FROM sales;


-- Задание 3. Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” статус заказа, используя оператор CASE

CREATE TABLE orders (
   id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
   employee_id VARCHAR(6) NOT NULL,
   amount DOUBLE NOT NULL,
   order_status VARCHAR(15));
   
INSERT INTO orders (
   employee_id, amount, order_status)
VALUES 
   ("e03", 15.00, "OPEN"),
   ("e01", 25.50, "OPEN"),
   ("e05", 100.70, "CLOSED"),
   ("e02", 22.18, "OPEN"),
   ("e04", 9.50, "CANCELLED");
   
SELECT * FROM orders;

SELECT id, employee_id, amount, order_status,
CASE 
   WHEN order_status = "OPEN" THEN "Order is in open status"
   WHEN order_status = "CLOSED" THEN "Order is closed"
   WHEN order_status = "CANCELLED" THEN "Order is cancelled"
END AS "full_order_status"
FROM orders;


-- Задание 4. Чем NULL отличается от 0?

/* "0" - это цифровое значение, котрое может принимать числовое поле.
NULL может быть в любом типе данных, означает, что значение не определено. */