-- D_TareaCompartida
-- Borra el acceso de un usuario a una tarea y sus descendientes

DROP PROCEDURE IF EXISTS D_TareaCompartida;

DELIMITER //
CREATE PROCEDURE D_TareaCompartida(
	IN p_idTarea INT,
	IN p_idUsuario INT
) BEGIN
SET @@SESSION.max_sp_recursion_depth=255;

DELETE FROM tareascompartidas WHERE
	idTarea = p_idTarea
	AND idUsuario = p_idUsuario;

CALL D_SubtareasCompartidas(p_idTarea, p_idUsuario);

END //
DELIMITER ;
