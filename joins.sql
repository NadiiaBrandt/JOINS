USE AdventureWorks2019
GO

SELECT 
	FirstName +' '+ LastName AS FullName
	, JobTitle
	, BirthDate
FROM 
	Person.Person
	, HumanResources.Employee
WHERE 
	Person.BusinessEntityID = Employee.BusinessEntityID;
GO

SELECT FirstName +' '+ LastName AS FullName,
	(
	SELECT 
		JobTitle 
	FROM 
		HumanResources.Employee	
	WHERE 
		Person.BusinessEntityID = Employee.BusinessEntityID
	)
	AS JobTitle
FROM Person.Person;
GO

SELECT
	A.FullName
	, A.JobTitle
FROM
	(
	SELECT 
		FirstName +' '+ LastName AS FullName,
		(
		SELECT
			JobTitle 
		FROM 
			HumanResources.Employee	
		WHERE 
			Person.BusinessEntityID = Employee.BusinessEntityID
	)
	AS JobTitle
FROM
	Person.Person) A
WHERE	
	A.JobTitle IS NOT NULL;
GO

SELECT 
	FirstName +' '+ LastName AS FullName
	, JobTitle
FROM 
	Person.Person
CROSS JOIN 
	HumanResources.Employee 
GO

SELECT COUNT(*)
FROM (SELECT FirstName +' '+ LastName AS FullName, JobTitle
FROM Person.Person
CROSS JOIN HumanResources.Employee ) R
GO 