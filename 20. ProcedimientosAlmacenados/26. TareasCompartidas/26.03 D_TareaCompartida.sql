-- D_TareaCompartida
-- Borra el acceso de un usuario a una tarea y sus descendientes

DELIMITER //
CREATE PROCEDURE D_TareaCompartida(
        IN p_idTarea INT,
        IN p_idUsuario INT
) BEGIN

DELETE FROM TareasCompartidas WHERE
        idTarea = p_idTarea
        AND idUsuario = p_idUsuario;

END //
DELIMITER ;