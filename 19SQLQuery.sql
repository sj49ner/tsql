CREATE USER TestUser WITHOUT LOGIN;
ALTER ROLE db_datareader ADD MEMBER TestUser;

select CustomerID, FirstNAME, EmailAddress
from [SalesLT],[Customer]

ALTER TABLE [SalesLT].[Customer]
ALTER COLUMN [EmailAddress] NVARCHAR(50) MASKED WITH (FUNCTION = 'eMail()')

select CustomerID, FirstNAME, EmailAddress
from [SalesLT].[Customer]

EXECUTE AS USER = 'TestUser'

select CustomerID, FirstNAME, EmailAddress
from [SalesLT].[Customer]

revert

select CustomerID, FirstName, EmailAddress
from [SalesLT].[Customer]
