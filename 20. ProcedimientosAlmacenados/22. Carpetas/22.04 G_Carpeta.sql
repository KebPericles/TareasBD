-- Stored Procedure: G_Carpetas
DROP PROCEDURE IF EXISTS G_Carpetas;
DELIMITER //
CREATE PROCEDURE G_Carpetas(
    IN p_idUsuario INT
)
BEGIN
    
    IF NOT EXISTS (SELECT * FROM usuarios WHERE idUsuario = p_idUsuario) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Usuario inválido';
    ELSE
        SELECT idCarpeta, idUsuario, idCarpetaPadre, nombre, enPapelera FROM carpetas
        WHERE idUsuario = p_idUsuario;
    END IF;
END //
DELIMITER ;
-- CALL G_Carpetas(4);