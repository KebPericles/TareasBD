-- G_TareasEtiqueta
-- Busca todas las tareas asociadas a una etiqueta

DROP PROCEDURE IF EXISTS G_TareasEtiqueta;

DELIMITER //
CREATE PROCEDURE G_TareasEtiqueta
(
        IN p_idEtiqueta INT
)
BEGIN 
        SELECT * FROM TareasEtiquetas
                WHERE idEtiqueta = p_idEtiqueta;
END //
DELIMITER ;