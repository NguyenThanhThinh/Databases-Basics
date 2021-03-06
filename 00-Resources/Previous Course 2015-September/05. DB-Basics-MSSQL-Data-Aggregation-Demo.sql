---- SQL Server
---- Data Aggregation
SELECT e.DepartmentID, AVG(e.Salary) AS 'AvgSalary'
  FROM [SoftUni].[dbo].[Employees] AS e
 GROUP BY e.DepartmentID
 ORDER BY e.DepartmentID

SELECT TOP 5 e.DepartmentID, SUM(e.Salary) AS TotalSalary
  FROM [dbo].[Employees] AS e
 GROUP BY e.DepartmentID
 ORDER BY TotalSalary DESC

SELECT e.* 
  FROM [dbo].[Employees] AS e
  JOIN 
	  (SELECT e.DepartmentID, MAX(e.Salary) AS MaxSalary
		 FROM [dbo].[Employees] AS e
		GROUP BY e.DepartmentID) AS MaxSalaries
	ON e.DepartmentID = MaxSalaries.DepartmentID
   AND e.Salary = MaxSalaries.MaxSalary

CREATE VIEW v_SomeView AS
SELECT m.Studio, m.Year, 
       SUM(m.DomesticProfit) AS TotalDomesticProfit
  FROM [BoxOffice].[dbo].[Movies] AS m
 GROUP BY m.Studio, m.Year
 ORDER BY SUM(m.DomesticProfit) -- Order by doesn't work
 
SELECT *
  FROM [BoxOffice].[dbo].[Movies] AS m
 WHERE [Rank] <= 5

 CREATE TABLE SmallDatesDemo(
 ID INT,
 FirstDate SMALLDATETIME,
 SecondDate SMALLDATETIME
 )

 INSERT INTO SmallDatesDemo(ID, FirstDate, SecondDate)
 VALUES (1, '2016-01-01 20:00:00', '2016-01-01 18:00:00')

 SELECT * FROM SmallDatesDemo
  WHERE FirstDate < SecondDate

USE SoftUni
GO

SELECT e.DepartmentID, SUM(e.Salary) AS TotalSalary
  FROM [dbo].[Employees] AS e
 WHERE e.HireDate > '2003-01-01'
 GROUP BY e.DepartmentID
HAVING SUM(e.Salary) < 150000