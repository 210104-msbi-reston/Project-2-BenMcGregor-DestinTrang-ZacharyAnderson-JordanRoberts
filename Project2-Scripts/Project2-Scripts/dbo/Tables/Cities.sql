CREATE TABLE Cities(
	City_ID INT PRIMARY KEY IDENTITY,
	City_Name VARCHAR(30),
	City_Population INT,
	County_ID INT,

	CONSTRAINT fk_Cities_Counties FOREIGN KEY(County_ID) REFERENCES Counties
)
