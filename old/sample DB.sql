create database DB_e_commerce;
use DB_e_commerce;
 

create table Customer
(Account_ID varchar(10) not null,
Phone_No int not null,
Block_No int not null,
Street varchar(40) not null,
Unit_No int not null,
constraint Customer_pk primary key(Account_ID));
    
Insert into Customer(Account_ID, Phone_no, Block_No, Street, Unit_No) 
values
( 'A1', 80221111, 51,'Ang Mo Kio Avenue 1', 11);


--  primary key, auto increment for now i can do manual +=, then concate 'A'
-- next time can look into delimiter BEFORE. lmao no choice right, tech debt.

-- mainly i need the create table sequence only. I can put a test INSERT for each just be sure. 


create table Orders
(Order_ID varchar(10) not null,
 Customer_Account_ID varchar(10) not null,
 Total_Price int not null,
 constraint Orders_pk primary key(Order_ID),
 constraint Orders_fk1 foreign key(Customer_account_ID) references Customer(Account_ID));

insert into orders (Order_ID, Customer_Account_ID, Total_Price) values 
('O1','A1',72);



create table  Product_Type
(Product_ID varchar(10) not null,
 Name varchar(40) not null,
 constraint Product_Type_pk primary key(Product_ID));

Insert into Product_type (Product_ID, Name) values
('PD1','Chair');



create table Order_Product_Type  
(Order_ID varchar(10) not null,
 Product_ID varchar(10) not null,
 constraint Order_Product_Type_pk primary key(Order_ID, Product_ID),
 constraint Order_Product_Type_fk1 foreign key(Order_ID) references Orders(Order_ID),
 constraint Order_Product_Type_fk2 foreign key(Product_ID) references Product_Type(Product_ID));

 
Insert into Order_Product_Type values 
('O1' , 'PD1');



 



create table Supplier
(Supplier_ID varchar(10) not null,
 Name varchar(40) not null,
 constraint Supplier_pk primary key(Supplier_ID));

Insert into Supplier values
('S1',' Ann'),
('S2', 'Bob'),
('S3', 'Cole');





create table Supplier_Product_Type
(Supplier_ID Varchar(10) not null,
 Product_ID Varchar(10) not null,
 constraint Supplier_Product_Type_pk primary key(Supplier_ID, Product_ID),
 constraint Supplier_Product_Type_fk1 foreign key(Supplier_ID) references Supplier(Supplier_ID),
 constraint Supplier_Product_Type_fk2 foreign key(Product_ID) references Product_Type(Product_ID));

Insert into Supplier_Product_Type values
('S1',' P1'),
('S2', 'P2'),
('S3', 'P3');
 



create table Customer_Review
(Serial_No int not null,
 Feedback varchar(40) not null,
 Supplier_ID varchar(10) not null,
 Product_ID varchar(10) not null,
 Customer_account_ID varchar(10) not null,
 constraint Customer_Review_pk primary key(Serial_No),
 constraint Customer_Review_fk1 foreign key(Supplier_ID) references Supplier(Supplier_ID), 
 constraint Customer_Review_fk2 foreign key(Product_ID) references Product_Type(Product_ID),
 constraint Customer_Review_fk3 foreign key(Customer_Account_ID) references Customer(Account_ID));

 Insert into Customer_Review values
(1,'Durable and well made','S1','P1','A1');



-- #query1
-- Select Product_ID, Count( Distinct Order_ID) as TotalOrders from Order_Product_Type group by Product_ID;


-- #query2
-- Select Product_ID, Count(Distinct Supplier_ID) as Number_of_suppliers 
-- from Supplier_Product_type group by Product_ID;


-- #query3
-- Select cname, email, Count(Order_ID) as Orders_made
-- From customer c left outer join orders o 
-- on c.Account_ID = o.Customer_Account_ID and Extract(year from order_date) = 2022
-- Group by cname, email;


-- #query4
-- Select MONTHNAME(order_date) as monthname, count(extract(month from order_date)) as Total_Orders
-- From Orders
-- Group by month(order_date);

 