Use NorthWind_OLAP;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[STG].[NW_CustomerDetails]') AND type in (N'U'))
CREATE TABLE STG.NW_CustomerDetails (
 CustomerId NVARCHAR(5) NOT NULL,
 CompanyName NVARCHAR(40),
 City NVARCHAR(15),
 Region NVARCHAR(15),
 PostalCode NVARCHAR(10),
 Country NVARCHAR(15)
);

ALTER TABLE STG.NW_CustomerDetails ADD CONSTRAINT PK_NW_CustomerDetails PRIMARY KEY (CustomerId);

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[STG].[NW_EmployeeDetails]') AND type in (N'U'))
CREATE TABLE STG.NW_EmployeeDetails (
 EmployeeId INT NOT NULL,
 FirstName NVARCHAR(10),
 LastName NVARCHAR(20),
 Title NVARCHAR(30),
 City NVARCHAR(15),
 Region NVARCHAR(15),
 PostalCode NVARCHAR(10),
 Country NVARCHAR(15),

);

ALTER TABLE STG.NW_EmployeeDetails ADD CONSTRAINT PK_NW_EmployeeDetails PRIMARY KEY (EmployeeId);


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[STG].[NW_ShipperDetails]') AND type in (N'U'))
CREATE TABLE STG.NW_ShipperDetails (
 ShipperId INT NOT NULL,
 ShipperName NVARCHAR(40) NOT NULL
);

ALTER TABLE STG.NW_ShipperDetails ADD CONSTRAINT PK_NW_ShipperDetails PRIMARY KEY (ShipperId);

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[STG].[NW_SalesDetails]') AND type in (N'U'))
CREATE TABLE STG.NW_SalesDetails (
 ProductId INT NOT NULL,
 ShipperId INT NOT NULL,
 CustomerId NVARCHAR(5) NOT NULL,
 EmployeeId INT NOT NULL,
 OrderId INT NOT NULL,
 LineTotal REAL NOT NULL,
 Quantity INT NOT NULL,
 Discount REAL NOT NULL,
 OrderDate DATETIME,
 ShippedDate DATETIME
);

ALTER TABLE STG.NW_SalesDetails ADD CONSTRAINT PK_NW_SalesDetails PRIMARY KEY (ProductId,ShipperId,CustomerId,EmployeeId,OrderId);


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[STG].[NW_EmployeeterritoryDetails]') AND type in (N'U'))
CREATE TABLE STG.NW_EmployeeterritoryDetails (
	[TerritoryID] [nvarchar](20) NOT NULL,
	[EmployeeID] [int] NOT NULL,
	[TerritoryDescription] [nchar](50) NOT NULL,
	[RegionID] [int] NOT NULL
);

ALTER TABLE STG.NW_EmployeeterritoryDetails ADD CONSTRAINT PK_NW_EmployeeterritoryDetails PRIMARY KEY ([EmployeeID],[TerritoryID]);



IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[STG].[NW_ProductsDetails]') AND type in (N'U'))
CREATE TABLE STG.NW_ProductsDetails (
 ProductId INT NOT NULL,
 ProductName NVARCHAR(40),
 SupplierName NVARCHAR(40),
 SupplierId INT NOT NULL,
 CategoryName NVARCHAR(15) NOT NULL,
 CategoryId INT NOT NULL,
 Discontinued BIT NOT NULL
);

ALTER TABLE STG.NW_ProductsDetails ADD CONSTRAINT PK_NW_ProductsDetails PRIMARY KEY (ProductId);


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[STG].[NW_DateDimensionDetails]') AND type in (N'U'))
CREATE TABLE STG.NW_DateDimensionDetails (
	[DateKey] [int] NOT NULL,
	[Date] [date] NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[Weekday] [int] NULL,
	[WeekOfYear] [int] NULL,
	[Quarter] [int] NULL,
);

ALTER TABLE STG.NW_DateDimensionDetails ADD CONSTRAINT PK_NW_DateDimensionDetails PRIMARY KEY ([DateKey]);