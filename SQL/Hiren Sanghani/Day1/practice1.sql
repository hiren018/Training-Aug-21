USE Database1;

CREATE TABLE Countries
(
CountryId int not null PRIMARY KEY,
CountryName char(10) not null CONSTRAINT cName CHECK(CountryName IN ('Italy','India','China')),
RegionId char(02) not null CONSTRAINT,
);

INSERT INTO countries (CountryName,RegionId) 
VALUES ('Italy','R1');