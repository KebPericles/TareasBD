/** @type {import("@sveltejs/kit").Actions} */

import { Usuario } from "$lib/server/database/01. usuario.js";
import { F_Usuario } from "$lib/forms/01. usuario.js";
import { redirect } from "@sveltejs/kit";
import { MYSQL_STATUS } from "$lib/server/database/00. util.js";

/** @type {import("@sveltejs/kit").ServerLoad} */
export async function load({ cookies }) {
        const user = JSON.parse(cookies.get('user'));

        return {
                user: user
        }
}

export const actions = {
        /**
         * @param {import("@sveltejs/kit").RequestEvent} Request object
         */
        login: async ({ request, cookies, fetch }) => {
                let user = JSON.parse(cookies.get('user'));
                let data = await request.formData();
                if (user) throw redirect(303, '/');

                let response = await fetch(`/api/login/${data.get(F_Usuario.CORREO.name)}`);
                let dataFetch = await response.json();

                if (dataFetch && dataFetch.contrasena === data.get(F_Usuario.CONTRASENA.name)) user = dataFetch;

                cookies.set('user', JSON.stringify(user));

                return {
                        user: JSON.parse(JSON.stringify(user))
                }
        },
        /**
         * @param {import("@sveltejs/kit").RequestEvent} Request object
         */
        logout: async ({ request, cookies }) => {

                cookies.set('user', null);

                return {
                        user: null
                }
        },
        /**
         * @param {import("@sveltejs/kit").RequestEvent} Request object
         */
        register: async ({ request, cookies, fetch }) => {
                /**
                 * @type {import('$lib/server/database/01. usuario.js'.Usuario);}
                 */
                if (JSON.parse(cookies.get('user'))) throw redirect(303, '/');

                let usuario = new Usuario();
                let data = await request.formData();

                usuario.correo = data.get(F_Usuario.CORREO.name);
                usuario.contrasena = data.get(F_Usuario.CONTRASENA.name);
                usuario.nombre = data.get(F_Usuario.NOMBRE.name);
                usuario.apellido = data.get(F_Usuario.APELLIDO.name);

                if (await Usuario.insertarUsuario(usuario) !== MYSQL_STATUS.SUCCESS)
                        return {
                                user: null
                        };

                usuario = await Usuario.getUsuario({ correo: usuario.correo });

                cookies.set('user', JSON.stringify(usuario));

                return {
                        user: usuario
                };
        }
};