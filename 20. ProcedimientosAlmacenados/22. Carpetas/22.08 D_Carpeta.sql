-- Stored Procedure: D_Carpeta
DROP PROCEDURE IF EXISTS D_Carpeta;
DELIMITER //

CREATE PROCEDURE D_Carpeta(
    IN p_idCarpeta INT
)
BEGIN
    -- Verificar si la carpeta existe
    IF NOT EXISTS (SELECT * FROM carpetas WHERE idCarpeta = p_idCarpeta) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Carpeta inválida';
    ELSE
		DELETE FROM carpetas WHERE idCarpeta = p_idCarpeta;

        DELETE FROM carpetas WHERE idCarpetaPadre = p_idCarpeta;

        DELETE FROM carpetas WHERE idCarpeta = p_idCarpeta;
    END IF;
END //

DELIMITER ;

-- call D_Carpeta(17);