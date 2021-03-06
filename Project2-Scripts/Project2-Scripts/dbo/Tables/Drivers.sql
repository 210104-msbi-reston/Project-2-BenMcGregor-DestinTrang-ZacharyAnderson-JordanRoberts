﻿CREATE TABLE Drivers(
	Driver_ID INT PRIMARY KEY IDENTITY,
	License_No VARCHAR(10) UNIQUE,
	Driver_Name VARCHAR(50),
	Driver_Age INT,
	Driver_Sex VARCHAR(10),
	Registered_Car_ID INT UNIQUE,
	County_ID INT,

	CONSTRAINT fk_Drivers_RegisteredCars FOREIGN KEY(Registered_Car_ID) REFERENCES Registered_Cars,
	CONSTRAINT fk_Drivers_Counties FOREIGN KEY(County_ID) REFERENCES Counties
)