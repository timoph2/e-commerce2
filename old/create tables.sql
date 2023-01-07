
// 1-time SQL creation script. then remove it.
let mysql = require('mysql'); //npm i mysql

let con = mysql.createConnection({
  host: '127.0.0.1',
  user: 'root', //process.env.user
  password: 'root', //process.env.password
  database: 'e_commerce' //if DB alr created scenario
});

// con.connect(function(err) {
//   if (err) throw err;
//   console.log("Connected!");
//   con.query("CREATE DATABASE e_commerce", function (err, result) {
//     if (err) throw err;
//     console.log("Database created");
//   });
// });


// con.connect(function(err) {
//   if (err) throw err;
//   console.log("Connected!");
//   // let sql = "CREATE TABLE customers (name VARCHAR(255), address VARCHAR(255))"; //need template literal to multi-line string 
//   let sql = `create table Customer
//   (Account_ID varchar(10) not null,
//   Phone_No int not null,
//   Block_No int not null,
//   Street varchar(40) not null,
//   Unit_No int not null,
//   constraint Customer_pk primary key(Account_ID))`; 


//   con.query(sql, function (err, result) {
//     if (err) { //throw err;
//       var sql = "ALTER TABLE customers ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY";
//       con.query(sql, function (err, result) {
//         if (err) {console.log('Table ready')} //; here ruins the if-else
//         else {console.log("Table altered")};
//       });
//     }
//     else { console.log("Table created")}
//   });
// });


// sql = `INSERT INTO customers (name, address) 
// VALUES ('${data}', '${data}')`;
// con.query(sql, function (err, result) {
//   if (err) throw err;
//   console.log("1 record inserted");
// });


// sql = `Insert INTO Customer(Account_ID, Phone_no, Block_No, Street, Unit_No)
// VALUES ( 'A1', 80221111, 51,'Ang Mo Kio Avenue 1', 11)`;

// con.query(sql, function (err, result) {
//   if (err) throw err;
//   console.log("1 record inserted");
// });


 



// sql = `create table Orders
// (Order_ID varchar(10) not null,
//  Customer_Account_ID varchar(10) not null,
//  Total_Price int not null,
//  constraint Orders_pk primary key(Order_ID),
//  constraint Orders_fk1 foreign key(Customer_account_ID) references Customer(Account_ID))`;

//   con.query(sql, function (err, result) {
//     if (err) { //throw err;
//       var sql = "ALTER TABLE customers ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY";
//       con.query(sql, function (err, result) {
//         if (err) {console.log('Table ready')} //; here ruins the if-else
//         else {console.log("Table altered")};
//       });
//     }
//     else { console.log("Table created")}
//   });


// sql = `insert into orders (Order_ID, Customer_Account_ID, Total_Price) values 
// ('O1','A1',72)`;

// con.query(sql, function (err, result) {
//   if (err) throw err;
//   console.log("1 record inserted");
// });







// sql = `create table  Product_Type
// (Product_ID varchar(10) not null,
//  Name varchar(40) not null,
//  constraint Product_Type_pk primary key(Product_ID))`;

//  con.query(sql, function (err, result) {
//   if (err) { //throw err;
//     var sql = "ALTER TABLE customers ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY";
//     con.query(sql, function (err, result) {
//       if (err) {console.log('Table ready')} //; here ruins the if-else
//       else {console.log("Table altered")};
//     });
//   }
//   else { console.log("Table created")}
// });

//  sql = `Insert into Product_type (Product_ID, Name) values ('P3', 'Tape')`; //('P1', 'Fan'), ('P2', 'Cup')



// con.query(sql, function (err, result) {
//   if (err) throw err;
//   console.log("1 record inserted");
// });

// sql = `create table Order_Product_Type  
// (Order_ID varchar(10) not null,
//  Product_ID varchar(10) not null,
//  constraint Order_Product_Type_pk primary key(Order_ID, Product_ID),
//  constraint Order_Product_Type_fk1 foreign key(Order_ID) references Orders(Order_ID),
//  constraint Order_Product_Type_fk2 foreign key(Product_ID) references Product_Type(Product_ID))`;
  
