-- D_CarpetaCompartida
-- Borra un registro de carpeta y usuario

DROP PROCEDURE IF EXISTS D_CarpetaCompartida;

DELIMITER //
CREATE PROCEDURE D_CarpetaCompartida(
        IN p_idCarpeta INT,
        IN p_idUsuario INT
)BEGIN

DELETE FROM CarpetasCompartidas WHERE
        idCarpeta = p_idCarpeta
        AND idUsuario = p_idUsuario;

END //
DELIMITER ;