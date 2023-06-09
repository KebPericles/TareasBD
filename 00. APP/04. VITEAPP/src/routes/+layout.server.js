

// @ts-ignore

import { Tarea } from "$lib/server/database/01. tarea";

/**
 * 
 * @type {import("@sveltejs/kit").ServerLoad}
*/
export const load = async ({ fetch, cookies }) => {
	let user = JSON.parse(cookies.get('user'));
	let carpetaActiva = JSON.parse(cookies.get('carpetaActiva'));
	let tareas=null;

	if (user) {

		let responseCarpetas = await fetch(`/api/carpetas/${user.idUsuario}`);
		let dataFetchCarpetas = await responseCarpetas.json();

		user.carpetas = dataFetchCarpetas.carpetas;

		cookies.set('user', JSON.stringify(user));
		let responseTareas = await fetch(`/api/tareas/${carpetaActiva.idCarpeta}/${user.idUsuario}`);
		let dataTareas = await responseTareas.json();
		tareas = dataTareas;
	}

	return {
		user: user, // You can also use your old `getSession` function if you wish.
		carpetaActiva: carpetaActiva,
		tareas: tareas
	};
};