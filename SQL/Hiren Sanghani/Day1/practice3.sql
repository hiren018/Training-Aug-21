CREATE TABLE Jobs
(
JobId int not null PRIMARY KEY,
JobTitle char(20) not null DEFAULT ' ',
MinSalary Numeric(10) DEFAULT 8000,
MaxSalary Numeric(10) DEFAULT null,
)

INSERT INTO (JobId)
VALUES(01);
