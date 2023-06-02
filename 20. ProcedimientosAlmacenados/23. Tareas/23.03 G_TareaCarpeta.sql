-- G_TareaCarpeta
-- Buscar una tarea por su carpeta

DROP PROCEDURE IF EXISTS G_TareaCarpeta;

DELIMITER //
CREATE PROCEDURE G_TareaCarpeta(
	in p_idCarpeta int
)
BEGIN
    SELECT * FROM tareas where idCarpeta = p_idCarpeta;
END //
DELIMITER ;
