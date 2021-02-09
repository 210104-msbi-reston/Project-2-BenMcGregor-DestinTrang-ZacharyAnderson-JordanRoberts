CREATE TABLE Order_Item_Info(
	Item_ID INT PRIMARY KEY IDENTITY,
	Item_Name VARCHAR(20),
	Item_Price SMALLMONEY,
	Company_ID INT,

	CONSTRAINT fk_OrderItemInfo_Companies FOREIGN KEY(Company_ID) REFERENCES Companies
)