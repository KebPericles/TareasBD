// Confirmar el login

import { getUsuarioPorCorreo } from '$db/usuarios';
import { fail, redirect } from '@sveltejs/kit';
import type { Actions, PageServerLoad } from './$types';

export const load = (async ({ cookies }) => {
    if(cookies.get('user')) throw redirect(301, '/');

    return {};
}) satisfies PageServerLoad;

export const actions: Actions = {
    login: async ({ request, cookies }) => {
        let formData = await request.formData();
        let form = Object.fromEntries(formData);

        if (!form?.correo) return fail(400, { correo: form.correo, missing: true })
        if (!form?.contrasena) return fail(400, { contrasena: form.contrasena, missing: true })

        let usuario = await getUsuarioPorCorreo(form.correo.toString());


        if (usuario?.contrasena === form.contrasena) {
            cookies.set('user', JSON.stringify(usuario));
            throw redirect(301, '/');
        }

        return fail(400, { authentication: false })
    }, 
    logout:async ({cookies}) => {
        let usuario = JSON.parse(<string>cookies.get('user'));

        if(!usuario) return fail(400, {authentication: false})
    }
};