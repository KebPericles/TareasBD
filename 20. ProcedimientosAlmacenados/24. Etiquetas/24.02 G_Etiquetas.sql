-- G_Etiquetas
-- Obtener las etiquetas de un usuario

DROP PROCEDURE IF EXISTS G_Etiquetas;

DELIMITER //
CREATE PROCEDURE G_Etiquetas
(
        IN p_idUsuario INT
)
BEGIN

        SELECT * FROM etiquetas WHERE idUsuario = p_idUsuario;

END //
DELIMITER ;