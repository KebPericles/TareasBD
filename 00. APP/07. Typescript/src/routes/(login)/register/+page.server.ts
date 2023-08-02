import type { Actions } from '@sveltejs/kit';
import type { PageServerLoad } from './$types';
import { UsuarioSchema, type Usuario } from '$lib/schemas/schemas';

export const load = (async () => {
    return {asdf: "asdf"};
}) satisfies PageServerLoad;

export const actions: Actions = {
    default: async ({ request }) => {
        // TODO registro
        var formData = Object.fromEntries(await request.formData());
        console.log(formData);
        try {
            var usuario = UsuarioSchema.parse(formData);
        } catch (e) {
            console.log(e);
        }

        return {
            status: 200
        };
    }
};