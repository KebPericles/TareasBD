import { Tarea } from "./01. tarea.js";
import { Usuario } from "./01. usuario.js";

class Etiqueta {
        static campos = ['idEtiqueta','idUsuario','nombre'];
        /**
         * @type {Number}
         */
        idEtiqueta;
        /**
         * @type {String}
        */
        nombre;

        // RELACIONES
        /**
         * @type {Usuario}
         */
        usuarioPropietario;
        /**
         * @type {Array<Tarea>}
         */
        tareas;
}

export { Etiqueta as Etiqueta };