import { Usuario } from "$lib/server/database/01. usuario";


/**
 * @type {import("@sveltejs/kit").RequestHandler}
 */
export const GET = async ({ params }) => {
        let carpetas = await Usuario.getCarpetas({idUsuario: params.idUsuario});
        return new Response(JSON.stringify({carpetas: carpetas}));
}