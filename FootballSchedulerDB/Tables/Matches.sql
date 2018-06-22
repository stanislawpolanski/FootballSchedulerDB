CREATE TABLE [dbo].[Matches]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [LeagueId] INT NOT NULL, 
    [Date] DATETIME NOT NULL, 
    [HomeTeamId] INT NOT NULL, 
    [AwayTeamId] INT NOT NULL, 
    [HomeScore] INT NULL, 
    [AwayScore] INT NULL, 
    CONSTRAINT [FK_Matches_To_Leagues] FOREIGN KEY ([LeagueId]) REFERENCES [Leagues]([Id]), 
    CONSTRAINT [FK_Matches_HomeTeam_To_Teams] FOREIGN KEY ([HomeTeamId]) REFERENCES [Teams]([Id]), 
    CONSTRAINT [FK_Matches_AwayTeam_To_Teams] FOREIGN KEY ([AwayTeamId]) REFERENCES [Teams]([Id]), 
    CONSTRAINT [CK_Matches_HomeScore] CHECK ((HomeScore >= 0 and HomeScore < 65) or (HomeScore IS NULL)),
	CONSTRAINT [CK_Matches_AwayScore] CHECK ((AwayScore >= 0 and AwayScore < 65) or (AwayScore IS NULL))
)
