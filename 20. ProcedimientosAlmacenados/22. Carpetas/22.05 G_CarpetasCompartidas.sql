-- Procedure G_CarpetasCompartidas
DROP PROCEDURE IF EXISTS G_CarpetasCompartidas;
DELIMITER //

CREATE PROCEDURE G_CarpetasCompartidas(
    IN p_idUsuario INT
)
BEGIN
    IF NOT EXISTS (SELECT * FROM usuarios WHERE idUsuario = p_idUsuario) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Usuario inválido';
    ELSE
        SELECT * FROM carpetas c
        INNER JOIN carpetascompartidas cc ON c.idCarpeta = cc.idCarpeta
        WHERE cc.idUsuario = p_idUsuario;
    END IF;
END //
DELIMITER ;
-- CALL G_CarpetasCompartidas(8);