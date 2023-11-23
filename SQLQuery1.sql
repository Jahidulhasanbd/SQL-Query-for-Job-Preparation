use Northwind
GO

Select *from EmployeeS
GO

--Q1write a query to fetch the number of employees working in the London city ???

SELECT EmployeeID,FirstName,City FROM Employees WHERE City='London';

--Q2. Write a query to fetch the FirstName from the Employees table in 
--upper case and use the ALIAS name as EmployeeName.

SELECT	UPPER(FirstName)AS EmployeeName FROM Employees 

--Q3. Write a query to get the current date.

SELECT GETDATE();

-- r MySQL A Likhte hobe
--SELECT SYSTDATE();

--Q4. Write a query to retrieve the first four characters of LastName from the Employees table.
SELECT SUBSTRING(LastName ,1,4) FROM Employees

--Q5. Write q query to find all the employees 'Extension'is between 2300 to 3400.

SELECT *FROM Employees WHERE Extension BETWEEN '2300'AND'3400';

--Q6. Write a query to find the FirstName of employees that begin with ‘S’

SELECT *FROM Employees WHERE FirstName LIKE 'S%';

--Q7. Write a query to fetch details of employees whose FirstName ends
--with an alphabet ‘A’ and contains five alphabets.

SELECT *FROM Employees WHERE FirstName LIKE '%a';

--Q8. Write a query to fetch details of employees whose FirstName have
--with an alphabet ‘A’ and contains five alphabets.

SELECT *FROM Employees WHERE FirstName LIKE '%a%';

SELECT *FROM Employees
GO

--Q9. Write a query to fetch top 10 records where PostalCode .
SELECT TOP 5 EmployeeID, FirstName,PostalCode FROM Employees ORDER BY PostalCode DESC;

--Q10. Write a query to retrieve the LastName and firstName in a single column as “FullName”. 
--The first name and the last name must be separated with space.

SELECT CONCAT(FirstName,' ',LastName) AS 'FullName' FROM Employees

--Q11. Write a query find number of employees whose HireDate is between 01/01/1992 to 01/12/1993 and 
--are grouped according to TitleOfCourtesy

SELECT TitleOfCourtesy FROM Employees WHERE HireDate BETWEEN 
'01-01-1992'AND '01-12-1993' GROUP BY TitleOfCourtesy;

--Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by 
--firstName in descending order and City in the ascending order.

SELECT FirstName,City FROM Employees ORDER BY FirstName DESC , City ASC ;

--Q13. Write a query to fetch details of all employees excluding the employees with lastName,
--“Davolio” and “peacock” from the EmployeeInfo table.
SELECT *FROM Employees WHERE LastName NOT IN ('Davolio','Peacock');

--Q14. Write a query to fetch details of employees with the City as “Tacoma(Tac)”.

SELECT *FROM Employees WHERE City like 'Tac%';
GO

SELECT *FROM Employees
GO
SELECT *FROM Orders
GO
SELECT *FROM Products
GO

--Q15. Write a query to fetch all employees who also hold the 'WA' position in Region.

