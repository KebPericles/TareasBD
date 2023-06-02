-- D_SubtareasCompartidas
-- Elimina todas las subtareas compartidas de una tarea compartida

DROP PROCEDURE IF EXISTS D_SubtareasCompartidas;

DELIMITER //
CREATE PROCEDURE D_SubtareasCompartidas(
	IN p_idTareaPadre INT,
	IN p_idUsuario INT
)BEGIN

DECLARE v_idSubtarea INT;
DECLARE var_final INT DEFAULT 0;

DECLARE c_subtareas CURSOR FOR SELECT idTarea FROM tareas WHERE idTareaPadre = p_idTareaPadre;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1;

OPEN c_subtareas;

FETCH c_subtareas INTO v_idSubtarea;
WHILE NOT var_final = 1 DO

	CALL D_TareaCompartida(v_idSubtarea, p_idUsuario);

	FETCH c_subtareas INTO v_idSubtarea;
END WHILE;
CLOSE c_subtareas;

END //
DELIMITER ;
