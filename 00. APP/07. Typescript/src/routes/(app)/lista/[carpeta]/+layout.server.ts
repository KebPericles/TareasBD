// Cargar las tareas de la carpeta

import { getTareas } from '$db/tareas';
import type { LayoutServerLoad } from './$types';

export const load = (async ({ params }) => {
    let tareas = getTareas(Number.parseInt(params.carpeta));
    return { tareas };

}) satisfies LayoutServerLoad;