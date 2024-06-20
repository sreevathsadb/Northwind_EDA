USE master;
GO

IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'NorthWind_OLAP')
BEGIN
    CREATE DATABASE NorthWind_OLAP;
END;
GO

USE NorthWind_OLAP;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'IMP')
BEGIN
    EXEC('CREATE SCHEMA IMP;');
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'STG')
BEGIN
    EXEC('CREATE SCHEMA STG;');
END;
GO

IF NOT EXISTS (SELECT 1 FROM sys.schemas WHERE name = 'WDM')
BEGIN
    EXEC('CREATE SCHEMA WDM;');
END;
GO
