CREATE VIEW vw_Drivers AS
	SELECT D.Driver_ID AS [Driver ID],
		D.License_No AS [Liscense Number],
		D.Driver_Name AS [Name],
		D.Driver_Age AS [Age],
		D.Driver_Sex AS [Gender],
		CONCAT(R.Make, ' ', R.Model) AS [Registered Car],
		S.State_Name AS [State]
	FROM States AS S 
		JOIN Drivers AS D ON S.State_ID = D.State_ID 
		JOIN Registered_Cars AS R ON R.Registered_Car_ID = D.Registered_Car_ID
