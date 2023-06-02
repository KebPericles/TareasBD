-- D_CarpetaCompartida
-- Borra un registro de carpeta y usuario

DROP PROCEDURE IF EXISTS D_CarpetaCompartida;

DELIMITER //
CREATE PROCEDURE D_CarpetaCompartida(
        IN p_idCarpeta INT,
        IN p_idUsuario INT
)BEGIN

SET @@SESSION.max_sp_recursion_depth=25;

DELETE FROM carpetascompartidas WHERE
        idCarpeta = p_idCarpeta
        AND idUsuario = p_idUsuario;

CALL D_SubcarpetasCompartidas(p_idCarpeta, p_idUsuario);

CALL D_TareasCarpetaCompartida(p_idCarpeta, p_idUsuario);

END //
DELIMITER ;