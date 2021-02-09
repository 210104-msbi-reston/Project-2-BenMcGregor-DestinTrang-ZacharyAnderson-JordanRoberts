CREATE TABLE Pickup_Locations(
	Pickup_ID INT PRIMARY KEY IDENTITY,
	[Company_ID] INT,
	City_ID INT,

	CONSTRAINT fk_Pickup_Companies FOREIGN KEY([Company_ID]) REFERENCES Companies,
	CONSTRAINT fk_Pickup_Cities FOREIGN KEY(City_ID) REFERENCES Cities
)