CREATE DATABASE  JobPreparation
GO

USE JobPreparation
GO

CREATE TABLE EmployeeInfo
(
EmpId INT PRIMARY KEY  IDENTITY,
EmpFname NVARCHAR(50) NOT NULL,
EmpLname NVARCHAR(50)NOT NULL,
Department NVARCHAR(50)NOT NULL,
Project NVARCHAR(50)NOT NULL,
Address NVARCHAR(60)NOT NULL,
DOB DATE NOT NULL,
Gernder CHAR NOT NULL
);
GO

CREATE TABLE EmployeePosition
(
EmpId INT IDENTITY PRIMARY KEY ,
Position NVARCHAR(50) NOT NULL,
DateofJoining DATE NOT NULL,
Salary INT NOT NULL
);
GO

INSERT INTO EmployeeInfo VALUES
('Jahidul','Hasan','HR','P1','Dhaka(dh)','1-10-2023','M'),
('Roksana','Akter','Admin','P3','Rajshahi(rj)','07-10-2014','F'),
('Masum','Kazi','SR','P2','Khulna(kl)','1-05-2022','M'),
('Rabeya','Akter','Admin','P4','Uttora(UT)','09-11-2018','F'),
('Jesmin','Akter','Account','P5','Bonani(bn)','04-10-2013','F'),
('Tusher','Ahmad','HR','P6','Bashundhra(BS)','05-03-2017','M')
GO

SELECT *FROM EmployeeInfo
GO
 
 INSERT INTO EmployeePosition VALUES
 ('Manager','11-11-2023',25000),
 ('Executive','10-10-2021',20000),
 ('Lead','01-04-2012',56000),
 ('Manager','08-08-2022',29000) 
 GO

 SELECT *FROM EmployeePosition
 GO

--Q1. Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and
--use the ALIAS name as EmpName.

SELECT UPPER(EmpFname) FROM EmployeeInfo 
GO

--Q2. Write a query to fetch the number of employees working in the department ‘HR’.

SELECT *FROM EmployeeInfo WHERE Department='HR';

--Q3. Write a query to get the current date.

SELECT GETDATE();
GO

--//R mysql  a likhte hobe 
--SELECT SYSTDATE();

--Q4. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.

SELECT SUBSTRING(EmpLname,1,4) AS FullName FROM EmployeeInfo
GO

--Q5. Write a query to fetch only the place name(string before brackets) from the
--Address column of EmployeeInfo table.

SELECT SUBSTRING(Address, 1, CHARINDEX('(',Address))AS Address FROM EmployeeInfo
GO

--Q6. Write a query to create a new table which consists of data and structure copied 
--from the other table.
SELECT *INTO NewTable FROM EmployeeInfo ;
GO

SELECT *FROM EmployeeInfo
GO

--Q7. Write q query to find all the employees whose salary is between 20000 to 30000.

SELECT *FROM EmployeePosition WHERE Salary BETWEEN '20000' AND '30000';
GO

--Q8. Write a query to find the EmpFname of EmployeeInfo that begin with ‘R’

SELECT *FROM EmployeeInfo WHERE EmpFname LIKE 'R%'
GO

--Q9. Write a query to fetch top N records.Order By  Salary DESC

SELECT TOP 3  *FROM EmployeePosition ORDER BY Salary ASC
GO

--Q10. Write a query to retrieve the EmpFname and EmpLname in a single column 
--as “FullName”. The first name and the last name must be separated with space.

SELECT CONCAT (EmpFname,' ',EmpLname)AS FullName FROM EmployeeInfo 

--Q11. Write a query find number of employees whose DOB is between 02/05/2012 to 31/12/2021 
--and are grouped according to gender

SELECT *FROM EmployeeInfo WHERE DOB BETWEEN '02/05/2012'AND'10/12/2021'
GO

--Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by 
--EmpLname in descending order and Department in the ascending order.

SELECT *fROM EmployeeInfo ORDER BY EmpLname DESC,Department ASC 
GO

--Q13. Write a query to fetch details of employees whose EmpLname ends with an alphabet
--‘A’ and contains five alphabets.

SELECT *FROM EmployeeInfo WHERE EmpFname LIKE '%L';
GO

--Q14. Write a query to fetch details of all employees excluding the employees with first names, 
--“Roksana” and “Jesmin” from the EmployeeInfo table.
SELECT *FROM EmployeeInfo WHERE EmpFname NOT IN ('Roksana','Jesmin');

--Q15. Write a query to fetch details of employees with the address as “Bonani(bn)”.

SELECT *FROM  EmployeeInfo WHERE Address LIKE 'Bonani(bn)';