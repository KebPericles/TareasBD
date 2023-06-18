// Cargar las tareas de hoy

import { deleteCarpeta, insertCarpeta } from '$db/carpetas';
import { getTareasHoy } from '$db/tareas';
import { Carpeta } from '$lib/schemas/schemas';
import type { Actions, PageServerLoad } from './$types';


export const load = (async ({parent}) => {
    let parentData = await parent();
    let tareas = await getTareasHoy(parentData.usuario.idUsuario);

    return {tareas: tareas};
}) satisfies PageServerLoad;

export const actions: Actions = {
    agregarCarpeta: async ({ request }) => {
        let formData = Object.fromEntries(await request.formData());

        let carpeta: Carpeta = new Carpeta();
        carpeta.idCarpeta = null;
        carpeta.idUsuario = Number.parseInt(formData.idUsuario.toString());
        carpeta.idCarpetaPadre = null;
        carpeta.nombre = formData.nombre.toString();
        carpeta.enPapelera = false;

        insertCarpeta(carpeta);
    },
    borrarCarpetas: async ({ request }) => {
        let formData = Object.fromEntries(await request.formData());

        let idsCarpetas: number[] = [];

        Object.keys(formData).forEach(key => {
            if (key.startsWith('carpeta-')) {
                idsCarpetas.push(Number.parseInt(key.split('-')[1]));
            }
        });

        idsCarpetas.forEach(idCarpeta => {
            deleteCarpeta(idCarpeta);
        });

    },


};