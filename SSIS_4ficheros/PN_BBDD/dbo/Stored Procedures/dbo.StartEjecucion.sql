/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

CREATE PROCEDURE dbo.[StartEjecucion]
(
	@EjecucionId AS UNIQUEIDENTIFIER = NULL,
	@NombrePaquete AS VARCHAR(50) = NULL
)
AS
BEGIN

	IF (@EjecucionId IS NULL) 
	BEGIN
		SET @EjecucionId = NEWID()
	END

	INSERT INTO LOG_Ejecuciones
	(EjecucionId, EjecucionFecha, EjecucionPaqueteNombre, EjecucionEstado, EjecucionMensaje)
	VALUES
	(@EjecucionId, GETDATE(), @NombrePaquete, 'Start', @NombrePaquete+' Start')

	
END

