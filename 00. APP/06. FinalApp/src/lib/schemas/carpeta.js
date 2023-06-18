export class Carpeta {
        static campos = ['idCarpeta', 'idUsuario', 'idCarpetaPadre', 'nombre', 'enPapelera'];
        /**
         * @type {Number | undefined}
         */
        idCarpeta;
        /**
         * @type {Number | undefined}
         */
        idUsuario;
        /**
         * @type {Number | undefined}
         */
        idCarpetaPadre;
        /**
         * @type {String | undefined}
         */
        nombre;
        /**
         * @type {Boolean | undefined}
         */
        enPapelera;

        // RELACIONES
        /**
         * @type {import('./usuario').Usuario | undefined}
         */
        usuarioPropietario;
        /**
         * @type {Carpeta | undefined}
         */
        carpetaPadre;
        /**
         * @type {Array<Carpeta> | undefined}
         */
        carpetasHijas;
        /**
         * @type {Array<import('./tarea').Tarea> | undefined}
         */
        tareas;
}