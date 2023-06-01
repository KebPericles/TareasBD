-- I_Etiqueta

DROP PROCEDURE IF EXISTS I_Etiqueta;

DELIMITER //
CREATE PROCEDURE I_Etiqueta 
(
        IN p_idUsuario INT,
        IN p_nombre VARCHAR(45)
)
BEGIN
        INSERT INTO etiquetas(idUsuario, nombre) VALUES (p_idUsuario,p_nombre);
END //
DELIMITER ;
GO