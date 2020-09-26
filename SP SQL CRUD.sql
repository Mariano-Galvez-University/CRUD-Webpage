/*
	Autor: José Furlán
	Fecha: 24/09/2020

*/
----- SP para agregar un nuevo cliente -----

CREATE PROC dbo.SPAgregarCliente(
	@_TxtNit			NVARCHAR(15),
	@_TxtNombres		NVARCHAR(50),
	@_TxtApellidos		NVARCHAR(50),
	@_TxtDireccion		NVARCHAR(150),
	@_TxtTelefono		NVARCHAR(15),
	@_TxtEmail			NVARCHAR(100),
	@_TxtSexo			CHAR(1),
	@_EsClienteFrecuente TINYINT
)
AS
DECLARE @_FilasAfectadas		TINYINT
		,@_Resultado			SMALLINT
		,@_UltimoId				SMALLINT
		,@_IdCliente			INT
BEGIN
BEGIN TRAN
	--SE OBTIENE EL ULTIMO ID INGRESADO EN LA TABLA
	SELECT	@_UltimoId			=	ISNULL(MAX(a.IdCliente),0)
	FROM	dbo.TblClientes	AS	a
	
	BEGIN TRY
		INSERT INTO dbo.TblClientes(
											IdCliente,
											TxtNit,
											TxtNombres,
											TxtApellidos,
											TxtDireccion,
											TxtTelefono,
											TxtEmail,
											TxtSexo,	
											EsClienteFrecuente
										)
		VALUES							(
											@_UltimoId + 1,
											@_TxtNit,
											@_TxtNombres,
											@_TxtApellidos,
											@_TxtDireccion,
											@_TxtTelefono,
											@_TxtEmail,
											@_TxtSexo,
											@_EsClienteFrecuente
										)
		SET @_FilasAfectadas			=	@@ROWCOUNT
	END TRY
	BEGIN CATCH
		SET @_FilasAfectadas			=	0
	END CATCH		

--DETERMINAR SI SE REALIZO CORRECTAMENTE LA TRANSACCION ANTERIOR
IF (@_FilasAfectadas > 0)
		BEGIN
			SET @_Resultado			=	@_UltimoId + 1
			COMMIT
		END
	ELSE
		BEGIN
			SET @_Resultado			=	0
			ROLLBACK
		END
	--DEVOLVER RESULTADO: EL ULTIMO ID QUE UTILIZARÉ MÁS ADELANTE
	SELECT Resultado				=	@_Resultado
END --FIN


/*
	Autor: José Furlán
	Fecha: 24/09/2020

*/
----- SP para eliminar un cliente -----

CREATE PROC dbo.SPEliminarCliente (
	@_IdCliente INT
)
AS
DECLARE 
	@_FilasAfectadas	TINYINT,
	@_Resultado			INT

BEGIN
	BEGIN TRAN
		BEGIN TRY
			UPDATE	dbo.TblClientes
			SET		IntEstado = 0
					
			WHERE	IdCliente = @_IdCliente

			SET		@_FilasAfectadas = @@ROWCOUNT
		END TRY
		BEGIN CATCH
			SET		@_FilasAfectadas = 0
		END CATCH

		IF(@_FilasAfectadas > 0)
			BEGIN
				SET @_Resultado = @_IdCliente
				COMMIT
			END
		ELSE
			BEGIN
				SET @_Resultado = 0
			ROLLBACK
		END
	SELECT Resultado  = @_Resultado
END

/*
	Autor: José Furlán
	Fecha: 24/09/2020

*/
----- SP para actualizar un cliente -----

CREATE PROC dbo.SPActualizarCliente (
	@_IdCliente			INT,
	@_TxtNit			NVARCHAR(15),
	@_TxtNombres		NVARCHAR(50),
	@_TxtApellidos		NVARCHAR(50),
	@_TxtDireccion		NVARCHAR(150),
	@_TxtTelefono		NVARCHAR(15),
	@_TxtEmail			NVARCHAR(100),
	@_TxtSexo			CHAR(1),
	@_EsClienteFrecuente TINYINT
)

AS
DECLARE 
	@_FilasAfectadas	TINYINT,
	@_Resultado			INT

BEGIN
	BEGIN TRAN
		BEGIN TRY
			UPDATE	dbo.TblClientes
			SET		TxtNit = @_TxtNit,
					TxtNombres = @_TxtNombres,
					TxtApellidos = @_TxtApellidos,
					TxtDireccion = @_TxtDireccion,
					TxtTelefono = @_TxtTelefono,
					TxtEmail = @_TxtEmail,
					TxtSexo = @_TxtSexo,
					EsClienteFrecuente = @_EsClienteFrecuente
					
			WHERE	IdCliente = @_IdCliente

			SET		@_FilasAfectadas = @@ROWCOUNT
		END TRY
		BEGIN CATCH
			SET		@_FilasAfectadas = 0
		END CATCH

		IF(@_FilasAfectadas > 0)
			BEGIN
				SET @_Resultado = @_IdCliente
				COMMIT
			END
		ELSE
			BEGIN
				SET @_Resultado = 0
			ROLLBACK
		END

	SELECT Resultado  = @_Resultado
END

/*
	Autor: José Furlán
	Fecha: 24/09/2020

*/
----- SP para obtener todos los usuarios -----

CREATE PROC dbo.SPObtenerClientes
AS
BEGIN
	SELECT	a.IdCliente,
			a.TxtNit,
			CONCAT(a.TxtNombres,' ',a.TxtApellidos) AS TxtNombres,
			a.TxtDireccion,
			a.TxtTelefono,
			a.TxtEmail,
			a.TxtSexo,
			a.EsClienteFrecuente,
			a.FechaIngreso,
			a.IntEstado

	FROM	dbo.TblClientes AS a
	WHERE	a.IntEstado > 0
END --FIN


/*

	AUTOR: José Furlán
	FECHA: 24/09/2020

*/
----- SP para obtener un cliente en especifico -----

CREATE PROC dbo.SPObtenerDatosCliente(
	@_IdCliente INT
)

AS
BEGIN
	SELECT	a.TxtNit,
			a.TxtNombres,
			a.TxtApellidos,
			a.TxtDireccion,
			a.TxtTelefono,
			a.TxtEmail,
			a.TxtSexo,
			a.EsClienteFrecuente,
			a.FechaIngreso,
			a.IntEstado
	FROM	dbo.TblClientes AS a
	WHERE	a.IdCliente = @_IdCliente
END

