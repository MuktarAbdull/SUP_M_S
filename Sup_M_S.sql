create database supermarket_mananagement_system;
use supermarket_mananagement_system;

create table customer(
cus_id varchar(6) primary key not null,
cus_Fname varchar(15) not null,
cus_Lname varchar(15) not null,
cus_phone char(10) not null,
cus_Address varchar(20));


create table supplier(
sup_code integer primary key not null,
Company_Name varchar(20) not null,
sup_phone char(10) not null,
sup_Address varchar(20));

create table products(
PRO_ID varchar(6) primary key not null,
PRO_Name varchar(20) not null,
PRO_Price float not null,
Availability varchar(3) not null,
sup_code integer foreign key references supplier(sup_code))

create table STORE(
store_code varchar(6) primary key not null,
IN_product varchar(15) not null,
OUT_product varchar(15) not null,
IN_product_date DATETIME,
OUT_product_date DATETIME,
IN_PRODUCT_QUANTITY CHAR(5),
OUT_product_QUANTITY CHAR(5),
PRO_ID varchar(6) foreign key references products(PRO_ID));



create table users(
user_id varchar(6) primary key not null,
user_Fname varchar(15) not null,
user_Lname varchar(15) not null
)
create table USER_ROLE(
Role_id varchar(6) primary key not null,
Role_Title varchar(20) not null,
Role_DISC varchar(20) not null,
user_id varchar(6) foreign key references Users(user_id));


create table Sales_Report(
sale_id varchar(6) primary key not null,
sale_amount char(5) not null,
sale_type varchar(15) not null,
sale_price float(5) not null,
sale_date DATETIME not null,
cus_id varchar(6) foreign key references customer(cus_id),
PRO_ID varchar(6) foreign key references products(PRO_ID),
user_id varchar(6) foreign key references users(user_id));



Create table ORDERS(
ORDER_ID varchar(6) primary key not null,
ORDER_ITEM VARCHAR(15) Not null,
ORDER_DATE DATETIME not null,
cus_id varchar(6) foreign key references customer(cus_id),
PRO_ID varchar(6) foreign key references products(PRO_ID),
user_id varchar(6) foreign key references users(user_id));


create table Payment(
PAY_code varchar(10) primary key not null,
PAY_TYPE varchar(10) not null,
PAY_AMOUNT CHAR(5) not null,
PAY_DATE DateTime not null,
ORDER_ID varchar(6) foreign key references ORDERS(ORDER_ID));


create table INVOICE(
INVOICE_ID varchar(10) primary KEY NOT NULL,
INVOICE_DATE DATETIME NOT NULL,
cus_id varchar(6) foreign key references customer(cus_id),
PRO_ID varchar(6) foreign key references products(PRO_ID),
PAY_code varchar(10) foreign key references Payment(PAY_code));


create table STAFF(
STAFF_ID VARCHAR(6) primary key not null,
STF_FNAME varchar(15) not null,
STF_LNAME Varchar(15) not null,
sex char(2),
phone char(10) not null,
salary Decimal(6,0) not null,
);

create table DELIVERY(
DEL_id varchar(6) primary key not null,
DEl_DATE DATETIME NOT NULL,
PRO_ID varchar(6) foreign key references products(PRO_ID),
cus_id varchar(6) foreign key references customer(cus_id),
ORDER_ID varchar(6) foreign key references ORDERS(ORDER_ID),
STAFF_ID varchar(6) foreign key references STAFF(STAFF_ID),
);


create table STAFF_ROLE(
STF_ROLE_ID varchar(6) primary key not null,
Staff_Title varchar(15) not null,
STF_DISC varchar(20) not null,
STAFF_ID varchar(6) foreign key references STAFF(STAFF_ID))