//  con.query(sql, function (err, result) {
//     if (err) { //throw err;
//       var sql = "ALTER TABLE customers ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY";
//       con.query(sql, function (err, result) {
//         if (err) {console.log('Table ready')} //; here ruins the if-else
//         else {console.log("Table altered")};
//       });
//     }
//     else { console.log("Table created")}
//   });
 
//  sql = `Insert into Order_Product_Type values 
// ('O1' , 'PD1')`;


// con.query(sql, function (err, result) {
//   if (err) throw err;
//   console.log("1 record inserted");
// });

 



// sql = `create table Supplier
// (Supplier_ID varchar(10) not null,
//  Name varchar(40) not null,
//  constraint Supplier_pk primary key(Supplier_ID))`;

//  con.query(sql, function (err, result) {
//   if (err) { //throw err;
//     var sql = "ALTER TABLE customers ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY";
//     con.query(sql, function (err, result) {
//       if (err) {console.log('Table ready')} //; here ruins the if-else
//       else {console.log("Table altered")};
//     });
//   }
//   else { console.log("Table created")}
// });

//  sql = `Insert into Supplier values
// ('S1',' Ann'),
// ('S2', 'Bob'),
// ('S3', 'Cole')`;

// con.query(sql, function (err, result) {
//   if (err) throw err;
//   console.log("1 record inserted");
// });




// sql = `create table Supplier_Product_Type
// (Supplier_ID Varchar(10) not null,
//  Product_ID Varchar(10) not null,
//  constraint Supplier_Product_Type_pk primary key(Supplier_ID, Product_ID),
//  constraint Supplier_Product_Type_fk1 foreign key(Supplier_ID) references Supplier(Supplier_ID),
//  constraint Supplier_Product_Type_fk2 foreign key(Product_ID) references Product_Type(Product_ID))`;
 
//  con.query(sql, function (err, result) {
//     if (err) { //throw err;
//       var sql = "ALTER TABLE customers ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY";
//       con.query(sql, function (err, result) {
//         if (err) {console.log('Table ready')} //; here ruins the if-else
//         else {console.log("Table altered")};
//       });
//     }
//     else { console.log("Table created")}
//   });

//  sql = `Insert into Supplier_Product_Type values
// ('S1', 'P1'),
// ('S2', 'P2'),
// ('S3', 'P3')`;
 

// con.query(sql, function (err, result) {
//   if (err) throw err;
//   console.log("1 record inserted");
// });


// sql = `create table Customer_Review
// (Serial_No int not null,
//  Feedback varchar(40) not null,
//  Supplier_ID varchar(10) not null,
//  Product_ID varchar(10) not null,
//  Customer_account_ID varchar(10) not null,
//  constraint Customer_Review_pk primary key(Serial_No),
//  constraint Customer_Review_fk1 foreign key(Supplier_ID) references Supplier(Supplier_ID), 
//  constraint Customer_Review_fk2 foreign key(Product_ID) references Product_Type(Product_ID),
//  constraint Customer_Review_fk3 foreign key(Customer_Account_ID) references Customer(Account_ID))`;

//  con.query(sql, function (err, result) {
//   if (err) { //throw err;
//     var sql = "ALTER TABLE customers ADD COLUMN id INT AUTO_INCREMENT PRIMARY KEY";
//     con.query(sql, function (err, result) {
//       if (err) {console.log('Table ready')} //; here ruins the if-else
//       else {console.log("Table altered")};
//     });
//   }
//   else { console.log("Table created")}
// });

//  sql = ` Insert into Customer_Review values
// (1,'Durable and well made','S1','P1','A1')`;


// con.query(sql, function (err, result) {
//   if (err) throw err;
//   console.log("1 record inserted");
// });

