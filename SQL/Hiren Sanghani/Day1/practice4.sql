CREATE TABLE Deparment (
	DeptId	char(10) NOT NULL,
	DeptName char(10),
	PRIMARY KEY(DeptId)
);

CREATE TABLE Employees (
	EmpId	INT NOT NULL,
	FirstName TEXT,
	LastName TEXT,
	Email	CHAR(20),
	Phone	CHAR(10),
	HireDate DATE,
	JobId	INT NOT NULL,
	Salary	INT NOT NULL,
	Commision INT,
	ManagerId Char(10),
	DeptId	Char(10),
	PRIMARY KEY(EmpId)
        CONSTRAINT fk_jobs FOREIGN KEY (JobId) REFERENCES jobs(JobId),
        CONSTRAINT fk_dept FOREIGN KEY (DeptId) REFERENCES Department(DeptId),
)
