# Football scheduler DB
This project is made for training purposes. It is a part of the football scheduler windows app:
https://github.com/stanislawpolanski/FootballSchedulerWPF

This project contains of following elements.
## Tables
+ Districts - storing names of districts and their parent districts (eg. Poland - Małopolskie region)
+ Leagues - names of leagues
+ Matches - contains results of the matches - who plays against who, scores, time and league.
+ Teams - names of teams and region to which the team belongs
## Functions
+ GetMatchesByLeagueId
+ GetLeagueStandingsByLeagueId
## Data seed
Data seed contains regions in Poland and approx. 450 team's names.