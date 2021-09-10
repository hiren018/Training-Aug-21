SELECT * FROM Employees

/*Day4 task with CTE*/
 
 -- Q1 Write a query to rank employees based on their salary for a month

 WITH emp_cte (D_Rank, Salary) AS
 (SELECT dense_rank()OVER (ORDER by Salary DESC) "D_Rank" , Salary FROM Employees)
 SELECT * FROM emp_cte
 
 -- Q2 Select 4th Highest salary from employee table using ranking function

 WITH emp_cte (D_Rank,Salary) AS
 (SELECT dense_rank() OVER (ORDER BY Salary DESC) "D_Rank",Salary FROM Employees )
 SELECT * FROM emp_cte WHERE D_Rank = 4
 
 -- Q3 Get department, total salary with respect to a department from employee table.

 WITH emp_cte (DepartmentID,Total_salary) AS
 (SELECT DepartmentID , sum(Salary) "Total_salary" FROM Employees GROUP BY DepartmentID )
  SELECT * FROM emp_cte ORDER BY  Total_salary ASC
  
  -- Q4 Get department, total salary with respect to a department from employee table order by total salary descending

   WITH emp_cte (DepartmentID,Total_salary) AS
 (SELECT DepartmentID , sum(Salary) "Total_salary" FROM Employees GROUP BY DepartmentID )
  SELECT * FROM emp_cte ORDER BY  Total_salary DESC
  
  -- Q5 Get department wise maximum salary from employee table order by salary ascending

  WITH emp_cte (DepartmentID,Max_salary) AS
 (SELECT DepartmentID , MAX(Salary) "Max_salary" FROM Employees GROUP BY DepartmentID )
  SELECT * FROM emp_cte ORDER BY Max_salary ASC
  
  -- Q6 Get department wise minimum salary from employee table order by salary ascending

   WITH emp_cte (DepartmentID,Min_salary) AS
 (SELECT DepartmentID , MAX(Salary) "Min_salary" FROM Employees GROUP BY DepartmentID )
  SELECT * FROM emp_cte ORDER BY Min_salary ASC
  
  -- Q7 Select department, total salary with respect to a department from employee table where total salary greater than 50000 order by TotalSalary descending

   WITH emp_cte (DepartmentID,Total_salary) AS
 (SELECT DepartmentID , sum(Salary) "Total_salary" FROM Employees GROUP BY DepartmentID )
  SELECT * FROM emp_cte WHERE Total_salary > 50000 ORDER BY  Total_salary DESC 


  /*Day5 Task with CTE*/
  
   -- Q1 Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

WITH emptmp(Incentive_Date,Joining_Date) AS
 (SELECT Incentive_Date,Joining_Date
 FROM Employee 
 JOIN Incentives 
 ON Employee_Id = Employee_Ref_Id )
 SELECT julianday(Incentive_Date) - julianday(Joining_Date) "date_differnce"  FROM emptmp
  
  -- Q2 Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

WITH emptmp(First_Name,Incentive_Amount) AS
(SELECT First_Name,Incentive_Amount
FROM Employee 
JOIN Incentives 
ON Employee_Id = Employee_Ref_Id )
SELECT * FROM emptmp WHERE Incentive_Amount > 3000

-- Q3 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

WITH emptmp(First_Name,Incentive_Amount) AS
(SELECT First_Name,Incentive_Amount
FROM Employee 
LEFT JOIN Incentives 
ON Employee_Id = Employee_Ref_Id )
SELECT * FROM emptmp 

-- Q4 Select EmployeeName, ManagerName from the employee table.

WITH emptmp(Employee_Name,Manager_Name) AS
(SELECT E.First_Name,M.First_Name
FROM Employee "E"
JOIN Employee "M"
ON E.Manager_Id = M.Employee_Id)
SELECT * FROM emptmp 

-- Q5 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives.

WITH emptmp(First_Name,Incentive_Amount) AS
(SELECT First_Name, IFNULL(Incentive_Amount,0) 
FROM Employee 
LEFT JOIN Incentives 
ON Employee_Id = Employee_Ref_Id )
SELECT * FROM emptmp 