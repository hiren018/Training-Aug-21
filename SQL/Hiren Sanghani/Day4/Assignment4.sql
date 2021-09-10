 
 -- Q1 Write a query to rank employees based on their salary for a month

 SELECT dense_rank()OVER (ORDER by Salary DESC) "D_Rank" , Salary FROM Employees
 
 -- Q2 Select 4th Highest salary from employee table using ranking function

 SELECT D_Rank,Salary FROM
 (SELECT dense_rank()OVER (ORDER by Salary DESC) "D_Rank", Salary FROM Employees)"temp" 
 WHERE D_Rank=4;
 
 -- Q3 Get department, total salary with respect to a department from employee table.

 SELECT DepartmentID, total_salary FROM
 (SELECT DepartmentID, sum(Salary) as total_salary 
 FROM Employees GROUP BY DepartmentID) "tmp"

-- Q4 Get department, total salary with respect to a department from employee table order by total salary descending

 SELECT DepartmentID, total_salary FROM
 (SELECT DepartmentID, sum(Salary) as total_salary 
 FROM Employees GROUP BY DepartmentID) "tmp"
 ORDER BY total_salary DESC
 
 -- Q5 Get department wise maximum salary from employee table order by salary ascending

 SELECT DepartmentID, total_salary FROM
 (SELECT DepartmentID, max(Salary) as total_salary 
 FROM Employees GROUP BY DepartmentID) "tmp"
 ORDER BY total_salary ASC

-- Q6 Get department wise minimum salary from employee table order by salary ascending

 SELECT DepartmentID, total_salary FROM
 (SELECT DepartmentID, min(Salary) as total_salary
 FROM Employees GROUP BY DepartmentID) "tmp" 
 ORDER BY total_salary ASC

-- Q7 Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

 SELECT DepartmentID, total_salary FROM
 (SELECT DepartmentID, sum(Salary) as total_salary
 FROM Employees GROUP BY DepartmentID HAVING total_salary > 50000) "tmp"
 ORDER BY total_salary DESC