import { Usuario } from "$lib/server/database/01. usuario";


/**
 * @type {import("@sveltejs/kit").RequestHandler}
 */
export const GET = async ({ params }) => {
        let usuario = await Usuario.getUsuario({correo: params.email});
        return new Response(JSON.stringify(usuario));
}

