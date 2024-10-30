create table users (
userID int auto_increment primary key,
username varchar(50) not null,
password varchar(255) not null,
Email varchar(100),
createdAT timestamp default current_timestamp
);


CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Stock INT DEFAULT 0,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
create table orders (
orderid int auto_increment primary key,
userid int,
orderDate timestamp default current_timestamp,
foreign key (userid) references users(userid)
);

CREATE TABLE OrderDetails (
    OrderDetailID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


insert into users (username , password , email) values
('Hala_khaild' , 'Password232' , 'h20@gmail.com'),
('Nada_ahmed' , 'Superwoman' , 'nnnn@gmail.com');

insert into products(productName, price , stock) values
('laptop' , 999.99, 10),
('iPhone' , 499.99 , 20),
('Tablet' , 299.99, 15);

insert into orders (userid) values
(1),
(2);

insert into orderdetails (orderid , productid, quantity) values
(1,1,1),
(1,2,2),
(2,3,1);

select o.orderid, u.username , o.orderdate
from orders o 
join users u on o.userid = u.userid;

update users
set email = 'hala2020@gmail.com'
where username = 'hala_khaild';

select count(*) as totalproductsinstock
from products
where stock > 0;

select sum(p.price * od.quantity) as totalrevenue
from orderdetails od
join products p on od.productid = p.productid;

