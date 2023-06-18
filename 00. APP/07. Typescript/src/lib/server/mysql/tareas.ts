import { handleTarea } from "$lib/schemas/handlers";
import type { Carpeta, Tarea, Usuario } from "$lib/schemas/schemas";
import { query } from "./database";

export const getTareas = async (idCarpeta: Carpeta["idCarpeta"]) => {
        let q = query('CALL G_TareaCarpeta(?)', [idCarpeta]);
        let tareas: Tarea[] = [];
        let flag = false;

        q.on('result', (row) => {
                if (row.fieldCount !== undefined) return;
                let tarea = handleTarea(row);
                tareas.push(tarea);
        });

        q.on('end', () => {
                flag = true;
        })

        while (!flag) await new Promise(res => setTimeout(res, 10))

        return tareas;  
}

export const getTareasHoy = async (idUsuario: Usuario["idUsuario"]) => {
        let q = query('CALL G_TareaVencimientoDia(?)', [idUsuario]);
        let tareas: Tarea[] = [];
        let flag = false;

        q.on('result', (row) => {
                if (row.fieldCount !== undefined) return;
                let tarea = handleTarea(row);
                tareas.push(tarea);
        });

        q.on('end', () => {
                flag = true;
        })

        while (!flag) await new Promise(res => setTimeout(res, 10))

        return tareas;  
}