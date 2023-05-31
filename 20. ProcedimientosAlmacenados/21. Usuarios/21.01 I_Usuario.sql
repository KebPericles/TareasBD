-- I_Usuario
--Nuevo usuario

DELIMITER //
CREATE PROCEDURE I_Usuario
	(
    in p_correo VARCHAR(45),
	p_contrasena VARCHAR(45),
	p_nombre VARCHAR(45),
	p_apellido VARCHAR(45)
    )
BEGIN
	IF NOT EXISTS(select *from usuarios where correo = p_correo)
		then INSERT INTO usuarios value(default,p_correo,p_contrasena,p_nombre,p_apellido);
	END IF;
END //
DELIMITER ;