import { type Writable, writable } from "svelte/store";
import { Carpeta } from "./schemas/schemas";


export const carpetaActiva = writable(new Carpeta());

export const carpetasSeleccionadas = writable<Carpeta[]>([])