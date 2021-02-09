CREATE PROCEDURE [dbo].[AddToDatabase]
	@name varchar(25) = null,
	--for Customers/Drivers
	@age int = null,
	@sex varchar(10) = null,
	--for Drivers specifically
	@registered_car int = null,
	@license varchar(10) = null,
	@state varchar(30) = null,
	--for Pickup Locations and Order Item Info
	@company varchar(30) = null,
	--for just Pickups
	@city varchar(30) = null,
	--for just Order Item Info
	@price smallmoney = null,
	--for Companies
	@location_type varchar(30) = null,
	@date_started datetime = null,
	--for Registered Cars
	@make varchar(20) = null,
	@model varchar(20) = null,
	--qualifier
	@option varchar(20)
AS
begin
	declare @stateid int = (select State_ID from States where State_Name = @state)
	declare @cityid int = (select City_ID from Cities where City_Name = @city)
	declare @clientid int = (select Client_ID from Companies where Company_Name = @company)
	--Add a Customer
	if @option = 'customer'
	begin
		insert into Customers values(@name, @age, @sex)
		return
	end
	--Add a Driver
	if @option = 'driver'
	begin
		insert into Drivers values(@license, @name, @age, @sex, @registered_car, @stateid)
		return
	end
	--Add a Registered Car
	if @option = 'car'
	begin
		insert into Registered_Cars values(@make, @model)
		return
	end
	--Add a Pickup Location for a company
	if @option = 'pickup'
	begin
		insert into Pickup_Locations values(@clientid, @cityid)
		return
	end
	--Add an Item for a company
	if @option = 'menu'
	begin
		insert into Order_Item_Info values(@clientid, @name, @price)
		return
	end
	--Add a Company
	if @option = 'company'
	begin
		insert into Companies values(@name, @location_type, @date_started)
		return
	end
end