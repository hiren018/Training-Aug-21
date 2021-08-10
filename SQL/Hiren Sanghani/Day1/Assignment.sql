CREATE TABLE B_Employee (
Employee_Id INT PRIMARY KEY,
FirstName CHAR(10) NOT NULL,
LastName CHAR(10) NOT NULL,
Email CHAR(15) NOT NULL,
MobileNo CHAR(10) NOT NULL,
Salary INT NOT NULL,
Comission INT NOT NULL CONSTRAINT Ucom UNIQUE
)

CREATE TABLE Inventory(
Item_id INT PRIMARY KEY,
Item_Name VARCHAR(15),
Item_qty INT
)

CREATE TABLE sales(
srno INT PRIMARY KEy,
EmployeeNo INT CONSTRAINT emp_fkForeig REFERENCES B_Employee(Employee_Id) on update NO ACTION,
ItemNo INT CONSTRAINT item_fkForeig REFERENCES Inventory(Item_id) on update NO ACTION,
SaleQty INT
)
 
INSERT INTO B_Employee VALUES ('Hiren','Sanghani','hiren@gmail.com','123456789',1234,15)
INSERT INTO B_Employee VALUES ('Mayank','shrma','man@gmail.com','9879441799',6525,45)
INSERT INTO B_Employee VALUES ('shyam','patel','turth@gmail.com','5686220447',4578,36)
INSERT INTO Inventory VALUES ('Bmw',100)
INSERT INTO Inventory VALUES ('Audi',50)
INSERT INTO Inventory VALUES ('Alto',30)
INSERT INTO sales VALUES (1,1,20)
INSERT INTO sales VALUES (2,2,30)
INSERT INTO sales VALUES (2,3,10)

SELECT * from B_Employee
SELECT * from Inventory
SELECT * from sales