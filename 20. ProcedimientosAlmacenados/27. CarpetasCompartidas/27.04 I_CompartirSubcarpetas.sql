-- I_CompartirSubcarpetas
-- Inserta todas las subtareas de una tarea compartida

DROP PROCEDURE IF EXISTS I_CompartirSubcarpetas;

DELIMITER //
CREATE PROCEDURE I_CompartirSubcarpetas(
	IN p_idCarpetaPadre INT,
	IN p_idUsuario INT
)BEGIN

DECLARE v_idSubcarpeta INT;
DECLARE var_final INT DEFAULT 0;

DECLARE c_subcarpetas CURSOR FOR SELECT idCarpeta FROM carpetas WHERE idCarpetaPadre = p_idCarpetaPadre;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final = 1;

OPEN c_subcarpetas;

FETCH c_subcarpetas INTO v_idSubcarpeta;
WHILE NOT var_final = 1 DO

	CALL I_CompartirCarpeta(v_idSubcarpeta, p_idUsuario);

	FETCH c_subcarpetas INTO v_idSubcarpeta;
END WHILE;
CLOSE c_subcarpetas;

END //
DELIMITER ;