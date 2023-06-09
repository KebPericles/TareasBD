import { writable } from 'svelte/store';
import { CARPETAS } from './forms/01. carpeta';

/**
 * @type {import('svelte/store').Writable<import('./server/database/01. carpeta').Carpeta>}
 */
export const carpetaActiva = writable({});
/**
 * @type {import('svelte/store').Writable<import('./server/database/01. usuario').Usuario>}
 */
export const user = writable({});

/**
 * @type {import('svelte/store').Writable<Array<import('./server/database/01. carpeta').Carpeta>>}
 */
export const carpetasSeleccionadas = writable([]);

/**
 * @type {import('svelte/store').Writable<Array<import('./server/database/01. tarea').Tarea>>}
 */
export const tareasSeleccionadas = writable([]);

/**
 * @type {import('svelte/store').Writable<import('./server/database/01. tarea').Tarea>>}
 */
export const tareaActiva = writable({});

/**
 * @type {import('svelte/store').Writable<import('./server/database/01. tarea').Tarea[]>>}
 */
export const tareasMostrar = writable([]);

/**
 * @type {import('svelte/store').Writable<import('./server/database/01. tarea').Tarea[]>>}
 */
export const tareasPapelera = writable([]);
/**
 * @type {import('svelte/store').Writable<import('./server/database/01. tarea').Tarea[]>>}
 */
export const tareasCompletadas = writable([]);