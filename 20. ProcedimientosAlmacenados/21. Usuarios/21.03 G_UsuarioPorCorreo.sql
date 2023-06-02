-- Stored Procedure: G_UsuarioPorCorreo
DROP PROCEDURE IF EXISTS G_UsuarioPorCorreo;
DELIMITER //
CREATE PROCEDURE G_UsuarioPorCorreo(
  IN p_correo VARCHAR(255)
)
BEGIN
  -- Verificar que el correo electrónico exista en la tabla
  IF NOT EXISTS (SELECT * FROM usuarios WHERE correo = p_correo) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El correo electrónico no existe.';
  ELSE
    SELECT * FROM usuarios WHERE correo = p_correo;
  END IF;
END //
DELIMITER ;

-- CALL G_UsuarioPorCorreo('john.doe@example.com');