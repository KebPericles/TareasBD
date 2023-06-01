-- I_CompartirTarea
-- Nueva tarea compartida a otro usuario

DELIMITER //
CREATE PROCEDURE I_CompartirTarea (
        IN p_idTarea INT,
        IN p_idUsuario INT
) BEGIN
INSERT INTO TareasCompartidas(
                idTarea,
                idUsuario,
                fechaCompartida
        )
VALUES (
                p_idTarea,
                p_idUsuario,
                CURDATE()
        );
END //
DELIMITER;