CREATE VIEW [dbo].[GetLeaguePlayYears]
	as select year(StartDate) as YearsOfPlay from dbo.Leagues group by StartDate
