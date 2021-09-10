CREATE TABLE Employee (
	Employee_Id	INTEGER,
	First_Name	char(20),
	Last_Name	char(20),
	Salary	INTEGER,
	Joining_Date	Date,
	Department	char(20),
	Manager_Id	INTEGER,
	PRIMARY KEY(Employee_Id)
)

CREATE TABLE Incentives (
	Employee_Ref_Id	INTEGER,
	Incentive_Date	date,
	Incentive_Amount	INTEGER,
	PRIMARY KEY(Employee_Ref_Id),
	FOREIGN KEY(Employee_Ref_Id) REFERENCES Employee(Employee_Id)
)

SELECT * FROM Employee

SELECT * FROM Incentives

/* 1. Select employee details from employee table if data exists in incentive table ?*/

SELECT * FROM Employee
WHERE EXISTS
(SELECT Employee_Ref_Id FROM Incentives)


/* 2. Find Salary of the employee whose salary is more than Roy Salary*/

SELECT First_Name , Salary FROM Employee 
WHERE Salary > (SELECT Salary FROM Employee WHERE First_Name = 'Roy')


/*3. Select first_name, incentive amount from employee and incentives table for those employees 
who have incentives and incentive amount greater than 3000*/

select (select first_name from Employee where Employee.Employee_Id = Incentives.Employee_Ref_Id) "First_Name",Incentive_Amount
from Incentives where Incentive_Amount > 3000


/*4. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.*/

select First_Name , (select incentive_amount from incentives Where Employee.Employee_Id = Incentives.Employee_Ref_Id) "Incentive_amount"
FROM Employee


/*5. Select EmployeeName, ManagerName from the employee table.*/

select * from 
(Select e.first_name "Employee_name",(select m.First_Name from Employee "m" where m.Employee_Id = e.Manager_Id)"Manager_name"
from Employee "e" )tmp
where Manager_name IS NOT NULL


/* 6. Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives 
and set incentive amount as 0 for those employees who didn’t get incentives.*/

select First_Name , ISNULL(Incentive_amount,0) FROM
(
select First_Name , (select incentive_amount from incentives Where Employee.Employee_Id = Incentives.Employee_Ref_Id) "Incentive_amount"
FROM Employee 
)tmp
