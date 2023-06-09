import { CARPETAS } from "$lib/forms/01. carpeta";
import { Carpeta } from "$lib/server/database/01. carpeta";

/**
 * @type {import("@sveltejs/kit").RequestHandler}
 */
export const GET = async ({ params }) => {
        let tareas, idCarpeta = JSON.parse(params.idCarpeta), idUsuario = JSON.parse(params.idUsuario);
        if (!idUsuario) return new Response();

        if (idCarpeta === CARPETAS.DEFAULT.idCarpeta)
                tareas = await Carpeta.getTareasHoy({ idUsuario: idUsuario });
        else if (idCarpeta === CARPETAS.PROXIMAS.idCarpeta)
                tareas = await Carpeta.getTareasProximas({ idUsuario: idUsuario });
        else tareas = null;

        return new Response(JSON.stringify(tareas));
}

