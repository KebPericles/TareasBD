export class Etiqueta {
        static campos = ['idEtiqueta','idUsuario','nombre'];
        /**
         * @type {Number | undefined}
         */
        idEtiqueta;
        /**
         * @type {String | undefined}
         */
        nombre;

        // RELACIONES
        /**
         * @type {import('./usuario.js').Usuario | undefined}
         */
        usuarioPropietario;
        /**
         * @type {import('./tarea').Tarea[] | undefined}
         */
        tareas;
}