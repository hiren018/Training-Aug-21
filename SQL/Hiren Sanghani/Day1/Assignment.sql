CREATE TABLE Employees(
EmpID char(4) not null PRIMARY KEY,
FirstName char(20) not null,
LastName char(20) not null,
Phone Numeric(10)not null,
Email char(50) CONSTRAINT chk_mail CHECK(Email LIKE '%_@__%.__%')
);


CREATE TABLE Cars(
CarId char(4) not null PRIMARY KEY,
CarName char(15) not null,
ModelNo char(10) not null,
CarPrice INTEGER not null
);


CREATE TABLE Sales(
SalesId int not null PRIMARY KEY,
EmpID char(4) CONSTRAINT emp_fk REFERENCES Employees(EmpID) ON UPDATE CASCADE ON DELETE CASCADE,
CarId Char(4) CONSTRAINT car_fk REFERENCES Cars(CarId) ON UPDATE CASCADE ON DELETE CASCADE,
SaleQty int,
SaleComission REAL
);

INSERT INTO Employees VALUES 
('E1','Hiren','Sanghani','1234567890','hiren@123gmail.com'),
('E2','Yash','Shah','0987654321','Yash@gmail.com'),
('E3','Jay','Patel','0147852369','Jay@123gmail.com');

INSERT INTO Cars VALUES 
('C1','Kia','M1',1000000),
('C2','Creta','M2',1400000),
('C3','Baleno','M3',600000);

INSERT INTO Sales (SalesId, EmpID,CarId, SaleQty) 
VALUES 
(1,'E1','C1',2),
(2,'E2','C2',3),
(3,'E3','C3',1);

SELECT * FROM Sales;

UPDATE Sales SET SaleComission = SaleQty * 5000;