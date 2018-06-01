CREATE TABLE [dbo].[PN_Municipios] (
    [Id]     INT           NOT NULL,
    [Nombre] NVARCHAR (50) NULL,
	[IdProvincia] NVARCHAR (50) NOT NULL
	CONSTRAINT PK_IdMunicipios_IdProvincia PRIMARY KEY CLUSTERED (Id,IdProvincia) 
);

