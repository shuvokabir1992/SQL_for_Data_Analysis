Create Table Employees
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10),
    Salary int,
    Country nvarchar(10)
);
Go

Insert Into Employees Values (1, 'Mark', 'Male', 5000, 'USA')
Insert Into Employees Values (2, 'John', 'Male', 4500, 'India')
Insert Into Employees Values (3, 'Pam', 'Female', 5500, 'USA')
Insert Into Employees Values (4, 'Sara', 'Female', 4000, 'India')
Insert Into Employees Values (5, 'Todd', 'Male', 3500, 'India')
Insert Into Employees Values (6, 'Mary', 'Female', 5000, 'UK')
Insert Into Employees Values (7, 'Ben', 'Male', 6500, 'UK')
Insert Into Employees Values (8, 'Elizabeth', 'Female', 7000, 'USA')
Insert Into Employees Values (9, 'Tom', 'Male', 5500, 'UK')
Insert Into Employees Values (10, 'Ron', 'Male', 5000, 'USA');
Go

-------------



select Country, Gender, SUM(Salary) AS Salary
from Employees
Group By Country, Gender

UNION ALL

select Country, NULL, SUM(Salary) AS Salary
from Employees
Group By Country

UNION ALL

select NULL, Gender, SUM(Salary) AS Salary
from Employees
Group By Gender

UNION ALL

select NULL, Null, SUM(Salary) AS Salary
from Employees

----------------------

--Grouping Sets Example

SELECT Country, Gender, SUM(Salary) AS Salary
FROM Employees
GROUP BY
    Grouping Sets
    (
        (Country, Gender),  --Sum of Salary by Country and Gender
        (Country),          --Sum of Salary by Country
        (Gender),           --Sum of Salary by Gender
        ()                  --Grand Total
    )
ORDER BY GROUPING(Country),GROUPING(Gender)



SELECT Country, SUM(Salary) AS Salary
FROM Employees
GROUP BY ROLLUP(Country)


SELECT Country, SUM(Salary) AS Salary
FROM Employees
GROUP BY Country WITH ROLLUP


SELECT Country, SUM(Salary) AS Salary
FROM Employees
GROUP BY Country 

UNION ALL

SELECT NULL, SUM(Salary) AS Salary
FROM Employees

--Rollup Example
SELECT Country, Gender, SUM(Salary) AS Salary
FROM Employees
GROUP BY ROLLUP(Country, Gender)
ORDER BY GROUPING(Country),GROUPING(Gender)


--CUBE Example
SELECT Country, Gender, SUM(Salary) AS Salary
FROM Employees
GROUP BY CUBE(Country, Gender)
ORDER BY GROUPING(Country),GROUPING(Gender)