-- I_Subtarea
-- Nueva subtarea

use bd_tareas;

DROP PROCEDURE IF EXISTS I_Subtarea;
DELIMITER //
CREATE PROCEDURE I_Subtarea
	(
    in p_idUsuario int,
    in p_idTareaPadre int,
    in p_idCarpeta int,
    in p_titulo varchar(45),
    in p_descripcion varchar(200),
    in p_fechaInicio datetime,
    in p_fechaVencimiento datetime,
    in p_prioridad ENUM('Alta', 'Media', 'Baja')
    )
BEGIN
	IF( p_idCarpeta is NULL and p_fechaVencimiento is NULL)
		THEN set p_fechaVencimiento = concat(curdate(),' 23:59:59');
        set p_fechaInicio = now();
	END IF;
	IF EXISTS(select * from tareas where titulo = p_titulo and idTareaPadre = p_idTareaPadre) 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una carpeta con el mismo titulo y misma posicion';
	ELSEIF (p_titulo is null or p_titulo='') 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El titulo de la carpeta nos puede ser nulo o vacio';
    ELSEIF(p_fechaInicio < now())
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de inicio es menor a la fecha en la que se creo la tarea';
    ELSEIF(p_fechaInicio > p_fechaVencimiento)
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de vencimiento es menor a la fecha de inicio';
    ELSEIF NOT EXISTS(select * from tareas where idTarea = p_idTareaPadre)
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No existe la tarea padre';
    ELSE
		INSERT INTO tareas value
        (
        default,
        p_idUsuario,
        p_idTareaPadre,
        p_idCarpeta,
        p_titulo,
        p_descripcion,
        p_fechaInicio,
        p_fechaVencimiento,
        p_prioridad,
        'No completado',
        false
        );
    END IF;
END //
DELIMITER ;