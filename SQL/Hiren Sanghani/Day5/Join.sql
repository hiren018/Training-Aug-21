
-- Q1 Get difference between JOINING_DATE and INCENTIVE_DATE from employee and incentives table

SELECT julianday(Incentive_Date) - julianday(Joining_Date) "date_differnce" 
FROM Employee 
JOIN Incentives 
ON Employee_Id = Employee_Ref_Id 

-- Q2 Select first_name, incentive amount from employee and incentives table for those employees who have incentives and incentive amount greater than 3000

SELECT First_Name ,Incentive_Amount 
FROM Employee 
JOIN Incentives 
ON Employee_Id = Employee_Ref_Id
WHERE Incentive_Amount > 3000

-- Q3 Select first_name, incentive amount from employee and incentives table for all employees even if they didn’t get incentives.

SELECT First_Name ,Incentive_Amount
FROM Employee 
LEFT JOIN Incentives 
ON Employee_Id = Employee_Ref_Id


/--Q4 Select first_name, incentive amount from employee and incentives table for all employees even 
--if they didn’t get incentives and set incentive amount as 0 for those employees who didn’t get incentives. 

SELECT emp.First_Name , mgr.First_Name
FROM Employee "emp"
JOIN Employee "mgr"
ON emp.Manager_Id = mgr.Employee_Id

-- Q5 Select EmployeeName, ManagerName from the employee table.

SELECT First_Name , IFNULL(Incentive_Amount,0) 
FROM Employee 
LEFT JOIN Incentives 
ON Employee_Id = Employee_Ref_Id