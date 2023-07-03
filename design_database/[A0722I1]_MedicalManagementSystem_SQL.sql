drop database if exists `project`;
create database `project`;
use `project`;

create table `role` (
role_id int auto_increment primary key,
role_name varchar(45) not null
);

create table `account` (
account_id int auto_increment primary key,
account_name varchar(45) not null,
`encrypt_password` varchar(45) not null,
email varchar(45) not null,
verification_code varchar(45),
is_enable bit not null
);

create table account_role (
account_role_id int auto_increment primary key,
account_id int not null,
role_id int not null,
foreign key (account_id) references `account` (account_id),
foreign key (role_id) references `role` (role_id)
);

create table position (
position_id int auto_increment primary key,
position_name varchar(45) not null
);

create table employee (
employee_id int auto_increment primary key,
employee_name varchar(45) not null,
employee_address varchar(45) not null,
employee_province varchar(45) not null,
account_id int not null,
position_id int not null,
foreign key (account_id) references `account` (account_id),
foreign key (position_id) references position (position_id)
);

create table customer_type (
customer_type_id int auto_increment primary key,
customer_type_name varchar(45) not null
);

create table customer (
customer_id int auto_increment primary key,
customer_name varchar(45) not null,
customer_address varchar(45) not null,
customer_province varchar(45) not null,
account_id int not null,
customer_type_id int not null,
foreign key (account_id) references `account` (account_id),
foreign key (customer_type_id) references customer_type (customer_type_id)
);

create table shipment_type (
shipment_type_id int auto_increment primary key,
shipment_type_name varchar(45) not null
);

create table shipment (
shipment_id int auto_increment primary key,
invoice_code varchar(45) not null,
note varchar(45),
date_of_create date not null,
is_enable bit not null,
shipment_type_id int not null,
employee_id int not null,
customer_id int not null,
foreign key (shipment_type_id) references shipment_type (shipment_type_id),
foreign key (employee_id) references employee (employee_id),
foreign key (customer_id) references customer (customer_id)
);

create table category (
category_id int auto_increment primary key,
category_name varchar(45) not null
);

create table product (
product_id int auto_increment primary key,
product_name varchar(45) not null,
product_price int not null,
product_quantity int not null,
is_enable bit not null,
category_id int not null,
customer_id int not null,
foreign key (category_id) references category (category_id),
foreign key (customer_id) references customer (customer_id)
);

create table shipment_detail (
shipment_detail_id int auto_increment primary key,
quantity int not null,
product_id int not null,
shipment_id int not null,
foreign key (product_id) references product (product_id),
foreign key (shipment_id) references shipment (shipment_id)
);

create table receipt (
receipt_id int auto_increment primary key,
invoice_code varchar(45) not null,
note varchar(45),
date_of_create date not null,
is_enable bit not null,
employee_id int not null,
foreign key (employee_id) references employee (employee_id)
);

create table receipt_detail (
receipt_detail_id int auto_increment primary key,
quantity int not null,
product_id int not null,
receipt_id int not null,
foreign key (product_id) references product (product_id),
foreign key (receipt_id) references receipt (receipt_id)
);

create table cart (
cart_id int auto_increment primary key,
receiver_name varchar(45) not null,
receiver_address varchar(45) not null,
receiver_city varchar(45) not null,
receiver_email varchar(45) not null,
customer_id int not null,
foreign key (customer_id) references customer (customer_id)
);

create table cart_detail (
cart_detail_id int auto_increment primary key,
quantity int not null,
receiver_address varchar(45) not null,
is_enable bit not null,
cart_id int not null,
product_id int not null,
foreign key (cart_id) references cart (cart_id),
foreign key (product_id) references product (product_id)
);

create table shoping (
shoping_id int auto_increment primary key,
total_amount int not null,
note varchar(45),
date_of_create date not null,
cart_id int not null,
foreign key (cart_id) references cart (cart_id) 
);