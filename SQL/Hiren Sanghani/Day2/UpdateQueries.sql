SELECT * FROM  Employees;

SELECT * FROM Departments;

SELECT * FROM Locations;

SELECT * FROM Countries;

SELECT * FROM JobHistory;

UPDATE Employees SET Email='not available';

UPDATE Employees SET Email='not available', CommissionPct = 0.10;

UPDATE Employees SET Email='not available', CommissionPct = 0.10 WHERE DepartmentID = 110;

UPDATE Employees SET Email='not available' WHERE DepartmentID = 80 AND CommissionPct < 0.20;

UPDATE Employees SET Email='not available' WHERE DepartmentID = (
SELECT DepartmentID FROM Departments WHERE DepartmentName = 'Accounting');

UPDATE Employees SET Salary = 8000 WHERE EmployeeID = 105 AND Salary < 5000;

UPDATE JobHistory SET Jobid = 'SH_CLERK' Where EmployeeID = 118 AND DepartmentID = 30 AND Jobid NOT like  'SH%';

UPDATE Employees 
SET Salary = CASE DepartmentID
                 WHEN 40 THEN Salary+(Salary*.25) 
                 WHEN 90 THEN Salary+(Salary*.15)
                 WHEN 110 THEN Salary+(Salary*.10)
                 ELSE Salary
             END;