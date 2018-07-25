CREATE FUNCTION [dbo].[GetLeagueStandingsByLeagueId]
(
	@LeagueId int
)
RETURNS TABLE
AS

RETURN
(
	select
	Player,
	dbo.Teams.Name as TeamName,
	count(Player) as Played,
	sum(wins * 3 + draws) as Points,
	sum(PlayerScore) as GoalsFor,
	sum(OpponentScore) as GoalsAgainst,
	sum(PlayerScore - OpponentScore) as GoalsDifference,
	sum(wins) as Won,
	sum(draws) as Drawn,
	sum(loses) as Lost

	from
	(
		select 
			HomeTeamId as Player, 
			HomeScore as PlayerScore, 
			AwayScore as OpponentScore, 
			case when HomeScore > AwayScore then 1 else 0 end as wins,
			case when HomeScore = AwayScore then 1 else 0 end as draws,
			case when HomeScore < AwayScore then 1 else 0 end as loses

			from dbo.Matches
			where HomeScore is not null and dbo.Matches.LeagueId = @LeagueId

		union all
		select 
			AwayTeamId as Player, 
			AwayScore as PlayerScore, 
			HomeScore as OpponentScore, 
			case when HomeScore < AwayScore then 1 else 0 end as wins,
			case when HomeScore = AwayScore then 1 else 0 end as draws,
			case when HomeScore > AwayScore then 1 else 0 end as loses

			from dbo.Matches
			where AwayScore is not null and dbo.Matches.LeagueId = @LeagueId
	) as teamsResults

	left join dbo.Teams on Player = dbo.Teams.Id
	group by Player, dbo.Teams.Name
)