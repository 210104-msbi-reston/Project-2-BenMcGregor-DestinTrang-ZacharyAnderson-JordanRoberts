﻿CREATE TABLE Counties(
	County_ID INT PRIMARY KEY IDENTITY,
	County_Name VARCHAR(20),
	State_ID INT,

	CONSTRAINT fk_Counties_States FOREIGN KEY(State_ID) REFERENCES States
)