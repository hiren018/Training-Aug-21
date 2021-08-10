CREATE TABLE Deparment (
	DeptId	INTEGER NOT NULL,
	DeptName	char(10),
	PRIMARY KEY("DeptId")
);

CREATE TABLE Employees (
	EmpId	INTEGER NOT NULL,
	FirstName	TEXT,
	LastName	TEXT,
	Email	CHAR(20),
	Phone	CHAR(10),
	HireDate	DATE,
	JobId	INTEGER NOT NULL,
	Salary	INTEGER NOT NULL,
	Commision	INTEGER,
	ManagerId	Char(10),
	DeptId	Char(10),
	PRIMARY KEY(EmpId)
    CONSTRAINT fk_jobs FOREIGN KEY (JobId) REFERENCES jobs(JobId),
    CONSTRAINT fk_dept FOREIGN KEY (DepartmentId) REFERENCES Departments(DepartmentId),
)