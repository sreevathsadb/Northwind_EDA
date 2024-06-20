Use NorthWind_OLAP;

/** Insert data into WDM Dim_Customer  **/
INSERT INTO [WDM].[Dim_Customer]
      ([CustomerId]
           ,[CompanyName]
           ,[City]
           ,[Region]
           ,[PostalCode]
           ,[Country])
		   
 
	SELECT [CustomerId]
           ,[CompanyName]
           ,[City]
           ,[Region]
           ,[PostalCode]
           ,[Country]
		   FROM [STG].NW_CustomerDetails
GO
/** Insert data into WDM Dim_Employee  **/
INSERT INTO [WDM].[Dim_Employee]
           ([EmployeeId]
           ,[FirstName]
           ,[LastName]
           ,[Title]
           ,[City]
           ,[Region]
           ,[PostalCode]
           ,[Country])

	SELECT [EmployeeId]
           ,[FirstName]
           ,[LastName]
           ,[Title]
           ,[City]
           ,[Region]
           ,[PostalCode]
           ,[Country]
		   FROM [STG].NW_EmployeeDetails

GO
/** Insert data into WDM Dim_Product  **/
INSERT INTO [WDM].[Dim_Product]
           ([ProductId]
           ,[ProductName]
           ,[SupplierName]
           ,[SupplierId]
           ,[CategoryName]
           ,[CategoryId]
           ,[Discontinued])
	SELECT [ProductId]
           ,[ProductName]
           ,[SupplierName]
           ,[SupplierId]
           ,[CategoryName]
           ,[CategoryId]
           ,[Discontinued]
		   FROM [STG].NW_ProductsDetails
GO
/** Insert data into WDM Dim_Shipper  **/
INSERT INTO [WDM].[Dim_Shipper]
           ([ShipperId]
           ,[ShipperName])
	SELECT [ShipperId]
           ,[ShipperName]
		   FROM [STG].NW_ShipperDetails


/** Insert data into WDM Dim_Shipper  **/
INSERT INTO [WDM].[Dim_Date]
           ([DateKey]
			,[Date]
			,[Year]
			,[Month]
			,[Day]
			,[Weekday]
			,[WeekOfYear]
			,[Quarter])
	SELECT	 [DateKey]
			,[Date]
			,[Year]
			,[Month]
			,[Day]
			,[Weekday]
			,[WeekOfYear]
			,[Quarter]
		   FROM [STG].[NW_DateDimensionDetails]

/** Insert data into WDM Fact_Sales  **/

INSERT INTO [WDM].[Fact_Sales](
			 [ProductId],
			 [CustomerId],
			 [EmployeeId],
			 [ShipperId],
			 OrderId,
			 LineTotal,
			 Quantity,
			 Discount,
			 ShippedDate,
			 OrderDateInt)
		SELECT DP.[ProductId],
			   DC.[CustomerId],
			   DE.[EmployeeId],
			   DS.[ShipperId],
			   SD.OrderId,
			   SD.LineTotal,
			   SD.Quantity,
			   SD.Discount,
			   SD.[ShippedDate],
			   CONVERT(VARCHAR(8), SD.[OrderDate], 112) AS OrderDateInt
		FROM [STG].NW_SalesDetails SD
		inner join [WDM].[Dim_Customer] as DC on DC.CustomerId = SD.CustomerId
		inner join [WDM].[Dim_Employee] as DE on DE.EmployeeID = SD.EmployeeId
		inner join [WDM].[Dim_Shipper] as DS on DS.ShipperId = SD.ShipperId
		inner join [WDM].[Dim_Product] as DP on DP.ProductId = SD.ProductId



