-- G_EtiquetasBuscar
-- Buscar todas las etiquetas de un usuario que coincidan por nombre

DELIMITER // 
CREATE PROCEDURE G_EtiquetasBuscar
(
        IN p_idUsuario INT,
        IN p_nombreBuscar VARCHAR(45)
)
BEGIN
        SELECT * FROM etiquetas 
                WHERE 
                        idUsuario = p_idUsuario
                        AND nombre 
                        -- TODO TERMINAR

END //
DELIMITER ;
-- ? https://cristobalgonzalez.com/blog/index.php/busquedas-en-mysql-like-y-full-text-search/