// Cargar las carpetas del usuario

import type { Usuario } from '$lib/schemas/schemas';
import { redirect } from '@sveltejs/kit';
import type { LayoutServerLoad } from './$types';
import { getUsuario } from '$db/usuarios';
import { getCarpetas } from '$db/carpetas';

export const load = (async ({ cookies }) => {
    if (!cookies.get('user')) throw redirect(301, '/login');
    let usuario: Usuario = JSON.parse(<string>cookies.get('user'));

    usuario = <Usuario>await getUsuario(usuario.idUsuario);
    usuario = JSON.parse(JSON.stringify(usuario));

    if (!usuario) {
        cookies.delete('user');
        throw redirect(301, '/login');
    }

    let carpetas = await getCarpetas(usuario.idUsuario);
    carpetas = JSON.parse(JSON.stringify(carpetas));

    return { carpetas: carpetas, usuario: usuario };
}) satisfies LayoutServerLoad;