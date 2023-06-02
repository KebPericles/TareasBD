-- G_Tarea
-- Obtener tarea por id

DROP PROCEDURE IF EXISTS G_Tarea;
DELIMITER //
CREATE PROCEDURE G_Tarea
	(
		in p_idTarea int
    )
BEGIN
    SELECT * FROM tareas where idTarea=p_idTarea;
END //
DELIMITER ;