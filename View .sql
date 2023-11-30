use  Northwind
go

--try to learn view in SQL

--What is view and why we use this ????

--view hocche virtual table result ja ki na set of stored query result....

--===========Advantage==========

--view ar akta important  advantage holo jodi kono akta table a access korte na pari tobe chaile 
--oi table ar akta virtual table create kore proyojonio query chalate  pari

--===================Importancy============
--akta view hubhu akta table ar data neye create hote pare...
--abar chaile multiple table theke data neye akta view create korte pare 
--view ar data tokhonee change hoye jete pare jokhon main table gulate data change hoye jabe ...
--mane main table theke jey datagula view table a ase oi datagula jodi change hoye jay tahole 
--view table a thekew o data change hoye jabe

SELECT *FROM Orders
GO

SELECT *FROM  [Order Details]
GO

SELECT *FROM Products
GO

--Create a  view by sql query
CREATE VIEW AmarFirstView AS
SELECT P.ProductID,P.ProductName,O.OrderID,O.OrderDate,(OD.Quantity*OD.UnitPrice)AS TotalAmount 
FROM Products AS P 
LEFT JOIN Orders AS O ON O.OrderID=P.ProductID
LEFT JOIN [Order Details] AS OD ON OD.OrderID=O.OrderID
GO

SELECT *FROM AmarFirstView
GO