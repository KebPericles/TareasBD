-- G_TareasBuscar
-- Buscar tarea por titulo o descrpcion

DROP PROCEDURE IF EXISTS G_TareasBuscar;

DELIMITER //
CREATE PROCEDURE G_TareasBuscar(
	in p_text varchar(200)
)
BEGIN
	SELECT * FROM Tareas where descripcion like concat('%',p_text,'%') or titulo like concat('%',p_text,'%');
END //
DELIMITER ;
