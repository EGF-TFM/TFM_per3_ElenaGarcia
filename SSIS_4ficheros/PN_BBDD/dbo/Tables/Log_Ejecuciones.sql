CREATE TABLE [dbo].[Log_Ejecuciones]
(
	[EjecucionId] UNIQUEIDENTIFIER NOT NULL,
	[EjecucionFecha] DATETIME NOT NULL,
	[EjecucionPaqueteNombre] NVARCHAR(50) NOT NULL,
	[EjecucionEstado] NVARCHAR(50) NOT NULL, 
	--[RowsInsertInFact] INT prueba,
    [EjecucionMensaje] NVARCHAR(MAX) NULL,
	[RowsInLog] INT,
	CONSTRAINT PK_Ejecuciones PRIMARY KEY NONCLUSTERED (EjecucionId,EjecucionPaqueteNombre,EjecucionFecha)
)
