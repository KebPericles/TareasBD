export class Usuario {

        static CAMPOS = ['idUsuario', 'correo', 'contrasena', 'nombre', 'apellido']
        /**
         * @type {Number | undefined}
         */
        idUsuario;
        /**
         * @type {String | undefined}
         */
        correo;
        /**
         * @type {String | undefined}
         */
        contrasena;
        /**
         * @type {String | undefined}
         */
        nombre;
        /**
         * @type {String | undefined}
         */
        apellido;

        // RELACIONES
        /**
         * @type {Array<import('./carpeta').Carpeta> | undefined}
         */
        carpetas;
        /**
         * @type {Array<import('./etiqueta').Etiqueta> | undefined}
         */
        etiquetas;
        /**
         * @type {Array<import('./tarea').Tarea> | undefined}
         */
        tareas;
        /**
         * @type {Array<import('./carpeta').Carpeta> | undefined}
         */
        carpetasCompartidas;
        /**
         * @type {Array<import('./tarea').Tarea> | undefined}
         */
        tareasCompartidas;
}