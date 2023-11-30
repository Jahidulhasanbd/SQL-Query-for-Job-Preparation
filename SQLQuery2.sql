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
Id INT IDENTITY PRIMARY KEY ,
Position NVARCHAR(50) NOT NULL,
DateofJoining DATE NOT NULL,
Salary INT NOT NULL,
empId int foreign key references EmployeeInfo(EmpId),
);
GO

INSERT INTO EmployeeInfo VALUES
('Jahidul','Hasan','HR','P1','Dhaka(dh)','1-10-2023','M'),
('Roksana','Akter','Admin','P3','Rajshahi(rj)','07-10-2014','F'),
('Masum','Kazi','SR','P2','Khulna(kl)','1-05-2022','M'),
('Rabeya','Akter','Admin','P4','Uttora(UT)','09-11-2018','F'),
('Jesmin','Akter','Account','P5','Bonani(bn)','04-10-2013','F'),
('Tusher','Ahmad','HR','P6','Bashundhra(BS)','05-03-2017','M'),
('Nayeem','Kazi','SR','P7','Gulshan(GL)','11-07-2011','M')

GO

SELECT *FROM EmployeeInfo
GO


 INSERT INTO EmployeePosition VALUES
 ('Manager','11-11-2023',25000,1),
 ('Executive','10-10-2021',20000,2),
 ('Lead','01-04-2012',56000,1),
 ('Manager','08-08-2022',29000,3) 
 GO

 SELECT *FROM EmployeePosition
 GO

--Q1. Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and
--use the ALIAS name as EmpName.

SELECT UPPER(EmpFname) FROM EmployeeInfo 
GO

--Q2. Write a query to fetch the number of employees working in the department ‘HR’.

SELECT count(*)as totalHR FROM EmployeeInfo WHERE Department='account';

--Q3. Write a query to get the current date.

SELECT GETDATE()AS Today;
GO
--//R mysql  a likhte hobe 
--SELECT SYSTDATE();

--Q4. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.

SELECT SUBSTRING(EmpLname,1,4) AS First4 FROM EmployeeInfo
GO

--Q5. Write a query to fetch only the place name(string before brackets) from the
--Address column of EmployeeInfo table.

SELECT SUBSTRING(Address, 1, CHARINDEX('(',Address))AS Address FROM EmployeeInfo
GO

--Q6. Write a query to create a new table which consists of data and structure copied 
--from the other table.
SELECT *INTO NewTable FROM EmployeeInfo 
GO;

SELECT *FROM EmployeeInfo
GO

--Q7. Write q query to find all the employees whose salary is between 20000 to 30000.

SELECT *FROM EmployeePosition WHERE Salary BETWEEN '20000' AND '30000';
GO

--Q8. Write a query to find the EmpFname of EmployeeInfo that begin with ‘R’

SELECT *FROM EmployeeInfo WHERE EmpFname LIKE 'R%'
GO

--Q9. Write a query to fetch top N records.Order By  Salary DESC

SELECT TOP 3  *FROM EmployeePosition ORDER BY Salary DESC
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

--Q13. Write a query to fetch details of employees whose EmpFname ends with an alphabet
--‘A’ and contains five alphabets.

SELECT * FROM EmployeeInfo WHERE EmpFname LIKE '%L';
GO

--Q14. Write a query to fetch details of all employees excluding the employees with first names, 
--“Roksana” and “Jesmin” from the EmployeeInfo table.
SELECT *FROM EmployeeInfo WHERE EmpFname NOT IN ('Roksana','Jesmin');

--Q15. Write a query to fetch details of employees with the address as “Bonani(bn)”.

SELECT *FROM  EmployeeInfo WHERE Address LIKE 'Bonani(bn)';

--Q16. Write a query to fetch all employees who also hold the managerial position.

SELECT e.EmpId,e.EmpFname,p.Position FROM EmployeeInfo E INNER JOIN EmployeePosition P ON E.EmpId=P.EmpId 
WHERE P.Position='Manager';

--Q17. Write a query to fetch the department-wise count of employees sorted by department’s 
--count in ascending order.

SELECT Department, COUNT(EmpId) AS DepartmentCount FROM EmployeeInfo GROUP BY Department 
ORDER BY Department ASC;
GO

--Q18. Write a query to calculate the even  records from a table.

SELECT  'EVEN'AS Type,COUNT(CASE WHEN EmpId % 2=0 THEN 1 END)AS EvenEmp FROM EmployeeInfo
GO;
--Q19. Write a query to calculate the odd  records from a table.

SELECT 'ODD'AS Type,COUNT(CASE WHEN EmpId % 2 <>0 THEN 1 END)AS OddEmp FROM EmployeeInfo

