import { CARPETAS } from "$lib/forms/01. carpeta";
import { Carpeta } from "$lib/server/database/01. carpeta";

/**
 * @type {import("@sveltejs/kit").RequestHandler}
 */
export const GET = async ({ params }) => {
        let tareas, idCarpeta = JSON.parse(params.idCarpeta);
        
        tareas = await Carpeta.getTareasCarpeta({idCarpeta: idCarpeta});
        return new Response(JSON.stringify(tareas));
}

