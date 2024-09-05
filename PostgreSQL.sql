------ Hack 1

create table countries(
  id_country serial primary key,
  name varchar(50) not null  
);

create table users(
 id_users serial primary key,
 id_country integer not null,
 email varchar(100) not null,
 name varchar (50) not null,
 foreign key (id_country) references countries (id_country)   
);

------ Hack 2

insert into countries (name) values ('argentina') , ('colombia'),('chile');
select * from countries;

insert into users (id_country, email, name) 
  values (2, 'foo@foo.com', 'fooziman'), (3, 'bar@bar.com', 'barziman');
select * from users;
 
delete from users where email = 'bar@bar.com';

update users set email = 'foo@foo.foo', name = 'fooz' where id_users = 1;

select * from users;

select * from users inner join  countries on users.id_country = countries.id_country;

select u.id_users as id, u.email, u.name as fullname, c.name 
  from users u inner join  countries c on u.id_country = c.id_country;


------ Hack 3

create table countries(
  id_country serial primary key,
  name varchar(50) not null  
);
  
create table Priorities(
 id_priority serial primary key,
 type_name VARCHAR(50) nOT NULL
);

create table contact_request(
 id_email VARCHAR(50)  primary key,
 id_country INTEGER nOT NULL,
 id_priority INTEGER not NULL,
 NAME VARCHAR(50) nOT NULL,
 DETAIL VARCHAR(100) nOT NULL,
 physical_adrees VARCHAR(100) nOT NULL,
 foreign key (id_country) references countries (id_country),
 foreign key (id_priority) references Priorities (id_priority) 
);

------ hack 4

insert into countries (name) values ('Argentina') , ('Colombia'),('Venezuela'),('Chile'),('Ecuador');
SELECT * FROM countries;

insert into priorities (type_name) VALUES ('Comer asado'), ('conocer bogota'),('comer arepas en caracas');
SELECT * FROM priorities;

INSERT INTO contact_request (id_email, id_country, id_priority, name, detail, physical_adrees)  VALUES (1,1,1, 'fooziman', 'foo', 'calle foo'), (2,2,2, 'barziman', 'bar', 'calle barzi'), (3,3,3, 'exuman', 'exu', 'calle exu'); 
SELECT * from contact_request;

delete from contact_request where id_email = 3;
SELECT * from contact_request;

update contact_request set  name = 'foozi', detail = 'fooz', physical_adrees = 'calle fooz' WHERE id_country = 1;
SELECT * from contact_request;


select * from contact_request inner join countries on contact_request.id_country = countries.id_country;
select * from contact_request inner join priorities on contact_request.id_priority = priorities.id_priority;

SELECT * FROM contact_request cr 
join countries co on cr.id_country = co.id_country
join priorities pr on cr.id_priority = pr.id_priority;



------ hack 5

CREATE TABLE countries (
  id_country serial primary KEY,
  name VARCHAR(50)
);

CREATE TABLE roles (
  id_role serial primary KEY,
  name VARCHAR(50)
);

CREATE TABLE TAXES (
  id_tax serial PRIMARY KEY,
  percentage INT
 );
 
CREATE TABLE OFFERS (
  id_offer serial PRIMARY KEY,
  status varchar(50)
 );
 
CREATE TABLE DISCOUNTS (
  id_discount serial PRIMARY KEY,
  status varchar(50),
  percentage INT
 );
 
CREATE TABLE payments (
  id_payment serial PRIMARY KEY,
  "type" varchar(50)
);

CREATE TABLE customers (
  id_customer serial primary key,
  email VARCHAR(50),
  id_country INTEGER,
  id_role INTEGER,
  name VARCHAR(50),
  AGE INTEGER,
  password VARCHAR(50),
  physical_addres VARCHAR(50),
  foreign key (id_country) references countries (id_country),
  foreign key (id_role) references roles (id_role) 
);

CREATE TABLE invoice_status (
  id_invoice_status serial PRIMARy KEY,
  status VARCHAR(50)
);

CREATE TABLE products (
  id_product serial PRIMARY KEY,
  id_discount INTEGER,
  id_offer INTEGER,
  id_tax INTEGER,
  name VARCHAR(50),
  details VARCHAR(50),
  minimun_stock INTEGER,
  maximun_stock INTEGER,
  current_stock INTEGER,
  price INTEGER,
  price_with_tax INTEGER,
  foreign key (id_tax) references taxes (id_tax),
  foreign key (id_offer) references offers (id_offer),
  foreign key (id_discount) references discounts (id_discount)
);

create table products_customers (
    id_customer integer,
    id_product integer,
    foreign key (id_customer) references customers (id_customer),
    foreign key (id_product) references products (id_product),
    PRIMARY KEY (id_customer, id_product)
);

