# Football Scheduler database sketch
Database project includes tables design, relations and functions.
## Tables
List of tables:
+ Matches
+ Teams
+ Leagues
+ Districts
### Matches
Contains such columns:
+ Id - int, primary key, identity
+ league id - int, foreign key, rel. to leagues, not null
+ TimeOfPlay - datetime of the match, not null
+ HomeTeamId - int, foreign key to teams, not null
+ awayteamId - aa.
+ homescore - int, default null
+ awayscore - int, default null

Table constraints:
homescore, awayscore  >= 0, < 65 or null
### Teams
+ Id - int, primary key, identity
+ Name - varchar(50), unique, not null
+ District - int, foreign key to districts, not null
### Leagues
+ Id - int, primary, identity
+ Name - varchar(50), not null

### Districts
+ Id - int, primary, identity
+ Name - varchar(50), unique, not null
+ ParentId - int

## Functions, views
Following functions to be implemented:
+ function GetMatchesByLeagueId(int LeagueId) - returns full rows from matches. Must include team names joined from teams.
+ function GetLeagueStandingsByLeagueId(int LeagueId) - 
returns table who's first, second etc. 

## Data seed
As a merge function, teams from Polish league 1-3 and some other minor teams. 
Approx. 400-450 teams. Also regions, and small test league with test matches.