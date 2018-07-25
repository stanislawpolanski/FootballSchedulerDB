CREATE FUNCTION [dbo].[GetMatchesByLeagueId]
(
	@LeagueId int
)
RETURNS @returntable TABLE
(
	TimeOfPlay datetime,
	HomeTeamId int,
	AwayTeamId int,
	HomeScore int,
	AwayScore int,
	HomeTeamName varchar(50),
	AwayTeamName varchar(50)
)
AS
BEGIN
	INSERT @returntable
	SELECT
		TimeOfPlay, HomeTeamId, AwayTeamId, HomeScore, AwayScore, HomeTeamsNames.Name as HomeTeamName, AwayTeamsNames.Name as AwayTeamName
		FROM dbo.Matches
		LEFT JOIN dbo.teams AS HomeTeamsNames ON HomeTeamId = HomeTeamsNames.Id
		LEFT JOIN dbo.teams AS AwayTeamsNames ON AwayTeamId = AwayTeamsNames.Id
		WHERE dbo.Matches.LeagueId = @LeagueId
	RETURN
END