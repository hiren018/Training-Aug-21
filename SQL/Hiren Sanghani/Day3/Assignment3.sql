SELECT FirstName, length(FirstName) "length" FROM Employees WHERE 
FirstName like 'A%' OR FirstName like 'J%' OR FirstName like 'M%'
ORDER BY FirstName ASC;

SELECT EmployeeID, FirstName, LastName, HireDate FROM Employees
 WHERE CAST (strftime('%m', HireDate)AS INTEGER) = 7 OR 
CAST (strftime('%d',HireDate) AS INTEGER) == 7;

SELECT FirstName, length(FirstName) "length" FROM Employees WHERE instr(LastName,'c')>2;

SELECT substr(PhoneNumber,-4) FROM Employees;

SELECT replace(PhoneNumber,124,999) AS PhoneNumber FROM Employees;

SELECT ROUND((strftime(date()) - strftime('2000-12-15'))) AS AGE;

SELECT DISTINCT HireDate FROM Employees WHERE 
CAST (strftime('%w',HireDate) AS INTEGER) == 1;

SELECT FirstName, HireDate FROM Employees WHERE
 HireDate BETWEEN '1987-06-01' AND '1987-07-30';

SELECT strftime('%H:%M %d/%m/%Y', 'now') as DateAndTime;

SELECT FirstName, LastName, HireDate FROM Employees WHERE 
CAST (strftime('%m', HireDate)AS INTEGER) = 6;

SELECT FirstName, HireDate , ROUND((strftime(date()) - strftime(HireDate)))
AS Experience FROM Employees;
SELECT FirstName FROM Employees WHERE CAST (strftime('%Y','1987') AS INTEGER);

