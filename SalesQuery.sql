create database Sales;

use Sales;
GO
create table Customers
(
customer_id int ,
first_name varchar(15) not null,
last_name varchar (15) not null,
email varchar(50) not null,
phone varchar(20) unique,
state varchar (15),
city varchar (15) not null,
street varchar(30) not null,
zip_code varchar (5),
constraint customers_pk primary key (customer_id)
);

create table Categories
(
category_id int ,
category_name varchar (20) not null,
constraint categories_pk primary key (category_id) );

create table brands
(brand_id int ,
brand_name varchar (20) not null,
constraint brands_pk primary key(brand_id)
);

create table stores
(store_id int ,
store_name varchar(20) not null,
phone varchar(20) ,
email varchar(50) not null,
street varchar(20),
city varchar(15) not null,
state varchar(15),
zip_code varchar(5) not null,
constraint stores_pk primary key (store_id));

create table staff
(staff_id int ,
first_name varchar (20) not null,
last_name varchar (20) not null,
salary numeric(7,2) check (salary between 4000 and 15000),
hire_date date,
store_id int,
constraint staff_pk primary key (staff_id),
constraint stores_staff_fk foreign key(store_id) references stores (store_id) );

create table orders
(
order_id int ,
customer_id int ,
order_status varchar(10) not null,
order_date date,
required_date date,
shippd_date date,
store_id int,
staff_id int,
constraint orders_pk primary key(order_id),
constraint Customers_orders_fk foreign key (customer_id) references Customers(customer_id),
constraint stores_orders_fk foreign key (store_id) references stores(store_id),
constraint staff_orders_fk foreign key (staff_id) references staff (staff_id));

create table products
(
product_id int ,
product_name varchar(20) not null,
model_year int ,
list_price numeric (7,2),
brand_id int,
category_id int,);

drop database sales;
