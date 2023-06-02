-- G_TareasBuscar
-- Buscar tarea por titulo o descrpcion

use bd_tareas;

DROP PROCEDURE IF EXISTS G_TareasBuscar;
DELIMITER //
CREATE PROCEDURE G_TareasBuscar
	(
		in p_text varchar(200)
    )
BEGIN
    SELECT * FROM tareas where descripcion like concat('%',p_text,'%') or titulo like concat('%',p_text,'%');
END //
DELIMITER ;