-- D_TareaEtiqueta
-- Elimina la asignacion de una etiqueta a una tarea

DROP PROCEDURE IF EXISTS D_TareaEtiqueta;

DELIMITER //
CREATE PROCEDURE D_TareaEtiqueta
(
        IN p_idTarea INT,
        IN p_idEtiqueta INT
)
BEGIN
        DELETE FROM TareasEtiquetas WHERE 
                idEtiqueta = p_idEtiqueta
                AND idTarea = p_idTarea;
END //
DELIMITER ;