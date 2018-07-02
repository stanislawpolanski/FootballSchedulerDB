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
	AwayScore int
)
AS
BEGIN
	INSERT @returntable
	SELECT
		TimeOfPlay, HomeTeamId, AwayTeamId, HomeScore, AwayScore
		from dbo.Matches
		where dbo.Matches.LeagueId = @LeagueId
	RETURN
END