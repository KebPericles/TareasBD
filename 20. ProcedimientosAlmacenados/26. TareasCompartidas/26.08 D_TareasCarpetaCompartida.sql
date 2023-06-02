-- D_TareasCarpetaCompartida
-- Inserta todas las tareas de una carpeta compartida

DROP PROCEDURE IF EXISTS D_TareasCarpetaCompartida;

DELIMITER //
CREATE PROCEDURE D_TareasCarpetaCompartida(
	IN p_idCarpeta INT,
	IN p_idUsuario INT
)BEGIN

DECLARE v_idTarea INT;
DECLARE var_final INT DEFAULT 0;

DECLARE c_tareas CURSOR FOR SELECT idTarea FROM tareas WHERE idCarpeta = p_idCarpeta AND idTareaPadre = NULL;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1;

OPEN c_tareas;

FETCH c_tareas INTO v_idTarea;
WHILE NOT var_final = 1 DO

	CALL D_TareaCompartida(v_idTarea, p_idUsuario);

	FETCH c_tareas INTO v_idTarea;
END WHILE;
CLOSE c_tareas;

END //
DELIMITER ;