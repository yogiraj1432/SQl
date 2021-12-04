CREATE DATABASE Assignment;
USE Assignment;

/*creating table SalesPeople*/
CREATE TABLE SalesPeople (Snum INT PRIMARY KEY, Sname VARCHAR(10), City VARCHAR(15), Comm INT);
/*creating table Customers*/
CREATE TABLE Customers (Cnum INT PRIMARY KEY, Cname VARCHAR(15), City VARCHAR(15) NOT NULL, Snum INT, FOREIGN KEY (Snum) REFERENCES SalesPeople(Snum) ON DELETE SET NULL);
/*creating table Orders*/
CREATE TABLE Orders (Onum INT PRIMARY KEY, Amt DECIMAL(6,2), Odate DATE, Cnum INT, Snum INT, FOREIGN KEY(Cnum) REFERENCES Customers(Cnum) ON DELETE SET NULL, FOREIGN KEY(Snum) REFERENCES SalesPeople(Snum) ON DELETE SET NULL);

/* Inserting values into SalesPeople table*/
INSERT INTO SalesPeople VALUES (1001,'Peel','London',12),
(1002,'Serres','Sanjose',13),
(1004,'Motika','London',11),
(1007,'Rifkin','Barcelona',15),
(1003,'Axelrod','Newyork',10);

/* Inserting values into customers table*/
INSERT INTO Customers VALUES (2001,'Hoffman','London',1001),
(2002,'Giovanni','Rome',1003),
(2003,'Liu','Sanjose',1002),
(2004,'Grass','Berlin',1002),
(2006,'Clemens','London',1001),
(2008,'Cisneros','Sanjose',1007),
(2007,'Pereira','Rome',1004);

/*Inserting values into Orders table*/
INSERT INTO Orders VALUES (3001,18.69,'1990-10-03',2008,1007),
(3003,767.19,'1990-10-03',2001,1001),
(3002,1900.10,'1990-10-03',2007,1004),
(3005,5160.45,'1990-10-03',2003,1002),
(3006,1098.16,'1990-10-03',2008,1007),
(3009,1713.23,'1990-10-04',2002,1003),
(3007,75.75,'1990-10-04',2004,1002),
(3008,4273,'1990-10-05',2006,1001),
(3010,1309.95,'1990-10-06',2004,1002),
(3011,9891.88,'1990-10-06',2006,1001);

/* Question 1 -- Count the number of Salesperson whose name begin with ‘a’/’A’.  */
SELECT COUNT(Sname) FROM SalesPeople WHERE Sname LIKE 'a%';


/* Question 2 -- Display all the Salesperson whose all orders worth is more than Rs. 2000.   */
SELECT SalesPeople.Sname, SUM(Orders.Amt) AS orders_worth FROM SalesPeople
JOIN Orders ON Orders.Snum=SalesPeople.Snum
GROUP BY Cnum
HAVING SUM(Amt)>2000;


/* Queston 3 -- Count the number of Salesperson belonging to Newyork   */
SELECT COUNT(City) FROM salespeople WHERE City='Newyork';


/* Question 4 -- Display the number of Salespeople belonging to London and belonging to Paris.  */
SELECT COUNT(City) FROM salespeople WHERE City='London' OR City='Paris';


/* Question 5 -- Display the number of orders taken by each Salesperson and their date of orders.  */
SELECT Snum, COUNT(Snum) AS 'No_of_Orders' , GROUP_CONCAT(Odate) AS 'Order_Dates' FROM Orders
GROUP BY Snum;

/* Query for above with salespeople name included  */
SELECT Orders.Snum, SalesPeople.Sname AS 'Name' , Count(Orders.Snum) AS 'No_of_orders', GROUP_CONCAT(Orders.Odate) AS 'Order_Dates' FROM SalesPeople
JOIN Orders ON Orders.Snum=SalesPeople.Snum
GROUP BY Snum;