CREATE TABLE invoices (
  id_invoices serial PRIMARY KEY,
  id_customer INTEGER,
  id_payment INTEGER,
  id_invoice_status INTEGER,
  date VARCHAR(50),
  total_to_pay INTEGER,
  foreign key (id_customer) references customers (id_customer),
  foreign key (id_payment) references payments (id_payment),
  foreign key (id_invoice_status) references invoice_status (id_invoice_status)
);

CREATE TABLE orders (
  id_order serial PRIMARY KEY,
  id_invoices INTEGER,
  id_product INTEGER,
  detail VARCHAR(50),
  amount INTEGER,
  price INTEGER,
  foreign key (id_invoices) references invoices (id_invoices),
  foreign key (id_product) references products (id_product)
); 
  

------  hack 6 


insert into countries (name) values ('Argentina') , ('Venezuela'),('Colombia');
SELECT * FROM countries;

insert into roles (name) values ('Gerente') , ('Sub-Gerente'),('Vendedor');
SELECT * FROM roles;

insert into taxes (percentage) values ('10') , ('12'),('15');
SELECT * FROM taxes;

insert into offers (status) values ('enabled') , ('disabled'),('stand by');
SELECT * FROM offers;

insert into discounts (status, percentage) values ('enabled', 20) , ('disabled', 0),('stand by', 10);
SELECT * FROM discounts;

insert into payments (type) values ('SENIAT') , ('CONTRATISTA'),('PROVEEDORES');
SELECT * FROM payments;

insert into customers 
(email, id_country, id_role, name, age,password,physical_addres)
values 
('rodrigo123@ecommerce', 1,1,'Rodrigo',45,'rodri45.','Palermo') ,
('carlos321@ecommerce', 2,2,'Carlos',32,'car32.','Caracas'),
('jaime332@ecommerce', 3,3,'Jaime',27,'jaime27.','Bogota');
SELECT * FROM customers;

insert into invoice_status (status) values ('processed') , ('unprocessed'),('review');
SELECT * FROM invoice_status;
  
INSERT into products
(id_discount, id_offer, id_tax, NAME, details, minimun_stock, maximun_stock, current_stock, price, price_with_tax)
 VALUES
(1,1,1, 'Shoes Adidas', 'Adidas Super-star', 5, 30, 12, 30, 33),
(2,2,1, 'Shoes Nike', 'Nike Air Force 1', 5, 30, 15, 20, 22),
(3,1,3, 'Shoes Puma', 'Puma Thunder ', 5, 30, 20, 40, 46);
SELECT * from products;
  
iNSERT INTO products_customers ( id_customer, id_product) VALUES (1,1), (1,2), (2,2);
SELECT* from products_customers;

INSERT INTO invoices (
  id_customer, id_payment, id_invoice_status, date, total_to_pay) 
  VALUES
  (1, 3, 1, '16/07/2024', 2034),
  (2, 1, 3, '24/07/2024',3044),
  (3,2, 2, '02/08/2024', 787344);
  
SELECT * FROM invoices;

INSERT into orders (
  id_invoices, id_product, detail, amount, price) 
  VALUES
  (1,1, 'Salida de zapatos Adidas', 6, 198),
  (2, 2, 'Salida de zapatos Nike', 10, 220),
  (3,3, 'Salida de zapatos puma', 11, 506);

SELECT * from orders;

DELETE from customers where name = ('Rodrigo');
DELETE from customers where name = ('Jaime');
SELECT * from customers;

UPDATE customers SET email = 'kike123@gmail.com', name = 'Enrique', age = 35, password = 'kike2023.' WHERE id_customer = 2 ;
SELECT * from customers;

UPDATE taxes SET percentage = 12 WHERE id_tax = 1;
UPDATE taxes SET percentage = 16 WHERE id_tax = 2;
UPDATE taxes SET percentage = 21 WHERE id_tax = 3;
SELECT * from taxes;

UPDATE products SET price_with_tax = 34 WHERE id_product = 1;
UPDATE products SET price_with_tax =  23 WHERE id_product = 2;
UPDATE products SET price_with_tax = 49 WHERE id_product = 3;
SELECT * from products;

select * from products 
inner join  taxes on products.id_tax = taxes.id_tax
INNER join offers on products.id_offer = offers.id_offer
INNER join discounts on products.id_discount = discounts.id_discount;

SELECT * from customers
INNER join roles on customers.id_role = roles.id_role
INNER JOIN countries on customers.id_country = countries.id_country;

SELECT * from products_customers
INNER join products on products_customers.id_product = products.id_product
INNER join customers on products_customers.id_customer = customers.id_customer;

SELECT * from invoices
INNER JOIN payments on invoices.id_payment = payments.id_payment
INNER join customers on invoices.id_customer = customers.id_customer
inner join invoice_status on invoices.id_invoice_status = invoice_status.id_invoice_status;

SELECT * from orders
INNER join invoices on orders.id_invoices = invoices.id_invoices
INNER join products on orders.id_product = products.id_product;









  