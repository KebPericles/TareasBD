-- Stored Procedure: U_CarpetaAPapelera
-- use bd_tareas;
DROP PROCEDURE IF EXISTS U_CarpetaAPapelera;
DELIMITER //
CREATE PROCEDURE U_CarpetaAPapelera(
  IN p_idCarpeta INT
)
BEGIN
  IF NOT EXISTS (SELECT idCarpeta, idUsuario, idCarpetaPadre, nombre, enPapelera FROM carpetas WHERE idCarpeta = p_idCarpeta) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de carpeta no existe.';
  ELSE
    
    UPDATE tareas SET EnPapelera = 1 WHERE idCarpeta = p_idCarpeta;

    UPDATE carpetas SET EnPapelera = 1 WHERE idCarpetaPadre = p_idCarpeta;

    UPDATE carpetas SET EnPapelera = 1 WHERE idCarpeta = p_idCarpeta;
  END IF;
END //
DELIMITER ;
-- CALL U_CarpetaAPapelera(19);
-- SELECT * FROM carpetas;