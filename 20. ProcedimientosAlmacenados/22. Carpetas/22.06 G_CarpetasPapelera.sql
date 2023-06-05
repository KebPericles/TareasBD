-- Stored Procedure: G_CarpetasPapelera
DROP PROCEDURE IF EXISTS G_CarpetasPapelera;
DELIMITER //
CREATE PROCEDURE G_CarpetasPapelera(
    IN p_idUsuario INT
)
BEGIN
    IF NOT EXISTS (SELECT * FROM usuarios WHERE idUsuario = p_idUsuario) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Usuario inválido';
    ELSE
        SELECT * FROM carpetas
        WHERE idUsuario = p_idUsuario AND EnPapelera = TRUE;
    END IF;
END //
DELIMITER ;
-- CALL G_CarpetasPapelera(10);


