-- Stored Procedure: U_CarpetaAPapelera
-- use bd_tareas;
DROP PROCEDURE IF EXISTS U_CarpetaAPapelera;
DELIMITER //
CREATE PROCEDURE U_CarpetaAPapelera(
  IN p_idCarpeta INT
)
BEGIN
  -- Verificar que el ID de carpeta existe en la tabla de Carpetas
  IF NOT EXISTS (SELECT * FROM carpetas WHERE idCarpeta = p_idCarpeta) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de carpeta no existe.';
  ELSE
    -- Mover las tareas relacionadas a la papelera
    UPDATE tareas SET enPapelera = TRUE WHERE idCarpeta = p_idCarpeta;

    -- Mover las subcarpetas relacionadas a la papelera recursivamente
    UPDATE carpetas SET enPapelera = TRUE WHERE idCarpetaPadre = p_idCarpeta;

    -- Mover la carpeta actual a la papelera
    UPDATE carpetas SET enPapelera = TRUE WHERE idCarpeta = p_idCarpeta;
  END IF;
END //
DELIMITER ;
-- CALL U_CarpetaAPapelera(17);
-- SELECT * FROM carpetas;
-- SET SQL_SAFE_UPDATES = 0;
