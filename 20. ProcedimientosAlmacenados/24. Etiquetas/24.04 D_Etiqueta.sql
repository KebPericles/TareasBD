-- D_Etiqueta
-- Borra una etiqueta por su id

DROP PROCEDURE IF EXISTS D_Etiqueta;

DELIMITER //
CREATE PROCEDURE D_Etiqueta
(
        IN p_idEtiqueta INT
)
BEGIN
        DELETE FROM etiquetas
                WHERE idEtiqueta = p_idEtiqueta;
END //
DELIMITER ;