--Q20. Write a SQL query to retrieve employee details from EmployeeInfo 
--table who have a date of joining in the EmployeePosition table.

SELECT *FROM EmployeeInfo E
WHERE EXISTS (SELECT *FROM EmployeePosition P WHERE E.EmpId=P.EmpId);
GO;

--Q21. Write a query to retrieve Maximum salaries from the EmployeePosition table.
SELECT MAX(Salary)AS 'Highest Salary' FROM EmployeePosition 
GO;

--Q22. Write a query to retrieve minimum salaries from the EmployeePosition table.

SELECT MIN(Salary)AS 'Highest Salary' FROM EmployeePosition 
GO;

--Q23. Write a query to retrieve two minimum  salaries from the EmployeePosition table.

SELECT DISTINCT Salary FROM EmployeePosition E1
WHERE 2 >= (SELECT COUNT(DISTINCT Salary) FROM EmployeePosition E2
WHERE E1.Salary>=E2.Salary)ORDER BY E1.Salary DESC

--Q24. Write a query to retrieve two maximum salaries from the EmployeePosition table.
SELECT DISTINCT Salary FROM EmployeePosition E1
WHERE 2>= (SELECT COUNT(DISTINCT Salary) FROM EmployeePosition E2
WHERE E1.Salary<=E2.Salary)ORDER BY Salary DESC
GO;

--Q25. Write a query to retrieve duplicate records from a table.

--SELECT empId, empName, Department, COUNT(*)
--FROM employeeInfo
--GROUP BY empId, empName, Department
--HAVING COUNT(*) > 1;

SELECT EmpId,EmpFname,Department, COUNT(*) FROM EmployeeInfo GROUP BY 
EmpId,EmpFname,Department HAVING COUNT(*)>1;
go

--Q26. Write a query to retrieve the list of employees working in the same department.


--SELECT Department, GROUP_CONCAT(empName) AS EmployeesInDepartment
--FROM employeeInfo
--GROUP BY Department;

--Q27. Write a query to retrieve the last 3 records from the EmployeeInfo table.

SELECT top 3 * FROM employeeInfo ORDER BY empId DESC;

--Q28. Write a query to find the third-highest salary from the EmpPosition table.

select TOP 1 Salary FROM 
(SELECT TOP 3 Salary FROM EmployeePosition ORDER BY salary DESC)
AS EMP ORDER BY Salary ASC;
GO

--Q29. Write a query to retrieve Departments who have less than 2 employees working in it.

SELECT DEPARTMENT, COUNT(EmpID) as 'EmpNo' FROM EmployeeInfo GROUP BY DEPARTMENT 
HAVING COUNT(EmpD) < 2;


---====================-Trigger practice=======================================

--Trigger  hocche special type of procedure ja ki  na  automatically 
--invoked ba fire hoy jokhon kono table ba view ar moddhe action query execute hoy


CREATE TABLE CustomerInfo
(
customerId INT ,
customerName VARCHAR(50)
);
GO
INSERT INTO CustomerInfo VALUES(1,'Jahidul')
INSERT INTO CustomerInfo VALUES(2,'Hasan')
INSERT INTO CustomerInfo VALUES(3,'Hridoy')
go
SELECT *FROM CustomerInfo
go

CREATE TRIGGER TrInsertUpdate
ON CustomerInfo
AFTER UPDATE,DELETE
AS 
BEGIN 
PRINT 'Update or delete not possible here..'
ROLLBACK TRANSACTION
END
GO
DELETE CustomerInfo WHERE customerId=2
UPDATE CustomerInfo SET customerId=4 WHERE customerId=1

CREATE TABLE product 
(
pId INT PRIMARY KEY,
PName VARCHAR(50),
price MONEY,
stock INT DEFAULT 0
)
GO

CREATE TABLE stockIn
(
id INT PRIMARY KEY IDENTITY,
[date] DATETIME DEFAULT GETDATE(),
pId INT REFERENCES product(pId),
quantity INT
)
go

INSERT INTO product VALUES(1,'mouse',345,0)
INSERT INTO product VALUES(2,'Keyboard',785,0)
INSERT INTO product VALUES(3,'SSD',7675,0)
GO

--ex 02
SELECT * FROM product
SELECT * FROM stockIn
GO
CREATE TRIGGER trstockIn
on  stockIn
for INSERT
AS BEGIN 
DECLARE @I INT 
DECLARE @Q INT
SELECT @I=pId,@Q=quantity FROM inserted

UPDATE product
SET stock=stock+@Q
WHERE pId=@I
END
GO
--Test
INSERT INTO stockIn(pId,quantity) VALUES(1,678)

SELECT * FROm stockIn
SELECT * FROM product
GO


