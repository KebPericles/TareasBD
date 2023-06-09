import { MYSQL_STATUS } from "$lib/server/database/00. util";
import { Carpeta } from "$lib/server/database/01. carpeta";

/**
 * @type {import("@sveltejs/kit").RequestHandler}
 */
export const GET = async ({ params }) => {
        return new Response(JSON.stringify(null));
}

/**
 * @type {import("@sveltejs/kit").RequestHandler}
 */
export const POST = async ({ request }) => {
        let carpeta = new Carpeta();
        let data = await request.json();
        carpeta.idUsuario = data.idUsuario;
        carpeta.nombre = data.nombre;

        if (await Carpeta.insertarCarpeta(carpeta) === MYSQL_STATUS.SUCCESS){
                return new Response(JSON.stringify({
                        status: 'Registrao'
                }));
        }

        return new Response(JSON.stringify({
                status: 'No registrao'
        }));
}

export const DELETE = async ({ request }) => {
        let carpeta = new Carpeta();
        let data = await request.json();
        console.log(data);
        carpeta.idCarpeta = data.idCarpeta;

        if (await Carpeta.borrarCarpeta(carpeta) === MYSQL_STATUS.SUCCESS){
                return new Response(JSON.stringify({
                        status: 'Borrao'
                }));
        }

        return new Response(JSON.stringify({
                status: 'No borrao'
        }));
}