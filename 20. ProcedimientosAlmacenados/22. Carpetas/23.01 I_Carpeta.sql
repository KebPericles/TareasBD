-- I_Carpeta
-- Nueva Carpeta

DROP PROCEDURE IF EXISTS I_Carpeta;
DELIMITER //
CREATE PROCEDURE I_Carpeta
	(
    in p_idUsuario INT,
    in p_idCarpetaPadre INT,
    in p_nombre VARCHAR(45)
    )
BEGIN
	IF EXISTS(select *from Carpetas where nombre = p_nombre)
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una carpeta con el mismo nombre y misma posicion';
	ELSEIF (p_nombre is null or p_nombre='')
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre de la carpeta nos puede ser nulo o vacio';
    ELSE
		INSERT INTO Carpetas value(default,p_idUsuario,p_idCarpetaPadre,p_nombre,FALSE);
    END IF;
END //
DELIMITER ;
