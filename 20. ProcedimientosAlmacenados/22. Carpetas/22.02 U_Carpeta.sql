-- Stored ProceduridUsuario INTO @idUsuario: U_Carpeta
DROP PROCEDURE IF EXISTS U_Carpeta;
DELIMITER //
CREATE PROCEDURE U_Carpeta(
  IN p_idCarpeta INT,
  IN p_Nombre VARCHAR(255)
)
BEGIN
  -- Verificar que el ID de carpeta existe en la tabla de Carpetas
  IF NOT EXISTS (SELECT * FROM carpetas WHERE idCarpeta = p_idCarpeta) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de carpeta no existe.';
  ELSE
    SELECT idUsuario INTO @idUsuario FROM carpetas WHERE idCarpeta = p_idCarpeta;
    -- Verificar que el nombre de la carpeta no esté en uso por otra carpeta
    IF EXISTS (SELECT * FROM carpetas WHERE Nombre = p_Nombre AND idUsuario = @idUsuario) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre de carpeta ya está en uso.';
    ELSE
      -- Actualizar el nombre de la subcarpeta
      UPDATE carpetas SET Nombre = p_Nombre WHERE idCarpeta = p_idCarpeta;
    END IF;
  END IF;
END //
DELIMITER ;
	-- select * from carpetas;
-- CALL U_Carpeta(16, 'CarpetaPruebaModif');
