-- Stored Procedure: G_Usuario
DROP PROCEDURE IF EXISTS G_Usuario;
DELIMITER //
CREATE PROCEDURE G_Usuario(
  IN p_idUsuario INT
)
BEGIN
  IF NOT EXISTS (SELECT * FROM usuarios WHERE idUsuario = p_idUsuario) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de usuario no existe.';
  ELSE
    SELECT * FROM usuarios WHERE idUsuario = p_idUsuario;
  END IF;
END //
DELIMITER ;

-- CALL G_Usuario(8);