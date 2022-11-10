--------------------------ДОМАШКА----------------------------

----------------------ЗАДАНИЕ №1-----------------------------
--Вывести всю информацию из таблицы Sales.Customer 
-------------------------------------------------------------
SELECT * FROM Sales.Customer

GO

----------------------ЗАДАНИЕ №2-----------------------------
--Вывести всю информацию из таблицы Sales.Store отсортированную 
--по Name в алфавитном порядке
-------------------------------------------------------------
SELECT * FROM Sales.Store
ORDER BY Name ASC

GO

----------------------ЗАДАНИЕ №3-----------------------------
--Вывести из таблицы HumanResources.Employee всю информацию
--о десяти сотрудниках, которые родились позже 1989-09-28
-------------------------------------------------------------
SELECT TOP(10) * FROM HumanResources.Employee
WHERE BirthDate > '1989-09-28'

GO

----------------------ЗАДАНИЕ №4-----------------------------
--Вывести из таблицы HumanResources.Employee сотрудников
--у которых последний символ LoginID является 0.
--Вывести только NationalIDNumber, LoginID, JobTitle.
--Данные должны быть отсортированы по JobTitle по убиванию
-------------------------------------------------------------
SELECT NationalIDNumber, LoginID, JobTitle
FROM HumanResources.Employee
WHERE LoginID LIKE '%0'
ORDER BY JobTitle ASC

GO

----------------------ЗАДАНИЕ №5-----------------------------
--Вывести из таблицы Person.Person всю информацию о записях, которые были 
--обновлены в 2008 году (ModifiedDate) и MiddleName содержит
--значение и Title не содержит значение 
-------------------------------------------------------------
SELECT * FROM Person.Person
WHERE ModifiedDate > '2008' and 
MiddleName IS NOT NULL and Title IS NULL

GO

----------------------ЗАДАНИЕ №6-----------------------------
--Вывести название отдела (HumanResources.Department.Name) БЕЗ повторений
--в которых есть сотрудники
--Использовать таблицы HumanResources.EmployeeDepartmentHistory и HumanResources.Department
-------------------------------------------------------------
SELECT DISTINCT d.Name
FROM HumanResources.Department d
INNER JOIN HumanResources.EmployeeDepartmentHistory e
ON d.DepartmentID = e.DepartmentID

GO

----------------------ЗАДАНИЕ №7-----------------------------
--Сгрупировать данные из таблицы Sales.SalesPerson по TerritoryID
--и вывести сумму CommissionPct, если она больше 0
-------------------------------------------------------------
SELECT s.TerritoryID, COUNT(s.TerritoryID) 'Count'
FROM Sales.SalesPerson s
WHERE s.TerritoryID > 0
GROUP BY s.TerritoryID

GO

----------------------ЗАДАНИЕ №8-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют самое большое кол-во 
--отпуска (HumanResources.Employee.VacationHours)
-------------------------------------------------------------
SELECT *
FROM HumanResources.Employee e
WHERE e.VacationHours = 
(
SELECT Max(e.VacationHours)
FROM HumanResources.Employee
)

GO

----------------------ЗАДАНИЕ №9-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) 
--которые имеют позицию (HumanResources.Employee.JobTitle)
--'Sales Representative' или 'Network Administrator' или 'Network Manager'
-------------------------------------------------------------
SELECT * FROM HumanResources.Employee e
WHERE e.JobTitle = 'Sales Representative' or
e.JobTitle = 'Network Administrator' or 
e.JobTitle = 'Network Manager'

GO

----------------------ЗАДАНИЕ №10-----------------------------
--Вывести всю информацию о сотрудниках (HumanResources.Employee) и 
--их заказах (Purchasing.PurchaseOrderHeader). ЕСЛИ У СОТРУДНИКА НЕТ
--ЗАКАЗОВ ОН ДОЛЖЕН БЫТЬ ВЫВЕДЕН ТОЖЕ!!!
-------------------------------------------------------------
SELECT * FROM HumanResources.Employee e
FULL JOIN Purchasing.PurchaseOrderHeader p
ON e.BusinessEntityID = p.EmployeeID

GO

