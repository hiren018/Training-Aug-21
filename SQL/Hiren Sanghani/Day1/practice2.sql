CREATE TABLE JobHistory
(
EmployeeId int not null PRIMARY KEY,
StartDate date not null,
End_Date char CONSTRAINT cheackDate CHECK (End_Date LIKE '__/__/____'),
Job_Id char(10) not null,
Department_Id char(8) not null,
);


INSERT INTO JobHistory (EmployeeId,StartDate,End_Date,Job_Id,Department_Id) 
VALUES (1,'05/12/2004','08/10/2015','Android','Dep1');
