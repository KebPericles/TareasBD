-- G_SubareaPorTarea
-- Buscar subtarea por tarea

DROP PROCEDURE IF EXISTS G_SubtareasPorTareas;

DELIMITER //
CREATE PROCEDURE G_SubtareasPorTareas(
	in p_idTareaPadre int
)
BEGIN
    SELECT * FROM tareas where idTareaPadre = p_idTareaPadre;
END //
DELIMITER ;