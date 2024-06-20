Use NorthWind_OLAP;

TRUNCATE TABLE IMP.NW_Customer;
INSERT INTO IMP.NW_Customer
(CustomerId ,CompanyName, City, Region, PostalCode, Country)
 SELECT
 CustomerId ,
 CompanyName,
 City,
 Region,
 PostalCode,
 Country
 FROM [NorthWind_DB].[dbo].Customers;

 select * from IMP.NW_Customer;

 /****Load to stage Product****/
 TRUNCATE TABLE IMP.NW_Products;
 INSERT INTO IMP.NW_Products
 (ProductId,ProductName,CategoryId,SupplierID,Discontinued)
 SELECT ProductId,ProductName,CategoryId,SupplierID,Discontinued
 FROM [NorthWind_DB].[dbo].Products;
 
 select * from IMP.NW_Products;

  /****Load to stage Employee****/

 TRUNCATE TABLE IMP.NW_Employee;
 INSERT INTO IMP.NW_Employee
 (EmployeeId, FirstName,LastName,Title,City,Region,PostalCode,Country)
 SELECT EmployeeId, FirstName,LastName,Title,City,Region,PostalCode,Country
 FROM [NorthWind_DB].[dbo].Employees;

  select * from IMP.NW_Employee;


 /****Load to stage Employee****/

 TRUNCATE TABLE IMP.NW_Employee;
 INSERT INTO IMP.NW_Employee
 (EmployeeId, FirstName,LastName,Title,City,Region,PostalCode,Country)
 SELECT EmployeeId, FirstName,LastName,Title,City,Region,PostalCode,Country
 FROM [NorthWind_DB].[dbo].Employees;

  select * from IMP.NW_Employee;


 /****Load to stage Suppliers****/

 TRUNCATE TABLE IMP.NW_Suppliers;
 INSERT INTO IMP.NW_Suppliers
 (
	[SupplierID],
	[CompanyName],
	[ContactName] ,
	[ContactTitle],
	[Address],
	[City],
	[Region],
	[PostalCode],
	[Country],
	[Phone],
	[Fax],
	[HomePage])
 SELECT
	[SupplierID],
	[CompanyName],
	[ContactName] ,
	[ContactTitle],
	[Address],
	[City],
	[Region],
	[PostalCode],
	[Country],
	[Phone],
	[Fax],
	[HomePage]
 FROM [NorthWind_DB].[dbo].[Suppliers];

  select * from IMP.NW_Suppliers;

 /****Load to stage Categories****/

 TRUNCATE TABLE IMP.NW_Categories;
 INSERT INTO IMP.NW_Categories
 (
	[CategoryID],
	[CategoryName],
	[Description],
	[Picture])
 SELECT
	[CategoryID],
	[CategoryName],
	[Description],
	[Picture]
 FROM [NorthWind_DB].[dbo].[Categories];

  select * from IMP.NW_Categories;

 /****Load to stage Orders****/

 TRUNCATE TABLE IMP.NW_Orders;
 INSERT INTO IMP.NW_Orders
 (
	[OrderID],
	[CustomerID],
	[EmployeeID],
	[OrderDate],
	[RequiredDate],
	[ShippedDate],
	[ShipVia],
	[Freight],
	[ShipName],
	[ShipAddress],
	[ShipCity],
	[ShipRegion],
	[ShipPostalCode],
	[ShipCountry])
 SELECT
	[OrderID],
	[CustomerID],
	[EmployeeID],
	[OrderDate],
	[RequiredDate],
	[ShippedDate],
	[ShipVia],
	[Freight],
	[ShipName],
	[ShipAddress],
	[ShipCity],
	[ShipRegion],
	[ShipPostalCode],
	[ShipCountry]
 FROM [NorthWind_DB].[dbo].[Orders];

  select * from IMP.NW_Orders;

   /****Load to stage Order Details****/

 TRUNCATE TABLE IMP.NW_OrderDetails;
 INSERT INTO IMP.NW_OrderDetails
 (
	[OrderID],
	[ProductID],
	[UnitPrice],
	[Quantity],
	[Discount])
 SELECT
	[OrderID],
	[ProductID],
	[UnitPrice],
	[Quantity],
	[Discount]
 FROM [NorthWind_DB].[dbo].[Order Details];

  select * from IMP.NW_OrderDetails;


   /****Load to stage Shippers****/

 TRUNCATE TABLE IMP.NW_Shippers;
 INSERT INTO IMP.NW_Shippers
 (
	[ShipperID],
	[CompanyName],
	[Phone])
 SELECT
	[ShipperID],
	[CompanyName],
	[Phone]
 FROM [NorthWind_DB].[dbo].[Shippers];

  select * from IMP.NW_Shippers;


   /****Load to stage EmployeeTerritories****/

 TRUNCATE TABLE IMP.NW_EmployeeTerritories;
 INSERT INTO IMP.NW_EmployeeTerritories
 (
	[EmployeeID],
	[TerritoryID])
 SELECT
	[EmployeeID],
	[TerritoryID]
 FROM [NorthWind_DB].[dbo].[EmployeeTerritories];

  select * from IMP.NW_EmployeeTerritories;

   /****Load to stage EmployeeTerritories****/

 TRUNCATE TABLE IMP.NW_Territories;
 INSERT INTO IMP.NW_Territories
 (
	[TerritoryID],
	[TerritoryDescription],
	[RegionID])
 SELECT
	[TerritoryID],
	[TerritoryDescription],
	[RegionID]
 FROM [NorthWind_DB].[dbo].[Territories];

  select * from IMP.NW_Territories;

 TRUNCATE TABLE IMP.NW_DateDimension;
 INSERT INTO IMP.NW_DateDimension
 (
       [DateKey]
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
 FROM [NorthWind_DB].[dbo].[DateDimension];

  select * from IMP.NW_DateDimension;