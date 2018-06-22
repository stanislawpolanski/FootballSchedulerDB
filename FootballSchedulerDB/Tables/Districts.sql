CREATE TABLE [dbo].[Districts]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] VARCHAR(50) NOT NULL, 
    [ParentId] INT NULL
)

GO

CREATE UNIQUE INDEX [Name_Unique] ON [dbo].[Districts] ([Name])
