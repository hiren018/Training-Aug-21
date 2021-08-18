/* List Names of Customers who are Depositors and have Same Branch City as that of SUNIL */

SELECT Cname FROM Customer WHERE Cname IN 
(SELECT Cname FROM Deposit WHERE Bname IN 
(SELECT Bname FROM Branch WHERE CITY = 
(SELECT CITY FROM Branch WHERE Bname = 
(SELECT Bname FROM Deposit WHERE Cname = 'SUNIL'))))

/*List All the Depositors Having Deposit in All the Branches where SUNIL is Having Account*/

SELECT Cname FROM Deposit WHERE Bname IN
(SELECT Deposit.Bname FROM Deposit 
JOIN Borrow 
ON Deposit.Bname = Borrow.BNAME 
WHERE Deposit.Cname = 'SUNIL')

/*List the Names of Customers Living in the City where the Maximum Number of Depositors are Located*/

SELECT d.Cname FROM Deposit "d" WHERE d.Cname IN 
(SELECT c.Cname FROM Customer "c" WHERE c.City IN 
(SELECT city FROM 
(SELECT count(Cname) "ranked",City from customer GROUP BY City ORDER BY ranked DESC) LIMIT 1)) 


/*List Names of Borrowers Having Deposit Amount Greater than 1000 and Loan Amount Greater than 2000*/

SELECT b.Cname FROM Borrow "b" WHERE b.Amount > 2000 AND b.Cname IN 
(SELECT d.Cname FROM Deposit "d" WHERE d.Amount > 1000)

/*List All the Customers Living in NAGPUR and Having the Branch City as MUMBAI or DELHI*/

SELECT c.Cname FROM Customer "c" WHERE c.CITY = 'NAGPUR' AND c.Cname IN 
(SELECT d.Cname FROM Deposit "d" WHERE d.Bname IN 
(SELECT b.Bname FROM Branch "b" WHERE b.CITY IN ('MUMBAI','DELHI')))

/*Count the Number of Customers Living in the City where Branch is Located*/

SELECT count(c.Cname) FROM Customer "c" WHERE c.CITY IN (SELECT CITY FROM Branch )
