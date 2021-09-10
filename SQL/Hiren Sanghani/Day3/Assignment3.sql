
--Write a query that displays the FirstName and the length of the FirstName for all employees whose name starts with the letters 
--‘A’, ‘J’ or ‘M’. Give each column an appropriate label. Sort the results by the employees’ FirstName

SELECT FirstName, length(FirstName) "length" FROM Employees WHERE 
FirstName like 'A%' OR FirstName like 'J%' OR FirstName like 'M%'
ORDER BY FirstName ASC;

-- Q2 Write a query to display the FirstName and Salary for all employees. Format the salary to be 10 characters long, left-padded with the $ symbol. Label the column SALARY.
--(Done with SSMS)
SELECT FirstName , SALARY = REPLICATE('$', 10-LEN(Salary))+CAST(Salary AS varchar(10)) FROM dbo.Employees

-- Q3 Write a query to display the employees with their code, first name, last name and hire date who hired either on seventh day of any month or seventh month in any year.

SELECT EmployeeID, FirstName, LastName, HireDate FROM Employees
 WHERE CAST (strftime('%m', HireDate)AS INTEGER) = 7 OR 
CAST (strftime('%d',HireDate) AS INTEGER) == 7;

-- Q4 Write a query to display the length of first name for employees where last name contains character ‘c’ after 2nd position.

SELECT FirstName, length(FirstName) "length" FROM Employees WHERE instr(LastName,'c')>2;

-- Q5 Write a query to extract the last 4 character of PhoneNumber.

SELECT substr(PhoneNumber,-4) FROM Employees;

-- Q6 Write a query to update the portion of the PhoneNumber in the employees table, within the phone number the substring ‘124’ will be replaced by ‘999’.

SELECT replace(PhoneNumber,124,999) AS PhoneNumber FROM Employees;

-- Q7 Write a query to calculate the age in year.

SELECT ROUND((strftime(date()) - strftime('2000-12-15'))) AS AGE;

-- Q8 Write a query to get the distinct Mondays from HireDate in employees tables.

SELECT DISTINCT HireDate FROM Employees WHERE 
CAST (strftime('%w',HireDate) AS INTEGER) == 1;

-- Q9 Write a query to get the FirstName and HireDate from Employees table where HireDate between ‘1987-06-01’ and ‘1987-07-30’

SELECT FirstName, HireDate FROM Employees WHERE
 HireDate BETWEEN '1987-06-01' AND '1987-07-30';

-- Q10 Write a query to display the current date in the following format.
-- Sample output : 12:00 AM Sep 5, 2014

SELECT strftime('%H:%M %d/%m/%Y', 'now') as DateAndTime;

-- Q11 Write a query to get the FirstName, LastName who joined in the month of June.

SELECT FirstName, LastName, HireDate FROM Employees WHERE 
CAST (strftime('%m', HireDate)AS INTEGER) = 6;

-- Q12 Write a query to get first name, hire date and experience of the employees

SELECT FirstName, HireDate , ROUND((strftime(date()) - strftime(HireDate)))
AS Experience FROM Employees;
SELECT FirstName FROM Employees WHERE CAST (strftime('%Y','1987') AS INTEGER);

-- Q13 Write a query to get first name of employees who joined in 1987.(Done with SSMS)

SELECT FirstName FROM dbo.Employees WHERE YEAR(HireDate) = 1987
