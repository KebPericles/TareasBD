-- NUEVO USUARIO
CALL G_UsuarioPorCorreo('test1@test.com');
call bd_tareas.I_Usuario('test1@test.com', '1234', 'T', 'est');
CALL G_UsuarioPorCorreo('test1@test.com');

SELECT idUsuario INTO @idPrueba FROM usuarios WHERE correo = 'test1@test.com';
CALL G_Usuario(@idPrueba);

-- CREAR CARPETA

call bd_tareas.I_Carpeta(@idPrueba, NULL, 'Carpeta Test');
call bd_tareas.I_Carpeta(@idPrueba, NULL, 'Carpeta Test');
call bd_tareas.G_Carpetas(@idPrueba);
-- borrar carpeta
select idCarpeta from carpetas where idUsuario = @idPrueba into @idCarpetaPrueba;
call bd_tareas.D_Carpeta(@idCarpetaPrueba);
-- recrear
call bd_tareas.I_Carpeta(@idPrueba, NULL, 'Carpeta Test');
select idCarpeta from carpetas where idUsuario = @idPrueba into @idCarpetaPrueba;
-- cambiar nombre
call bd_tareas.U_Carpeta(@idCarpetaPrueba, 'Carpeta test actualizada');
call bd_tareas.G_Carpetas(@idPrueba);
call bd_tareas.U_Carpeta(@idCarpetaPrueba, 'Carpeta Test');
call bd_tareas.G_Carpetas(@idPrueba);

-- BUSCAR
call bd_tareas.G_CarpetasBuscar('Carpeta', @idPrueba);

-- TAREAS
call bd_tareas.I_Tarea(@idPrueba, @idCarpetaPrueba, 'Tarea test', 'Descripcion test', NULL, NULL, NULL);
call bd_tareas.G_TareaCarpeta(@idCarpetaPrueba);

-- BUSCAR TAREAS
call bd_tareas.G_TareasBuscar('ipci',@idPrueba);
call bd_tareas.G_TareasBuscar('are',@idPrueba);

SELECT idTarea FROM tareas where idUsuario = @idPrueba AND idTareaPadre is null INTO @idTareaPrueba;
-- Ver tarea
call bd_tareas.G_Tarea(@idTareaPrueba);

call bd_tareas.I_Subtarea(@idPrueba, @idTareaPrueba, 'Subtarea test', '', NULL, NULL, NULL);
call bd_tareas.I_Subtarea(@idPrueba, @idTareaPrueba, 'Subtarea 2 test', '', NULL, NULL, NULL);

call bd_tareas.G_SubtareasPorTareas(@idTareaPrueba);

-- CARPETA A PAPELERA
call bd_tareas.U_CarpetaAPapelera(@idCarpetaPrueba);
call bd_tareas.G_CarpetasPapelera(@idPrueba);
call bd_tareas.G_TareaCarpeta(@idCarpetaPrueba);

-- BORRAR TAREAS
call bd_tareas.D_Tarea(@idTareaPrueba);

-- Borrar usuario
CALL D_Usuario(@idPrueba);
SELECT * FROM usuarios ORDER BY idUsuario DESC;

-- CARPETAS COMPARTIDAS
call bd_tareas.G_CarpetasCompartidas(7);
