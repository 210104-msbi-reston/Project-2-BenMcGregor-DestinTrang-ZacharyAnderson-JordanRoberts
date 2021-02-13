CREATE TABLE FactOrderItems (
	Order_ID INT,
	Order_Item_ID INT,
	PRIMARY KEY (Order_ID, Order_Item_ID),
	City_ID INT,
	PickUp_ID INT,
	Driver_ID INT,
	Customer_ID INT,

	Start_Time DATETIME,
	Arrival_Time DATETIME,
	PickUp_Time DATETIME,
	Delivery_Time DATETIME,

	Order_Price SMALLMONEY,
	Item_Quantity INT,
	Tip_Amount SMALLMONEY,
	Driver_Rating INT,
	Customer_Rating INT
	
	CONSTRAINT FK_DimCities FOREIGN KEY (City_ID) REFERENCES DimCities (City_ID),
	CONSTRAINT FK_DimPickUpLocations FOREIGN KEY (PickUp_ID) REFERENCES DimPickUpLocations (PickUp_ID),
	CONSTRAINT FK_DimDrivers FOREIGN KEY (Driver_ID) REFERENCES DimDrivers (Driver_ID),
	CONSTRAINT FK_DimCustomers FOREIGN KEY (Customer_ID) REFERENCES DimCustomers (Customer_ID),
	CONSTRAINT FK_DimTime FOREIGN KEY (Start_Time) REFERENCES DimTime (TimeStamp)
)
INSERT INTO FactOrderItems (
	Order_ID, Order_Item_ID, City_ID, PickUp_ID, Driver_ID, Customer_ID,
	Start_Time, Arrival_Time, PickUp_Time, Delivery_Time,
	Order_Price, Item_Quantity, Tip_Amount, Driver_Rating, Customer_Rating)
SELECT o.Order_ID, i.Item_ID, o.City_ID, o.Pickup_ID, o.Driver_ID, o.Customer_ID,
	o.Start_Time, o.Arrival_Time, o.Pickup_Time, o.Delivery_Time,
	o.Order_Price, i.Quantity, o.Tip_Amount, o.Driver_Rating, o.Customer_Rating
FROM Order_Items as i JOIN Orders as o ON i.Order_ID = o.Order_ID


CREATE TABLE DimCities (
	City_ID INT PRIMARY KEY,
	City_Name VARCHAR(30),
	County_Name VARCHAR(30),
	State_Name VARCHAR(30)
)
INSERT INTO DimCities (City_ID, City_Name, County_Name, State_Name)
SELECT Cities.City_ID, Cities.City_Name, Counties.County_Name, States.State_Name
FROM Cities JOIN Counties ON Cities.County_ID = Counties.County_ID
	JOIN States ON Counties.State_ID = States.State_ID


CREATE TABLE DimPickUpLocations (
	PickUp_ID INT PRIMARY KEY,
	Company_Name VARCHAR(30)
)
INSERT INTO DimPickUpLocations (PickUp_ID, Company_Name)
SELECT Pickup_Locations.Pickup_ID, Companies.Company_Name
FROM Pickup_Locations JOIN Companies ON Pickup_Locations.Company_ID = Companies.Company_ID


CREATE TABLE DimDrivers (
	Driver_ID INT PRIMARY KEY,
	License_No VARCHAR(10),
	Driver_Name VARCHAR(50),
	Driver_Age INT,
	Driver_Sex VARCHAR(10),
	Car_Make VARCHAR(20),
	Car_Model VARCHAR(20)
)
INSERT INTO DimDrivers (Driver_ID, License_No, Driver_Name, Driver_Age, Driver_Sex, Car_Make, Car_Model)
SELECT Drivers.Driver_ID, Drivers.License_No, Drivers.Driver_Name, Drivers.Driver_Age, Drivers.Driver_Sex, Registered_Cars.Make, Registered_Cars.Model
FROM Drivers JOIN Registered_Cars ON Drivers.Registered_Car_ID = Registered_Cars.Registered_Car_ID


CREATE TABLE DimCustomers (
	Customer_ID INT PRIMARY KEY,
	Customer_Age INT,
	Customer_Sex VARCHAR(10)
)
INSERT INTO DimCustomers (Customer_ID, Customer_Age, Customer_Sex)
SELECT Customers.Customer_ID, Customers.Customer_Age, Customers.Customer_Sex
FROM Customers


CREATE TABLE DimOrderItemInfo (
	Item_ID INT PRIMARY KEY,
	Item_Name VARCHAR(20)
)
INSERT INTO DimOrderItemInfo (Item_ID, Item_Name)
SELECT Order_Item_Info.Item_ID, Order_Item_Info.Item_Name
FROM Order_Item_Info



CREATE TABLE DimTime (
    [TimeStamp] DATETIME PRIMARY KEY,
    [Minute] INT,
    [Hour] INT,
    [Day] INT,
    [Week] INT,
    [Month] INT,
    [Quarter] INT,
    [Year] INT
);

truncate table DimTime
DECLARE @CurrentTimeStamp AS DATETIME;
SET @CurrentTimeStamp = '2015-02-01 00:00:00.000';


WHILE @CurrentTimeStamp < '2021-02-16 23:59:00.000'
BEGIN

	SET @CurrentTimeStamp = DATEADD(MINUTE, 1, @CurrentTimeStamp)
    INSERT INTO DimTime ([TimeStamp], [Minute], [Hour], [Day], [Week], [Month], [Quarter], [Year])
        VALUES(
			@CurrentTimeStamp,
			datepart(minute, @CurrentTimeStamp),
			datepart(hour, @CurrentTimeStamp),
			datepart(day, @CurrentTimeStamp),
			datepart(week, @CurrentTimeStamp),
			datepart(month, @CurrentTimeStamp),
			datepart(quarter, @CurrentTimeStamp),
			datepart(year, @CurrentTimeStamp)
			)


END
