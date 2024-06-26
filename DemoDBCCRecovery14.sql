-- Run DBCC CHECKDB with default options
DBCC CHECKDB('Adventureworks');
GO

-- Run DBCC CHECKDB without informational messages
DBCC CHECKDB('Adventureworks') WITH NO_INFOMSGS;
GO

-- Run DBCC CHECKDB against CorruptDB	
DBCC CHECKDB('CorruptDB') WITH NO_INFOMSGS;
GO

-- Try to access the Orders table
SELECT * FROM CorruptDB.dbo.Orders;
GO

-- Access a specific order
SELECT * FROM CorruptDB.dbo.Orders WHERE OrderID = 10400;
GO

-- Repair the database
ALTER DATABASE CorruptDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
DBCC CHECKDB('CorruptDB', REPAIR_ALLOW_DATA_LOSS);
GO
ALTER DATABASE CorruptDB SET MULTI_USER WITH ROLLBACK IMMEDIATE;
GO

-- Access the Orders table
SELECT * FROM CorruptDB.dbo.Orders;
GO

-- Check the internal database structure
DBCC CHECKDB('CorruptDB') WITH NO_INFOMSGS;
GO

-- Check data loss
SELECT DISTINCT OrderID 
FROM CorruptDB.dbo.[order details] AS od
WHERE NOT EXISTS (SELECT 1 
                  FROM CorruptDB.dbo.Orders AS o
                  WHERE o.orderid = od.orderid);
GO
