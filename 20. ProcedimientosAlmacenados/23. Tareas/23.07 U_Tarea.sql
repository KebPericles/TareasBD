-- U_Tarea
-- Actualizar datos de una tarea

DROP PROCEDURE IF EXISTS U_Tarea;

DELIMITER //
CREATE PROCEDURE U_Tarea(
	in p_idTarea int,
    in p_titulo varchar(100),
    in p_descripcion varchar(200),
    in p_fechaInicio datetime,
    in p_fechaVencimiento datetime,
    in p_prioridad ENUM('Alta', 'Media', 'Baja'),
    in p_estado ENUM('Completado','No completado')
)
BEGIN
    -- Verificar que el ID de tarea existe en la tabla de Tareas
    IF NOT EXISTS (SELECT * FROM tareas WHERE idTarea = p_idTarea)
        THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El ID de tarea no existe.';
    ELSE
        -- Si existe con mismo nombre
        IF EXISTS(select *from tareas where titulo = p_titulo) 
            THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una carpeta con el mismo titulo y misma posicion';
		END IF;
            -- Si hay valore nulos
        IF(p_titulo is NULL)
            THEN set p_titulo = (select titulo from tareas where idTarea = p_idTarea );
        END IF;
        IF(p_descripcion is NULL)
            THEN set p_descripcion = (select descripcion from tareas where idTarea = p_idTarea );
        END IF;
        IF(p_fechaInicio is NULL)
            THEN set p_fechaInicio = (select fechaInicio from tareas where idTarea = p_idTarea );
        END IF;
        IF(p_fechaVencimiento is NULL)
            THEN set p_fechaVencimiento = (select fechaVencimiento from tareas where idTarea = p_idTarea );
        END IF;
        IF(p_prioridad is NULL)
            THEN set p_prioridad = (select prioridad from tareas where idTarea = p_idTarea );
        END IF;
        IF(p_estado is NULL)
            THEN set p_estado = (select estado from tareas where idTarea = p_idTarea );
        END IF;
        IF(p_fechaInicio > p_fechaVencimiento)
            THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de vencimiento es menor a la fecha de inicio';
        ELSE
            -- Actualizar el nombre de la subcarpeta
            UPDATE tareas SET 
            titulo = p_titulo,
            descripcion = p_descripcion,
            fechaInicio = p_fechaInicio,
            fechaVencimiento = p_fechaVencimiento,
            prioridad= p_prioridad,
            estado = p_estado
            WHERE idTarea = p_idTarea ;
        END IF;
    END IF;
END //
DELIMITER ;
