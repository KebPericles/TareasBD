-- Stored Procedure: D_Usuario (con eliminación en cascada mediante Trigger)
-- DROP TRIGGER IF EXISTS eliminar_usuario_cascada;
-- DELIMITER //

-- CREATE TRIGGER eliminar_usuario_cascada
-- BEFORE DELETE ON Usuarios
-- FOR EACH ROW
-- BEGIN
--  DELETE FROM carpetas WHERE idUsuario = OLD.idUsuario;
--    DELETE FROM tareas WHERE idUsuario = OLD.idUsuario;
-- END //

-- DELIMITER ;

DROP PROCEDURE IF EXISTS D_Usuario;
DELIMITER //
CREATE PROCEDURE D_Usuario(
  IN p_idUsuario INT
)
BEGIN

  IF NOT EXISTS (SELECT * FROM usuarios WHERE idUsuario = p_idUsuario) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de usuario no existe.';
  ELSE
    
    DELETE FROM tareas WHERE idUsuario = p_idUsuario;
    
    DELETE FROM carpetas WHERE idUsuario = p_idUsuario;
    
	DELETE FROM usuarios WHERE idUsuario = p_idUsuario;
  END IF;
END //
DELIMITER ;

-- call D_Usuario(11);