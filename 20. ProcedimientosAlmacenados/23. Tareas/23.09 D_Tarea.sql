-- D_Tarea
-- Borrar una tarea por su ID

DROP PROCEDURE IF EXISTS D_Tarea;
DELIMITER //

CREATE PROCEDURE D_Tarea(
    IN p_idTarea INT
)
BEGIN
    -- Verificar si la tarea existe
    IF NOT EXISTS (SELECT * FROM tareas WHERE idTarea = p_idTarea) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tarea inválida';
    ELSE

        DELETE FROM tareas WHERE idTareaPadre = p_idTarea;

		DELETE FROM tareas WHERE idTarea = p_idTarea;

    END IF;
END //

DELIMITER ;