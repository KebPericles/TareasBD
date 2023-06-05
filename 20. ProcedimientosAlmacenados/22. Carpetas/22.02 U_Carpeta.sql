-- Stored Procedure: U_Carpeta
USE bd_tareas;
DROP PROCEDURE IF EXISTS U_Carpeta;
DELIMITER //
CREATE PROCEDURE U_Carpeta(
  IN p_idCarpeta INT,
  IN p_Nombre VARCHAR(255)
)
BEGIN
  IF NOT EXISTS (SELECT idCarpeta FROM carpetas WHERE idCarpeta = p_idCarpeta) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de carpeta no existe.';
  ELSE
    IF EXISTS (SELECT nombre FROM carpetas WHERE nombre = p_Nombre) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre de carpeta ya está en uso.';
    ELSE
      -- Actualizar el nombre de la subcarpeta
      UPDATE carpetas SET nombre = p_Nombre WHERE idCarpeta = p_idCarpeta;
    END IF;
  END IF;
END //
DELIMITER ;
-- CALL U_Carpeta(16, 'CarpetaPruebaModif');