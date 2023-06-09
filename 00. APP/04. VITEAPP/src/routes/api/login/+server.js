import { Usuario } from "../../../lib/server/database/01. usuario";

/**
 * @type {import("@sveltejs/kit").RequestHandler}
 */
export const POST = async ({ params }) => {
        return new Response(JSON.stringify({hola: 'hola'}));
}
