CREATE TABLE JobHistory
(
EmployeeId int not null PRIMARY KEY,
StartDate date not null,
End_Date date CONSTRAINT cheackDate CHECK (End_Date LIKE '--/--/----'),
Job_Id varchar(10) not null,
Department_Id varchar(8) not null,
);


INSERT INTO JobHistory (StartDate,End_Date,Job_Id,Department_Id) 
VALUES ('05/12/2004','08/10/2015','Android','Dep1');