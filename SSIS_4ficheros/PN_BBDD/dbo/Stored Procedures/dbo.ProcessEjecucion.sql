CREATE PROCEDURE dbo.ProcessEjecuion
(
	@EjecucionId AS UNIQUEIDENTIFIER = NULL,
	@PaqueteNombre AS NVARCHAR(50) = NULL,
	@EjecucionEstado AS NVARCHAR(2) = NULL, -- OK or KO
)
AS
BEGIN

DECLARE @MensajeDesc AS NVARCHAR(255)
DECLARE @EstadoDesc AS NVARCHAR(10)
DECLARE @ErrorMensaje AS NVARCHAR(500)

 BEGIN TRY

	SELECT @EstadoDesc = CASE @EjecucionEstado
					   WHEN 'OK' THEN 'Finish OK'
					   WHEN 'KO' THEN 'Finish KO'
					   ELSE NULL
					 END

	SELECT @MensajeDesc = CASE @EstadoDesc
					   WHEN 'Finish OK' THEN 'Procesando paquete ' + @PaqueteNombre + '.'
					   WHEN 'Finish KO' THEN 'Error procesando el paquete ' + @PaqueteNombre + '.'
					   ELSE NULL
					 END

	-- Insertamos el log.
	INSERT INTO LOG_Ejecuciones
	(EjecucionId, EjecucionFecha, EjecucionPaqueteNombre, EjecucionEstado, EjecucionMensaje,RowsInLog)
	VALUES
	(@EjecucionId, GETDATE(), @NombrePaquete, @EstadoDesc, @MensajeDesc,0)

  END TRY
  BEGIN CATCH
    SET @ErrorMessage = 'EjecucionId, PackageId and EjecucionStatus must be defined and exist in the database.' + CHAR(13) + 'System return : ' + ERROR_MESSAGE();
	THROW 50000, @ErrorMessage ,1;
  END CATCH

END	
