CREATE FUNCTION [dbo].[f_CalculateTax]
(
	@state varchar(12) = 0,
	@orderAmt smallmoney
)
RETURNS smallmoney
AS
BEGIN
	DECLARE @tax float = (SELECT Tax_Rate FROM States WHERE State_Name = @state)
RETURN @orderAmt * (1 + @tax/100)
END
