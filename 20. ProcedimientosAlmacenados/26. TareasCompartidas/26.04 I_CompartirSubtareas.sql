-- I_CompartirSubtareas
-- Inserta todas las subtareas de una tarea compartida

DROP PROCEDURE IF EXISTS I_CompartirSubtareas;

DELIMITER //
CREATE PROCEDURE I_CompartirSubtareas(
	IN p_idTareaPadre INT,
	IN p_idUsuario INT
)BEGIN

DECLARE v_idSubtarea INT;
DECLARE var_final_st INT DEFAULT 0;

DECLARE c_subtareas CURSOR FOR SELECT idTarea FROM tareas WHERE idTareaPadre = p_idTareaPadre;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final_st = 1;

OPEN c_subtareas;

FETCH c_subtareas INTO v_idSubtarea;
WHILE NOT var_final_st = 1 DO

	CALL I_CompartirTarea(v_idSubtarea, p_idUsuario);

	FETCH c_subtareas INTO v_idSubtarea;
END WHILE;
CLOSE c_subtareas;

END //
DELIMITER ;