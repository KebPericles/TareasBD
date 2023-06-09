import { CARPETAS } from '$lib/forms/01. carpeta';

export async function handle({ event, resolve }) {
	if (!event.cookies.get('user'))
		event.cookies.set('user', null);
	if(!event.cookies.get('carpetaActiva'))
		event.cookies.set('carpetaActiva', JSON.stringify(CARPETAS.DEFAULT));

	return await resolve(event);
}