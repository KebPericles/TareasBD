-- I_TareaEtiqueta
-- Asigna una etiqueta a una tarea especifica

DROP PROCEDURE IF EXISTS I_TareaEtiqueta;

DELIMITER //
CREATE PROCEDURE I_TareaEtiqueta
(
        IN p_idTarea INT,
        IN p_idEtiqueta INT
)
BEGIN
        INSERT INTO TareasEtiquetas(idTarea, idEtiqueta) VALUES (p_idTarea, p_idEtiqueta);
END //
DELIMITER ;