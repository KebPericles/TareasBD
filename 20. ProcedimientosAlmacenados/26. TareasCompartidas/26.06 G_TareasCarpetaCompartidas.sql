-- G_TareasCarpetaCompartidas
-- Regresa todas las tareas de una carpeta compartidas con un usuario

DROP PROCEDURE IF EXISTS G_TareasCarpetaCompartidas;

DELIMITER //
CREATE PROCEDURE G_TareasCarpetaCompartidas(
	IN p_idCarpeta INT,
	IN p_idUsuario INT
)BEGIN

SELECT 
	tc.idTarea, 
	c.idCarpeta,
	t.idUsuario AS idUsuario,
	tc.idUsuario AS idUsuarioCompartido,
	tc.fechaCompartida,
	t.idTareaPadre,
	t.titulo,
	t.descripcion,
	t.fechaInicio,
	t.fechaVencimiento,
	t.prioridad,
	t.estado,
	t.enPapelera
FROM tareascompartidas tc
	INNER JOIN tareas t ON t.idTarea = tc.idTarea
	INNER JOIN carpetas c ON c.idCarpeta = t.idCarpeta
	WHERE 
		tc.idUsuario = p_idUsuario AND
		c.idCarpeta = p_idCarpeta;

END //
DELIMITER ;