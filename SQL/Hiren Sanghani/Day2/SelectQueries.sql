SELECT * FROM  Employees;

SELECT FirstName, LastName FROM Employees;

SELECT FirstName AS 'Employee Name' FROM Employees;

SELECT * FROM  Employees WHERE FirstName = 'Steven';

SELECT * FROM  Employees WHERE FirstName IN ('Neena', 'Lex');

SELECT * FROM  Employees WHERE FirstName NOT IN ('Neena', 'Lex');

SELECT * FROM Employees WHERE Salary BETWEEN 5000 AND 8000;

SELECT FirstName,LastName,Salary, Salary*0.15 AS PF FROM Employees;

SELECT * FROM Employees WHERE FirstName like 'N%';

SELECT DISTINCT DepartmentID FROM Employees;

SELECT * FROM Employees ORDER BY FirstName DESC;

SELECT EmployeeID,FirstName,LastName,Salary FROM Employees ORDER BY Salary ASC;

SELECT  Salary FROM Employees LIMIT 2;