CREATE VIEW vw_Customers AS
	SELECT Customer_ID AS [Customer ID], 
		Customer_Name AS [Name],
		Customer_Age AS [Age],
		Customer_Sex AS [Gender]
	FROM Customers
GO