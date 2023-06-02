-- I_CompartirCarpeta
-- Nueva carpeta compartida a otro usuario

DROP PROCEDURE IF EXISTS I_CompartirCarpeta;

DELIMITER //
CREATE PROCEDURE I_CompartirCarpeta(
        IN p_idCarpeta INT,
        IN p_idUsuario INT
)BEGIN

INSERT INTO carpetascompartidas(
        idCarpeta,
        idUsuario,
        fechaCompartida
) VALUES (
        p_idCarpeta,
        p_idUsuario,
        CURDATE()
);

CALL I_CompartirSubcarpetas(p_idCarpeta, p_idUsuario);

CALL I_CompartirTareasCarpeta(p_idCarpeta, p_idUsuario);

END //
DELIMITER ;