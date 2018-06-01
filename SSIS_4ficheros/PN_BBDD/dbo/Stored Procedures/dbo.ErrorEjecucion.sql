CREATE PROCEDURE dbo.ErrorEjecucion
	@EjecucionId AS UNIQUEIDENTIFIER = NULL,
	@PaqueteNombre AS NVARCHAR(50) = NULL,
	@ErrorDescripcion AS NVARCHAR(255) = NULL
AS
BEGIN

DECLARE @EstadoDesc AS NVARCHAR(10)
DECLARE @ErrorMensaje AS NVARCHAR(500)

 BEGIN TRY

	SELECT @EstadoDesc = 'Finish KO'

	-- Insertamos el log.
	INSERT INTO LOG_Ejecuciones
	(EjecucionId, EjecucionFecha, EjecucionPaqueteNombre, EjecucionEstado, EjecucionMensaje)
	VALUES
	(@EjecucionId, GETDATE(), @PaqueteNombre, @EstadoDesc, @ErrorMensaje)

  END TRY
  BEGIN CATCH
    SET @ErrorMensaje = 'EjecucionId, PackageId and EjecucionStatus must be defined and exist in the database.' + CHAR(13) + 'System return : ' + ERROR_MESSAGE();
	THROW 50000, @ErrorMensaje ,1;
  END CATCH


END