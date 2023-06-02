-- G_TareaCompartidaConUsuarios
-- Obtener los usuarios con los que se ha compartido una tarea

DROP PROCEDURE IF EXISTS G_TareaCompartidaConUsuarios;

DELIMITER //
CREATE PROCEDURE G_TareaCompartidaConUsuarios(
        IN p_idTarea INT
) BEGIN

SELECT * FROM tareascompartidas WHERE
        idTarea = p_idTarea;

END //
DELIMITER ;