drop database if exists shopping_management;

create database shopping_management;

use shopping_management;

create table customers (
      customer_id int primary key auto_increment,
      customer_name varchar(50) not null,
	  Email varchar(100) unique,
      Phone_number char(10) not null unique,
      Age tinyint unsigned check(age>0),
      gender enum ('male','female','other'),
      Country varchar(50) default 'India',
      City varchar(50) not null,
      Pincode char(6) default '201301',
      registration_date date default (current_date),
      registration_time time default (current_time),
      created_at datetime default current_timestamp,
      Address varchar(250),
      customer_status enum('active','inactive','blocked') default 'active',
      customer_notes tinytext
) engine=innodb;

      select * from customers;
      

create table orders(
		   order_id int primary key auto_increment,
           customer_id int,
           order_date date default (current_date),
           order_ammount decimal (10,2) not null,
           order_status enum('pending','processing','shipped','delivered','cancelled') default 'pending',
           payment_method enum('cash','card','upi','netbanking'),
           payment_status enum('pending','paid','failed')default 'pending',
           shipping_address varchar(250) not null,
           delivery_pincode char(6),
           quantity int not null check(quantity > 0),
           discount_amount decimal(10,2) default 0.00,
           delivery_date date null,
           created_at datetime default current_timestamp,
           tracking_number varchar(30) unique,
           delivery_status enum('not dispatched','in transit','delivered','returned') default 'not dispatched',
           order_notes tinytext,
           foreign key (customer_id)
           references customers (customer_id)
 ) engine=innodb;
           select * from orders