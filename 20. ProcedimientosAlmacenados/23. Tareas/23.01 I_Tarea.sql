-- I_Tarea
-- Nueva tarea

DROP PROCEDURE IF EXISTS I_Tarea;
DELIMITER //
CREATE PROCEDURE I_Tarea(
    in p_idUsuario int,
    in p_idCarpeta int,
    in p_titulo varchar(45),
    in p_descripcion varchar(200),
    in p_fechaInicio datetime,
    in p_fechaVencimiento datetime,
    in p_prioridad ENUM('Alta', 'Media', 'Baja')
)
BEGIN
	IF EXISTS(select * from Tareas where titulo = p_titulo) 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ya existe una carpeta con el mismo titulo y misma posicion';
  	ELSEIF (p_titulo is null or p_titulo='') 
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El titulo de la carpeta nos puede ser nulo o vacio';
	ELSEIF(p_fechaInicio < now())
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de inicio es menor a la fecha en la que se creo la tarea';
	ELSEIF(p_fechaInicio > p_fechaVencimiento)
		THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'La fecha de vencimiento es menor a la fecha de inicio';
	ELSE
		INSERT INTO Tareas values (
			default,
			p_idUsuario,
			null,
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
