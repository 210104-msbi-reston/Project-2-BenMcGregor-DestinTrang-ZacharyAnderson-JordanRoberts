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