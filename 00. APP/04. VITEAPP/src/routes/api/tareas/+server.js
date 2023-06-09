import { MYSQL_STATUS } from "$lib/server/database/00. util";
import { Tarea } from "$lib/server/database/01. tarea";


/**
 * @type {import("@sveltejs/kit").RequestHandler}
 */
export const POST = async ({ request }) => {
        let data = await request.json();
        console.log(data);
        let tarea = data.tarea;

        let res = await Tarea.insertTarea(tarea);
        if (res === MYSQL_STATUS.SUCCESS)
                return new Response(JSON.stringify('Insertao'));

        return new Response(JSON.stringify('No insertao'));
}
/**
 * @type {import("@sveltejs/kit").RequestHandler}
 */
export const PUT = async ({ request }) => {
        let data = await request.json();
        console.log(data);
        let tarea = data.tarea;

        let res = await Tarea.updateTarea(tarea);
        if (res === MYSQL_STATUS.SUCCESS)
                return new Response(JSON.stringify('Actualizao'));

        return new Response(JSON.stringify('No actualizao'));
}

/**
 * @type {import("@sveltejs/kit").RequestHandler}
 */
export const DELETE = async ({ request }) => {
        let data = await request.json();
        console.log(data);
        let tarea = data.tarea;

        let res = await Tarea.deleteTarea(tarea);
        if (res === MYSQL_STATUS.SUCCESS)
                return new Response(JSON.stringify('Actualizao'));

        return new Response(JSON.stringify('No actualizao'));
}