CREATE TABLE [dbo].[Teams]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [DistrictId] INT NOT NULL, 
    CONSTRAINT [FK_Teams_To_Districts] FOREIGN KEY ([DistrictId]) REFERENCES [Districts]([Id])
)
