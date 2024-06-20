USE [NorthWind_OLAP];


/****Load to stagging Customer****/
TRUNCATE TABLE [STG].NW_CustomerDetails;
INSERT INTO [STG].NW_CustomerDetails
(CustomerId ,CompanyName, City, Region, PostalCode, Country)
 SELECT
 CustomerId ,
 CompanyName,
 City,
 Region,
 PostalCode,
 Country
 FROM IMP.NW_Customer;

 select * from [STG].NW_CustomerDetails;

 /****Load to stagging Employee****/

 TRUNCATE TABLE [STG].NW_EmployeeDetails;
 INSERT INTO [STG].NW_EmployeeDetails
 (EmployeeId, FirstName,LastName,Title,City,Region,PostalCode,Country)
 SELECT EmployeeId, FirstName,LastName,Title,City,Region,PostalCode,Country
 FROM IMP.NW_Employee;

  select * from [STG].NW_EmployeeDetails;

   /****Load to stagging Product****/
 TRUNCATE TABLE [STG].NW_ProductsDetails;
 INSERT INTO [STG].NW_ProductsDetails
 (ProductId,ProductName,SupplierName,SupplierId, CategoryName,CategoryId,Discontinued)
 SELECT ProductId,
 ProductName,
 s.CompanyName as SupplierName,
 p.SupplierId, 
 c.CategoryName,
 p.CategoryId,
 Discontinued
 FROM IMP.NW_Products p
 INNER JOIN IMP.NW_Suppliers s on p.SupplierID = s.SupplierID
 INNER JOIN IMP.NW_Categories c on p.CategoryID = c.CategoryID;
 
 select * from [STG].NW_ProductsDetails;


  /****Load to stagging Shipper****/
 TRUNCATE TABLE [STG].[NW_ShipperDetails];
 INSERT INTO [STG].[NW_ShipperDetails]
 (ShipperId,ShipperName)
 SELECT ShipperId,CompanyName 
 FROM IMP.NW_Shippers;
  select * from [STG].[NW_ShipperDetails];


  /****Load to stagging EmployeeterritoryDetails****/
 TRUNCATE TABLE [STG].[NW_EmployeeterritoryDetails];
 INSERT INTO [STG].[NW_EmployeeterritoryDetails]
 (	[TerritoryID],
	[EmployeeID],
	[TerritoryDescription],
	[RegionID])
	SELECT 
	T.[TerritoryID],
	ET.[EmployeeID],
	T.[TerritoryDescription],
	T.[RegionID]
	FROM
	[IMP].[NW_Territories] T
	INNER JOIN
	[IMP].[NW_EmployeeTerritories] ET
	ON T.[TerritoryID] = ET.[TerritoryID]

  select * from [STG].[NW_EmployeeterritoryDetails];

    /****Load to stagging EmployeeterritoryDetails****/
 TRUNCATE TABLE [STG].[NW_EmployeeterritoryDetails];
 INSERT INTO [STG].[NW_EmployeeterritoryDetails]
 (	[TerritoryID],
	[EmployeeID],
	[TerritoryDescription],
	[RegionID])
	SELECT 
	T.[TerritoryID],
	ET.[EmployeeID],
	T.[TerritoryDescription],
	T.[RegionID]
	FROM
	[IMP].[NW_Territories] T
	INNER JOIN
	[IMP].[NW_EmployeeTerritories] ET
	ON T.[TerritoryID] = ET.[TerritoryID]

  select * from [STG].[NW_EmployeeterritoryDetails];


 TRUNCATE TABLE [STG].[NW_DateDimensionDetails];
 INSERT INTO [STG].[NW_DateDimensionDetails]
 (	   [DateKey]
      ,[Date]
      ,[Year]
      ,[Month]
      ,[Day]
      ,[Weekday]
      ,[WeekOfYear]
      ,[Quarter])
	SELECT 
	   [DateKey]
      ,[Date]
      ,[Year]
      ,[Month]
      ,[Day]
      ,[Weekday]
      ,[WeekOfYear]
      ,[Quarter]
	FROM
	[IMP].[NW_DateDimension]

  select * from [STG].[NW_DateDimensionDetails];

 /****Load to stagging Sales****/
 TRUNCATE TABLE [STG].[NW_SalesDetails];
 INSERT INTO [STG].[NW_SalesDetails]
 (ProductId,ShipperId,CustomerId,EmployeeId,OrderId,LineTotal,Quantity,Discount,OrderDate,ShippedDate)
 SELECT ProductId,
 ShipVia,
 CustomerID,
 EmployeeID,
 o.OrderID,
 UnitPrice*Quantity*(1-Discount) as LineTotal,
 Quantity,
 Discount,
 OrderDate,
 ShippedDate
 FROM [IMP].[NW_Orders] o
 INNER JOIN [IMP].[NW_OrderDetails] od on o.OrderID = od.OrderID;




/**** HANDLING UNKNOWN VALUES ***********/

UPDATE STG.NW_CustomerDetails
SET PostalCode ='UNKNOWN'
WHERE PostalCode IS NULL;

UPDATE STG.NW_CustomerDetails
SET Region ='UNKNOWN'
WHERE Region IS NULL;

UPDATE STG.NW_SalesDetails
SET ShippedDate = '9999-12-31 00:00:00.000'
WHERE ShippedDate IS NULL;


