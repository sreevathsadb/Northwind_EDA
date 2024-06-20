Use NorthWind_OLAP;


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[IMP].[NW_Customer]') AND type in (N'U'))
CREATE TABLE IMP.NW_Customer (
 CustomerId NVARCHAR(5) NOT NULL,
 CompanyName NVARCHAR(40),
 City NVARCHAR(15),
 Region NVARCHAR(15),
 PostalCode NVARCHAR(10),
 Country NVARCHAR(15)
);

ALTER TABLE IMP.NW_Customer ADD CONSTRAINT PK_NW_Customer PRIMARY KEY (CustomerId);

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[IMP].[NW_Employee]') AND type in (N'U'))
CREATE TABLE IMP.NW_Employee (
 EmployeeId INT NOT NULL,
 FirstName NVARCHAR(10),
 LastName NVARCHAR(20),
 Title NVARCHAR(30),
 City NVARCHAR(15),
 Region NVARCHAR(15),
 PostalCode NVARCHAR(10),
 Country NVARCHAR(15)
);

ALTER TABLE IMP.NW_Employee ADD CONSTRAINT PK_NW_Employee PRIMARY KEY (EmployeeId);

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[IMP].[NW_Products]') AND type in (N'U'))
CREATE TABLE IMP.NW_Products (
 ProductId INT NOT NULL,
 ProductName NVARCHAR(40),
 SupplierId INT NOT NULL,
 CategoryId INT NOT NULL,
 Discontinued BIT NOT NULL
);

ALTER TABLE IMP.NW_Products ADD CONSTRAINT PK_NW_Products PRIMARY KEY (ProductId);

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[IMP].[NW_Shippers]') AND type in (N'U'))
CREATE TABLE IMP.NW_Shippers (
	[ShipperID] [int] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[Phone] [nvarchar](24) NULL,
);

ALTER TABLE IMP.NW_Shippers ADD CONSTRAINT PK_NW_Shippers PRIMARY KEY (ShipperId);

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'IMP.NW_OrderDetails') AND type in (N'U'))
CREATE TABLE IMP.NW_OrderDetails (
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[Quantity] [smallint] NOT NULL,
	[Discount] [real] NOT NULL
);
ALTER TABLE IMP.NW_OrderDetails ADD CONSTRAINT PK_NW_Order_Details PRIMARY KEY ([OrderID],[ProductID]);

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'IMP.NW_Orders') AND type in (N'U'))
CREATE TABLE IMP.NW_Orders (
	[OrderID] [int] NOT NULL,
	[CustomerID] [nchar](5) NULL,
	[EmployeeID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[RequiredDate] [datetime] NULL,
	[ShippedDate] [datetime] NULL,
	[ShipVia] [int] NULL,
	[Freight] [money] NULL,
	[ShipName] [nvarchar](40) NULL,
	[ShipAddress] [nvarchar](60) NULL,
	[ShipCity] [nvarchar](15) NULL,
	[ShipRegion] [nvarchar](15) NULL,
	[ShipPostalCode] [nvarchar](10) NULL,
	[ShipCountry] [nvarchar](15) NULL
);
ALTER TABLE IMP.NW_Orders ADD CONSTRAINT PK_NW_Orders PRIMARY KEY ([OrderID]);


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'IMP.NW_Suppliers') AND type in (N'U'))
CREATE TABLE IMP.NW_Suppliers (
	[SupplierID] [int] NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	[HomePage] [ntext] NULL
);
ALTER TABLE IMP.NW_Suppliers ADD CONSTRAINT PK_NW_Suppliers PRIMARY KEY ([SupplierID]);


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'IMP.NW_Categories') AND type in (N'U'))
CREATE TABLE IMP.NW_Categories (
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
	[Picture] [image] NULL
);
ALTER TABLE IMP.NW_Categories ADD CONSTRAINT PK_NW_Categories PRIMARY KEY ([CategoryID]);


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'IMP.NW_EmployeeTerritories') AND type in (N'U'))
CREATE TABLE IMP.NW_EmployeeTerritories (
	[EmployeeID] [int] NOT NULL,
	[TerritoryID] [nvarchar](20) NOT NULL
);
ALTER TABLE IMP.NW_EmployeeTerritories ADD CONSTRAINT PK_NW_EmployeeTerritories PRIMARY KEY ([EmployeeID]);


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'IMP.NW_Territories') AND type in (N'U'))
CREATE TABLE IMP.NW_Territories (
	[TerritoryID] [nvarchar](20) NOT NULL,
	[TerritoryDescription] [nchar](50) NOT NULL,
	[RegionID] [int] NOT NULL
);
ALTER TABLE IMP.NW_Territories ADD CONSTRAINT PK_NW_Territories PRIMARY KEY ([TerritoryID]);

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'IMP.NW_DateDimension') AND type in (N'U'))
CREATE TABLE IMP.NW_DateDimension (
	[DateKey] [int] NOT NULL,
	[Date] [date] NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[Weekday] [int] NULL,
	[WeekOfYear] [int] NULL,
	[Quarter] [int] NULL,
);
ALTER TABLE IMP.NW_DateDimension ADD CONSTRAINT PK_NW_DateDimension PRIMARY KEY ([DateKey]);

