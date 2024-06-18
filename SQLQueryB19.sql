SELECT [CustomerID],[FirstName],[LastName],[EmailAddress],[Phone],[ModifiedDate]
FROM [SalesLT].[Customer]
  
CREATE USER TestUser WITHOUT LOGIN;
ALTER ROLE db_datareader ADD MEMBER TestUser;

EXECUTE AS User = 'TestUser'

SELECT [CustomerID],[FirstName],[LastName],[EmailAddress],[Phone],[ModifiedDate]
FROM [SalesLT].[Customer]

Revert

SELECT [CustomerID],[FirstName],[LastName],[EmailAddress],[Phone],[ModifiedDate]
FROM [SalesLT].[Customer]
