-- I_CompartirTarea
-- Nueva tarea compartida a otro usuario

DROP PROCEDURE IF EXISTS I_CompartirTarea;

DELIMITER //
CREATE PROCEDURE I_CompartirTarea (
	IN p_idTarea INT,
	IN p_idUsuario INT
) BEGIN

INSERT INTO tareascompartidas(
	idTarea,
	idUsuario,
	fechaCompartida
)
VALUES (
	p_idTarea,
	p_idUsuario,
	CURDATE()
);

CALL I_CompartirSubtareas(p_idTarea, p_idUsuario);

END //
DELIMITER ;