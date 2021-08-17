SELECT julianday(Incentive_Date) - julianday(Joining_Date) "date_differnce" 
FROM Employee 
JOIN Incentives 
ON Employee_Id = Employee_Ref_Id 

SELECT First_Name ,Incentive_Amount 
FROM Employee 
JOIN Incentives 
ON Employee_Id = Employee_Ref_Id
WHERE Incentive_Amount > 3000

SELECT First_Name ,Incentive_Amount
FROM Employee 
LEFT JOIN Incentives 
ON Employee_Id = Employee_Ref_Id

SELECT emp.First_Name , mgr.First_Name
FROM Employee "emp"
JOIN Employee "mgr"
ON emp.Manager_Id = mgr.Employee_Id

SELECT First_Name , IFNULL(Incentive_Amount,0) 
FROM Employee 
LEFT JOIN Incentives 
ON Employee_Id = Employee_Ref_Id