-- U_TareaAPapelera
-- Mandar Tarea a Papelera
use bd_tareas;

DROP PROCEDURE IF EXISTS U_TareaAPapelera;
DELIMITER //

CREATE PROCEDURE U_TareaAPapelera(
    IN p_idTarea INT
)
BEGIN
    -- Verificar si la tarea existe
    IF NOT EXISTS (SELECT * FROM tareas WHERE idTarea = p_idTarea) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Tarea inválida';
    ELSE
            -- Actualizar el nombre de la subcarpeta
			UPDATE tareas SET 
            enPapelera = true
			WHERE idTareaPadre = p_idTarea;
            
            UPDATE tareas SET 
            enPapelera = true
			WHERE idTarea = p_idTarea;
	END IF;
END //
DELIMITER ;
