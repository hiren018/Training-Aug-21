/*1. Write a query to find the names (first_name, last_name) and salaries of the employees who have higher salary than the employee whose last_name='Bull'.*/ 
SELECT FirstName || LastName "Name", Salary FROM Employees WHERE Salary > 
(SELECT Salary FROM Employees WHERE LastName = 'Bull')


/*2. Find the names (first_name, last_name) of all employees who works in the IT department. */
SELECT FirstName || LastName "Name" , DepartmentID FROM Employees WHERE DepartmentID  IN 
(SELECT DepartmentID FROM Departments WHERE DepartmentName like '%IT%') 


/*3. Find the names (first_name, last_name) of the employees who have a manager who works for a department based in United States. */
 SELECT FirstName || LastName "Name"  FROM Employees WHERE ManagerId IN 
(SELECT ManagerId FROM Departments WHERE LocationID IN
(SELECT LocationID FROM Locations WHERE CountryId = 'US'))


/*4. Find the names (first_name, last_name) of the employees who are managers. */
SELECT FirstName || LastName "Name"  FROM Employees WHERE EmployeeID IN (SELECT ManagerId FROM Employees)


/*5. Find the names (first_name, last_name), salary of the employees whose salary is greater than the average salary. */
SELECT FirstName || LastName "Name" ,Salary  FROM Employees WHERE Salary > (SELECT avg(Salary) FROM Employees)


/*6. Find the names (first_name, last_name), salary of the employees whose salary is equal to the minimum salary for their job grade. */
SELECT FirstName || LastName "Name",Jobid, Salary FROM Employees as e WHERE Salary = (SELECT min(Salary) FROM Employees WHERE e.Jobid = Jobid )


/*7. Find the names (first_name, last_name), salary of the employees who earn more than the average salary and who works in any of the IT departments.*/
SELECT FirstName || LastName "Name" ,Salary  FROM Employees WHERE Salary > 
(SELECT avg(Salary) FROM Employees) AND Jobid = 'IT_PROG'
 
 
/*8. Find the names (first_name, last_name), salary of the employees who earn more than Mr. Bell. */
 SELECT FirstName || LastName "Name" ,Salary  FROM Employees WHERE Salary > (
 SELECT Salary FROM Employees WHERE LastName = 'Bell')
 
 
 /*9. Find the names (first_name, last_name), salary of the employees who earn the same salary as the minimum salary for all departments. */
 SELECT FirstName || LastName "Name" ,Salary ,DepartmentID FROM Employees WHERE Salary = 
 (SELECT min(Salary) FROM Employees) 
 
 
 /*10. Find the names (first_name, last_name), salary of the employees whose salary greater than average salary of all department. */
  SELECT FirstName || LastName "Name" ,Salary  FROM Employees WHERE Salary > 
  (SELECT avg(Salary) FROM Employees GROUP BY DepartmentID)
  
  
 /*11.  Write a query to find the names (first_name, last_name) and salary of the employees who earn a salary that is higher than the salary of all the Shipping Clerk (JOB_ID = 'SH_CLERK'). Sort the results on salary from the lowest to highest.*/
  SELECT FirstName || LastName "Name" ,Salary  FROM Employees WHERE Salary > 
  (SELECT max(Salary) FROM Employees WHERE Jobid = 'SH_CLERK') ORDER BY Salary ASC
  
  
/*12. Write a query to find the names (first_name, last_name) of the employees who are not supervisors. */
SELECT FirstName || LastName "Name" FROM Employees 


/*13. Write a query to display the employee ID, first name, last names, and department names of all employees.*/
SELECT EmployeeID , FirstName, LastName,
(SELECT DepartmentName FROM Departments WHERE Employees.DepartmentID = Departments.DepartmentID) "DepartmentName" 
FROM Employees 

SELECT * FROM Employees

/*14. Write a query to display the employee ID, first name, last names, salary of all employees whose salary is above average for their departments.?? */
SELECT EmployeeID,FirstName,LastName,Salary ,DepartmentID FROM Employees as e WHERE Salary >
(SELECT avg(Salary) FROM Employees WHERE DepartmentID = e.DepartmentID) 


/* 15. Write a query to fetch even numbered records from employees table. */
SELECT * FROM(SELECT row_number() OVER (ORDER BY EmployeeID)"ranked", * FROM Employees) WHERE ranked % 2 = 0


/*16. Write a query to find the 5th maximum salary in the employees table.*/
SELECT Rank_Salary,Salary FROM 
(SELECT dense_rank() OVER (ORDER BY Salary DESC) "Rank_Salary", Salary FROM Employees) 
WHERE Rank_Salary = 5


/*17. Write a query to find the 4th minimum salary in the employees table. */
SELECT DISTINCT Rank_Salary,Salary FROM 
(SELECT dense_rank() OVER (ORDER BY Salary ASC) "Rank_Salary", Salary FROM Employees) 
WHERE Rank_Salary = 4


/*18. Write a query to select last 10 records from a table. */
SELECT * FROM (SELECT * FROM Employees ORDER BY EmployeeID DESC LIMIT 10) ORDER BY EmployeeID ASC


/*19. Write a query to list department number, name for all the departments in which there are no employees in the department. */
SELECT DepartmentID,DepartmentName FROM Departments WHERE DepartmentID NOT IN (SELECT DepartmentID FROM Employees)


/*20. Write a query to get 3 maximum salaries. */
SELECT DISTINCT ranked, Salary FROM 
(SELECT dense_rank() OVER (ORDER BY Salary DESC) "ranked",Salary FROM Employees) WHERE ranked <= 3


/*21. Write a query to get 3 minimum salaries. */
SELECT DISTINCT ranked, Salary FROM 
(SELECT dense_rank() OVER (ORDER BY Salary ASC) "ranked",Salary FROM Employees) WHERE ranked <= 3


/*22. Write a query to get nth max salaries of employees. */

