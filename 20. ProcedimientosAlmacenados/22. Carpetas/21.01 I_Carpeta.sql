-- Stored Procedure: I_Carpeta
-- USE bd_tareas;
DROP PROCEDURE IF EXISTS I_Carpeta;
DELIMITER //
CREATE PROCEDURE I_Carpeta(
  IN p_idUsuario INT,
  IN p_idCarpetaPadre INT,
  IN p_Nombre VARCHAR(255),
  IN p_EnPapelera BOOLEAN
)
BEGIN
  IF EXISTS (SELECT * FROM carpetas WHERE nombre = p_nombre) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una carpeta con el mismo nombre y misma posicion';
  ELSEIF (p_nombre IS NULL OR p_nombre='') THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre de la carpeta no puede estar vacio';
  ELSE
    IF NOT EXISTS (SELECT * FROM usuarios WHERE idUsuario = p_idUsuario) THEN
      SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de usuario no existe.';
    ELSE
      IF p_idCarpetaPadre IS NOT NULL AND NOT EXISTS (SELECT * FROM carpetas WHERE idCarpeta = p_idCarpetaPadre) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de carpeta padre no existe.';
      ELSE
        INSERT INTO carpetas VALUES (default, p_idUsuario, p_idCarpetaPadre, p_Nombre, p_EnPapelera);
      END IF;
    END IF;
  END IF;
END //
DELIMITER ;
-- CALL I_Carpeta(3, NULL, 'CarpetaPrueba2', FALSE); 