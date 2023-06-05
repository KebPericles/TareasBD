-- Stored Procedure: G_CarpetasBuscar
DROP PROCEDURE IF EXISTS G_CarpetasBuscar;
DELIMITER //
CREATE PROCEDURE G_CarpetasBuscar(
    IN p_nombreCarpeta VARCHAR(255)
)
BEGIN

    IF NOT EXISTS (SELECT idCarpeta, idUsuario, idCarpetaPadre, nombre, enPapelera FROM carpetas WHERE nombre LIKE CONCAT('%', p_nombreCarpeta, '%')) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Nombre de carpeta inválido';
    ELSE
        SELECT idCarpeta, idUsuario, idCarpetaPadre, nombre, enPapelera FROM carpetas
        WHERE nombre LIKE CONCAT('%', p_nombreCarpeta, '%');
    END IF;
END //
DELIMITER ;

-- CALL G_CarpetasBuscar('CarpetaPrueba2');