-- Stored Procedure: I_Usuario
DROP PROCEDURE IF EXISTS I_Usuario;
DELIMITER //

CREATE PROCEDURE I_Usuario(
  IN p_correo VARCHAR(255),
  IN p_contrasena VARCHAR(255),
  IN p_nombre VARCHAR(255),
  IN p_apellido VARCHAR(255)
)
BEGIN
  IF p_correo IS NULL OR p_contraseña IS NULL THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo y la contraseña son obligatorios.';
  ELSE
    IF EXISTS (SELECT idUsuario, correo, contrasena, nombre, apellido FROM usuarios WHERE correo = p_correo) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico ya está en uso.';
    ELSE
      INSERT INTO usuarios (correo, contrasena, nombre, apellido)
      VALUES (p_correo, p_contrasena, p_nombre, p_apellido);
    END IF;
  END IF;
END //
DELIMITER ;

-- call I_Usuario('correoprueba@gmail.com', 'contraseña','javier','west');
