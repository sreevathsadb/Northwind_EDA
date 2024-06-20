USE [NorthWind_DB];
GO
CREATE PROCEDURE dbo.GenerateDateDimensionSP
AS
BEGIN
    -- Drop the date dimension table if it already exists
    IF OBJECT_ID('dbo.DateDimension') IS NOT NULL
    BEGIN
        DROP TABLE dbo.DateDimension;
    END;

    -- Create the date dimension table
    CREATE TABLE dbo.DateDimension (
        DateKey INT PRIMARY KEY,
        [Date] DATE,
        [Year] INT,
        [Month] INT,
        [Day] INT,
        [Weekday] INT,
        [WeekOfYear] INT,
        [Quarter] INT
        -- Add more columns as needed
    );

    -- Populate the date dimension table
    DECLARE @StartDate DATE = '1990-01-01';
    DECLARE @EndDate DATE = '2010-12-31';
    DECLARE @CurrentDate DATE = @StartDate;

    WHILE @CurrentDate <= @EndDate
    BEGIN
        INSERT INTO dbo.DateDimension (DateKey, [Date], [Year], [Month], [Day], [Weekday], [WeekOfYear], [Quarter])
        VALUES (
            CONVERT(INT, FORMAT(@CurrentDate, 'yyyyMMdd')),
            @CurrentDate,
            YEAR(@CurrentDate),
            MONTH(@CurrentDate),
            DAY(@CurrentDate),
            DATEPART(WEEKDAY, @CurrentDate),
            DATEPART(WEEK, @CurrentDate),
            DATEPART(QUARTER, @CurrentDate)
        );
        SET @CurrentDate = DATEADD(DAY, 1, @CurrentDate);
    END;
END;
GO

Exec dbo.GenerateDateDimensionSP;