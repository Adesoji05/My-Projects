-- creating a database 
  
  create database Bodija_Restaurant;
  
  -- select or use a database
  
  use bodija_restaurant;
 
-- create a table bodija_restaurant

create table customers(
customer_id int,
first_name varchar(255) not null,
last_name varchar(255) not null,
Email varchar(255) not null,
Phone_Number varchar(25) not null,
Address varchar(255) not null,
primary key(customer_id)
);

-- populating tables for customers
insert into customers(customer_id,first_name,last_name,email,Phone_Number, address)
values(0001,"adesoji","oke","okeadesoji26@gmail.com",09077274204,'Gate-Ibadan'),
       ("0002","oyekunle","sarah","adematraore@gmail.com","+2348055383577","Iwo road-Ibadan"),
       ("0003","adigun","pamilerin","jagungbade@gmail.com","09063185299","Ojoo-Ibadan"),
       (0004,"fred","ajala","fredajala@gmail.com",09077274205,"Apete-ibadan"),
       (0005,"promise","Adeleke","promiseadeleke@gmail.com","+2348150565781","Akobo-Ibadan"),
       (0006,"joyce","adejinle","adejinlejoyce@gmail.com","+2348079451222","Bodija-Ibadan"),
       (0007,"Ariana","Geoerge","geoergeariana@gmail.com","+2348040907010","Moniya-ibadan"),
       (0008,"Maliq","Obasco","maliqobasco@gmail.com","+2348038357765","Old ife road- Ibadan"),
       (0009,"femi","Ajagungbade","femiajagungbade@gmail.com",09055727376,"Moniya-Ibadan"),
       ("0010","davies","Ajadi","ajadidavies@gmail.com",09080907060,"Ojoo-Ibadan");


-- create product table
create table products(
product_id int,
product_name char(255) not null,
product_description text(1500) not null,
product_price varchar(255) not null,
product_category varchar(150) not null,
product_quantity int,
primary key(product_id)
);

-- populate a table for product which include (product_id,product_name,product_description,product_price,product_category,product_quantity)
       -- populating table 
insert into products(product_id,product_name,product_description,product_price,product_category,product_quantity)
values(001,'Rice', 'White rice with stew', 500.00,'food',100),
    (002,'Chicken', 'Fried chicken with chips', 800.00,'food',50),
    (003,'Fish', 'Grilled fish with plantain', 700.00,'food',75),
    (004,'Pasta', 'Spaghetti with bolognese sauce', 600.00,'food',80),
    (005,'Salad', 'Mixed vegetables salad', 400.00,'food',60),
    (006,'Pizza', 'Pepperoni pizza', 1000.00,'food',40),
    (007,'Burger', 'Beef burger with fries', 900.00,'food',55),
    (008,'Shawarma', 'Chicken shawarma wrap', 750.00,'food',70),
    (009,'Smoothie', 'Mixed fruit smoothie', 300.00,'beverage',120),
    (010,'Ice Cream', 'Vanilla ice cream', 350.00,'dessert',45);

-- create orders table
create table orders(
order_id int,
customer_id int not null,
order_date date,
total_amount varchar(120),
primary key(order_id),
foreign key(customer_id) references customers(customer_id)
);

-- populate a table for orders which includes(order_id,customer_id,order_date,total_amount)

-- populating table for  orders
insert into orders(order_id,customer_id,order_date,total_amount)
      values    (1,004,'2024-01-10', 1200.00),
    (2,008, '2024-01-18', 1300.00),
    (3,007, '2024-02-11', 1400.00),
    (4,006, '2024-02-19', 1500.00),
    (5,002, '2024-03-27', 1600.00),
    (6,001, '2024-03-29', 1700.00),
    (7,003, '2024-04-13', 1800.00),
    (8,005, '2024-04-18', 1900.00),
    (9,010, '2024-04-20', 2000.00),
    (10,009, '2024-05-13', 2100.00);


-- create orders_item table, the attribute should be, order_item_id,product_id, quantity
-- unit price

-- create table
create table order_item(
order_item_id int,
order_id int,
product_id int,
quantity varchar(10) not null,
unit_price varchar(25) not null,
primary key (order_item_id),
foreign key(order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);

-- populate table for order_item which include(order_item_id,order_id,product_id,quantity,unit_price)

-- populating table for order_item_id
insert into order_item(order_item_id,order_id,product_id,quantity,unit_price)
values    (101, 1, 2,10, 1000.00),
    (201, 2, 1,25, 200.00),
    (301, 3, 1,15, 700.00),
    (401, 4, 1,5, 600.00),
    (501, 5, 2,40, 1200.00),
    (601, 6, 1,35, 800.00),
    (701, 7, 2,50, 1800.00),
    (801, 8, 1,21, 900.00),
    (901, 9, 1,12, 2000.00),
    (1010, 10, 2,3, 700.00);

       
/* Some customers have been patronizing bodija_restaurant,we need their identity and the total amount 
they spent on orders, write a query that returns the whole records.*/


create view Customers_Patronage as (
select c.customer_id,c.first_name,c.last_name, sum(o.total_amount) as 'total money spent'
from customers c
join `orders`as o on o.customer_id = c.customer_id
group by customer_id
order by c.customer_id,c.first_name,c.last_name,'total money spent' desc
limit 10
);
select * from Customers_Patronage
order by 'total money spent' desc
limit 10;



/* Query out all customers contact so we can reach them via their phone numbers and any other means,
imagine you want to deliver some service to them in their homes too*/

select * from customers;


/* In descending order of magnitude return prices of goods
 such that they are arrange how expensive they are*/
 
 select product_name,product_price 
 from products
 order by product_price desc;
 
 /* In ascending order of magnitude query out unit price of ordered products
 with a condition the quantity ordered is greater than 5 products/goods*/
 
 
 select oi.unit_price,p.product_id, p.product_name,p.product_description,oi.quantity
 from `order_item` as oi
 join products p on oi.product_id = p.product_id
 where oi.quantity > 5
 order by oi.unit_price desc;
 
 
 
 
 
 
 
