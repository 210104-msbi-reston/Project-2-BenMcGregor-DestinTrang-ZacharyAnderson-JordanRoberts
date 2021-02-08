--CREATE DATABASE P2PandexDB
USE P2PandexDB

CREATE TABLE Customers(
	Customer_ID INT PRIMARY KEY IDENTITY,
	Customer_Name VARCHAR(50),
	Customer_Age INT,
	Customer_Sex VARCHAR(10)
)

CREATE TABLE States(
	State_ID INT PRIMARY KEY IDENTITY,
	State_Name VARCHAR(30),
	State_Abbreviation VARCHAR(2),
	Tax_Rate FLOAT
)

CREATE TABLE Zones(
	Zone_ID INT PRIMARY KEY IDENTITY,
	State_ID INT,

	CONSTRAINT fk_Zones_States FOREIGN KEY(State_ID) REFERENCES States
)

CREATE TABLE Cities(
	City_ID INT PRIMARY KEY IDENTITY,
	City_Name VARCHAR(30),
	City_Population INT,
	Zone_ID INT,

	CONSTRAINT fk_Cities_Zones FOREIGN KEY(Zone_Id) REFERENCES Zones
)

CREATE TABLE Companies(
	Client_ID INT PRIMARY KEY IDENTITY,
	Company_Name VARCHAR(30),
	Location_Type VARCHAR(30),
	Date_Started DATETIME
)

CREATE TABLE Pickup_Locations(
	Pickup_ID INT PRIMARY KEY IDENTITY,
	Client_ID INT,
	City_ID INT,

	CONSTRAINT fk_Pickup_Companies FOREIGN KEY(Client_ID) REFERENCES Companies,
	CONSTRAINT fk_Pickup_Cities FOREIGN KEY(City_ID) REFERENCES Cities
)


CREATE TABLE Registered_Cars(
	Registered_Car_ID INT PRIMARY KEY IDENTITY,
	Make VARCHAR(20),
	Model VARCHAR(20)
)

CREATE TABLE Drivers(
	Driver_ID INT PRIMARY KEY IDENTITY,
	License_No VARCHAR(10) UNIQUE,
	Driver_Name VARCHAR(50),
	Driver_Age INT,
	Driver_Sex VARCHAR(10),
	Registered_Car_ID INT UNIQUE,
	State_ID INT,

	CONSTRAINT fk_Drivers_RegisteredCars FOREIGN KEY(Registered_Car_ID) REFERENCES Registered_Cars,
	CONSTRAINT fk_Drivers_States FOREIGN KEY(State_ID) REFERENCES States
)

CREATE TABLE Orders(
	Order_ID INT PRIMARY KEY IDENTITY,
	Order_Price SMALLMONEY,
	Tip_Amount SMALLMONEY,
	Start_Time DATETIME,
	Arrival_Time DATETIME,
	Pickup_Time DATETIME,
	Delivery_Time DATETIME,
	Driver_Rating INT,
	Customer_Rating INT,
	Customer_ID INT,
	Driver_ID INT,
	Pickup_ID INT,
	City_ID INT,

	CONSTRAINT fk_Orders_Customers FOREIGN KEY(Customer_ID) REFERENCES Customers,
	CONSTRAINT fk_Orders_Drivers FOREIGN KEY(Driver_ID) REFERENCES Drivers,
	CONSTRAINT fk_Orders_PickupLocations FOREIGN KEY(Pickup_ID) REFERENCES Pickup_Locations,
	CONSTRAINT fk_Orders_Cities FOREIGN KEY(City_ID) REFERENCES Cities,
	CONSTRAINT chk_DriverRating CHECK(Driver_Rating >= 1 AND Driver_Rating <= 5),
	CONSTRAINT chk_CustomerRating CHECK(Customer_Rating >= 1 AND Customer_Rating <= 5)
)

CREATE TABLE Order_Items(
	Order_Item_ID INT PRIMARY KEY IDENTITY,
	Item_Name VARCHAR(20),
	Order_ID INT,
	CONSTRAINT fk_OrderItems_Orders FOREIGN KEY(Order_ID) REFERENCES Orders
)