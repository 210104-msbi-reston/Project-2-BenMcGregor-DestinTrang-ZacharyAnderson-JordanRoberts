CREATE TABLE Order_Items(
	Order_ID INT,
	Item_ID INT,
	Quantity INT,

	CONSTRAINT fk_OrderItems_Orders FOREIGN KEY(Order_ID) REFERENCES Orders,
	CONSTRAINT fk_OrderItems_OrderItemInfo FOREIGN KEY(Item_ID) REFERENCES Order_Item_Info,
	CONSTRAINT ck_OrderItems PRIMARY KEY(Order_ID, Item_ID)
)