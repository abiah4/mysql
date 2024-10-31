CREATE TABLE categories (
category_id int auto_increment primary key,
category_name varchar(100) not null );

CREATE TABLE products (
product_id int auto_increment primary key,
product_name varchar(100) not null,
price decimal(10,2) not null,
stock int not null,
category_id int,
foreign key (category_id) references categories(category_id)
);

create table customers (
customer_id int auto_increment primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
email varchar(100) not null unique,
phone varchar(15)
);

create table orders (
order_id int auto_increment primary key,
customer_id int,
order_date datetime default current_timestamp,
total_amount decimal(10,2),
foreign key (customer_id) references customers(customer_id)
);

create table order_items (
order_item_id int auto_increment primary key,
order_id int,
product_id int,
quantity int not null,
price decimal(10,2) not null,
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products (product_id)
);

INSERT INTO categories (category_name) 
VALUES ('Fruits'), ('Vegetables'), ('Dairy'), ('Snacks');

insert into products (product_name,price,stock,category_id) values
('Apple', 0.50,100,1),
('Banana', 0.30,150,1),
('Carrot', 0.20,200,2),
('Milk', 1.00,50,3),
('Chips', 1.50,75,4),
('apple', 0.50,100,1),
('Yogurt', 0.70,25,3),
('Cheese', 1.20,63,3),
('Butter', 0.86,90,3),
('Granola bars', 2.20,130,4),
('Nuts', 3.75,120,4),
('Popcorn', 1.40,44,4),
('Oranges', 0.60,40,1),
('Strawberries', 1.00,35,1),
('Grapes', 0.70,100,1),
('Kiwi', 0.60,140,1),
('Broccoli', 0.90,110,2),
('Garlic', 0.30,170,2),
('Eggplant', 0.90,80,2);


insert into customers (first_name , last_name, email , phone)
values ('Nada' , 'Ahmed' , 'nada@gmail.com' , '500500055'),
('Nasser' , 'Fahad' , 'Nass12@gmail.com' , '050000405'),
('Khaild' , 'fahad' , 'KHHHH@gmail.com' , '50000503'),
('Muna' , 'noor' , 'mun2@gmail.com' , '050444405');

insert into orders (customer_id, total_amount) values
(1, 5.00),
(2, 3.50),
(3, 4.40),
(4, 2.60);

SELECT c.first_name, c.last_name, SUM(o.total_amount) AS total_sales
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id;

SELECT p.product_name , p.stock, c.category_name
from products p
join categories c on p.category_id = c.category_id
order by p.stock desc;
