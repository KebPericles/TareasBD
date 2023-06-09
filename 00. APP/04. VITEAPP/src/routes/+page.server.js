/** @type {import("@sveltejs/kit").ServerLoad} */
export async function load({ parent }) {
        const { user, carpetaActiva, tareas } = await parent();

        return {
                user: user,
                carpetaActiva: carpetaActiva,
                tareas: tareas
        }
}