-- G_TareaCompartidaConUsuarios
-- Obtener los usuarios con los que se ha compartido una tarea

DELIMITER //
CREATE PROCEDURE G_TareaCompartidaConUsuarios(
        IN p_idTarea INT
) BEGIN

SELECT * FROM TareasCompartidas WHERE
        idTarea = p_idTarea;

END //
DELIMITER ;