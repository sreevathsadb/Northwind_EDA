USE [NorthWind_OLAP];


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[WDM].[Dim_Employee]') AND type in (N'U'))
CREATE TABLE WDM.Dim_Employee (
 EmployeeId INT NOT NULL,
 FirstName NVARCHAR(10),
 LastName NVARCHAR(20),
 Title NVARCHAR(30),
 City NVARCHAR(15),
 Region NVARCHAR(15),
 PostalCode NVARCHAR(10),
 Country NVARCHAR(15)
);


ALTER TABLE WDM.Dim_Employee ADD CONSTRAINT PK_Dim_Employee PRIMARY KEY (EmployeeId);



IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[WDM].[Dim_Shipper]') AND type in (N'U'))
CREATE TABLE WDM.Dim_Shipper (
 ShipperId INT NOT NULL,
 ShipperName NVARCHAR(40)
);

ALTER TABLE WDM.Dim_Shipper ADD CONSTRAINT PK_Dim_Shipper PRIMARY KEY (ShipperId);



IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[WDM].[Dim_Customer]') AND type in (N'U'))
CREATE TABLE WDM.Dim_Customer (
 CustomerId NVARCHAR(5) NOT NULL,
 CompanyName NVARCHAR(40),
 City NVARCHAR(15),
 Region NVARCHAR(15),
 PostalCode NVARCHAR(10),
 Country NVARCHAR(15)
);

ALTER TABLE WDM.Dim_Customer ADD CONSTRAINT PK_Dim_Customer PRIMARY KEY (CustomerId);

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[WDM].[Dim_Product]') AND type in (N'U'))
CREATE TABLE WDM.Dim_Product (
 ProductId INT NOT NULL,
 ProductName NVARCHAR(40),
 SupplierName NVARCHAR(40),
 SupplierId INT,
 CategoryName NVARCHAR(15),
 CategoryId INT,
 Discontinued BIT
);

ALTER TABLE WDM.Dim_Product ADD CONSTRAINT PK_Dim_Product PRIMARY KEY (ProductId);

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[WDM].[Dim_Date]') AND type in (N'U'))
CREATE TABLE WDM.Dim_Date (
	[DateKey] [int] NOT NULL,
	[Date] [date] NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[Weekday] [int] NULL,
	[WeekOfYear] [int] NULL,
	[Quarter] [int] NULL
);

ALTER TABLE WDM.Dim_Date ADD CONSTRAINT PK_Dim_Date PRIMARY KEY ([DateKey]);


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[WDM].[Fact_Sales]') AND type in (N'U'))
CREATE TABLE WDM.Fact_Sales (
 ProductId INT NOT NULL,
 ShipperId INT NOT NULL,
 CustomerId NVARCHAR(5) NOT NULL,
 EmployeeId INT NOT NULL,
 OrderId INT NOT NULL,
 LineTotal Decimal(10),
 Quantity Decimal(10),
 Discount Decimal(10),
 ShippedDate date,
 OrderDateInt [int]  NULL,
);
ALTER TABLE WDM.Fact_Sales ADD CONSTRAINT PK_Fact_Sales PRIMARY KEY (ProductId,ShipperId,CustomerId,EmployeeId,OrderId);


ALTER TABLE WDM.Fact_Sales ADD CONSTRAINT FK_Fact_Sales_1 FOREIGN KEY (CustomerId) REFERENCES WDM.Dim_Customer (CustomerId);
ALTER TABLE WDM.Fact_Sales ADD CONSTRAINT FK_Fact_Sales_2 FOREIGN KEY (ProductId) REFERENCES WDM.Dim_Product (ProductId);
ALTER TABLE WDM.Fact_Sales ADD CONSTRAINT FK_Fact_Sales_3 FOREIGN KEY (EmployeeId) REFERENCES WDM.Dim_Employee (EmployeeId);
ALTER TABLE WDM.Fact_Sales ADD CONSTRAINT FK_Fact_Sales_4 FOREIGN KEY (ShipperId) REFERENCES WDM.Dim_Shipper (ShipperId);
ALTER TABLE WDM.Fact_Sales ADD CONSTRAINT FK_Fact_Sales_5 FOREIGN KEY (OrderDateInt) REFERENCES WDM.Dim_Date ([DateKey]);

