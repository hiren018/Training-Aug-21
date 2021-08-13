 SELECT dense_rank()OVER (ORDER by Salary DESC) "D_Rank" , Salary FROM Employees
 
 SELECT D_Rank,Salary FROM
 (SELECT dense_rank()OVER (ORDER by Salary DESC) "D_Rank", Salary FROM Employees)"temp" 
 WHERE D_Rank=4;
 
 SELECT DepartmentID, total_salary FROM
 (SELECT DepartmentID, sum(Salary) as total_salary 
 FROM Employees GROUP BY DepartmentID) "tmp"

 SELECT DepartmentID, total_salary FROM
 (SELECT DepartmentID, sum(Salary) as total_salary 
 FROM Employees GROUP BY DepartmentID) "tmp"
 ORDER BY total_salary DESC
 
 SELECT DepartmentID, total_salary FROM
 (SELECT DepartmentID, max(Salary) as total_salary 
 FROM Employees GROUP BY DepartmentID) "tmp"
 ORDER BY total_salary ASC

 SELECT DepartmentID, total_salary FROM
 (SELECT DepartmentID, min(Salary) as total_salary
 FROM Employees GROUP BY DepartmentID) "tmp" 
 ORDER BY total_salary ASC

 SELECT DepartmentID, total_salary FROM
 (SELECT DepartmentID, sum(Salary) as total_salary
 FROM Employees GROUP BY DepartmentID HAVING total_salary > 50000) "tmp"
 ORDER BY total_salary DESC