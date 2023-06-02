-- G_CarpetaCompartidaConUsuarios
-- Obtener los usuarios con los que se ha compartido una carpeta

DROP PROCEDURE IF EXISTS G_CarpetaCompartidaConUsuarios;

DELIMITER //
CREATE PROCEDURE G_CarpetaCompartidaConUsuarios(
        IN p_idCarpeta INT
)BEGIN

SELECT * FROM CarpetasCompartidas WHERE
        idCarpeta = p_idCarpeta;

END //
DELIMITER ;