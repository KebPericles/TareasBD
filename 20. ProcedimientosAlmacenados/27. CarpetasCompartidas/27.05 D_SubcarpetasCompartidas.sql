-- D_SubcarpetasCompartidas
-- Elimina todas las subcarpetas compartidas de una carpeta compartida

DROP PROCEDURE IF EXISTS D_SubcarpetasCompartidas;

DELIMITER //
CREATE PROCEDURE D_SubcarpetasCompartidas(
	IN p_idCarpetaPadre INT,
	IN p_idUsuario INT
)BEGIN

DECLARE v_idSubcarpeta INT;
DECLARE var_final_sc INT DEFAULT 0;

DECLARE c_subcarpetas CURSOR FOR SELECT idCarpeta FROM carpetas WHERE idCarpetaPadre = p_idCarpetaPadre;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET var_final_sc = 1;

OPEN c_subcarpetas;

FETCH c_subcarpetas INTO v_idSubcarpeta;
WHILE NOT var_final_sc = 1 DO

	CALL D_CarpetaCompartida(v_idSubcarpeta, p_idUsuario);

	FETCH c_subcarpetas INTO v_idSubcarpeta;
END WHILE;
CLOSE c_subcarpetas;

END //
DELIMITER ;
