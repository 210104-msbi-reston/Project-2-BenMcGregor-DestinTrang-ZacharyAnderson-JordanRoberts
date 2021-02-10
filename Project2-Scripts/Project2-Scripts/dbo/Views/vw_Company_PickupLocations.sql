CREATE VIEW vw_Company_PickupLocations AS
	SELECT CO.Company_ID AS [Company ID],
		CO.Company_Name AS [Company],
		CO.Location_Type AS [Location Type],
		PL.Pickup_ID AS [Pickup Location ID],
		C.City_Name AS [City],
		CT.County_Name AS [County],
		S.State_Name AS [State]
	FROM Companies AS CO
		JOIN Pickup_Locations AS PL ON Co.Company_ID = PL.Company_ID
		JOIN Cities AS C ON PL.City_ID = C.City_ID
		JOIN Counties AS CT ON C.County_ID = CT.County_ID
		JOIN States AS S ON CT.State_ID = S.State_ID
GO