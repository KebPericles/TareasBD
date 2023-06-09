-- ETIQUETA NUEVA
call bd_tareas.G_Etiquetas(1);
call bd_tareas.I_Etiqueta(1, 'Prueba 1');
call bd_tareas.G_Etiquetas(1);

call bd_tareas.I_Etiqueta(1, 'Prueba 2');
call bd_tareas.G_EtiquetasBuscar(1, 'prueba');

call bd_tareas.D_Etiqueta(23);
call bd_tareas.D_Etiqueta(22);


-- TAREA ETIQUETA
call bd_tareas.G_TareasEtiqueta(10);

call bd_tareas.D_TareaEtiqueta(10, 34);

call bd_tareas.G_TareasEtiqueta(10);

call bd_tareas.I_TareaEtiqueta(10, 34);

call bd_tareas.G_TareasEtiqueta(10);

