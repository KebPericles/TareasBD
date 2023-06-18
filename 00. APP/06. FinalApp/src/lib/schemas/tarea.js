export class PRIORIDAD {
        static ALTA = new PRIORIDAD('Alta');
        static MEDIA = new PRIORIDAD('Media');
        static BAJA = new PRIORIDAD('Baja');
        static NULL = new PRIORIDAD(null);

        /**
         * @param {string | null} name
         */
        constructor(name) {
                this.name = name;
        }
        toString() {
                return `${this.name}`;
        }
}

export class ESTADO {
        static COMPLETADO = new ESTADO('Completado');
        static NO_COMPLETADO = new ESTADO('No completado');

        /**
         * @param {string} name
         */
        constructor(name) {
                this.name = name;
        }
        toString() {
                return `${this.name}`;
        }
}

export class Tarea {
     
        static campos = ['idTarea', 'idUsuario', 'idTareaPadre'
                , 'idCarpeta', 'titulo', 'descripcion'
                , 'fechaInicio', 'fechaVencimiento', 'prioridad'
                , 'estado', 'enPapelera'];
        /**
         * @type {Number | undefined}
         */
        idTarea;
        /**
         * @type {String | undefined}
         */
        titulo;
        /**
         * @type {String | undefined}
         */
        descripcion;
        /**
         * @type {Date | undefined}
         */
        fechaInicio;
        /**
         * @type {Date | undefined}
         */
        fechaVencimiento;
        /**
         * @type {PRIORIDAD | undefined}
         */
        prioridad
        /**
         * @type {ESTADO | undefined}
         */
        estado;
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
         * @type {Tarea | undefined}
         */
        tareaPadre;
        /**
         * @type {import('./carpeta').Carpeta | undefined}
         */
        carpeta;
        /**
         * @type {Array<Tarea> | undefined}
         */
        tareasHijas;
        /**
         * @type {Array<import('./etiqueta').Etiqueta> | undefined}
         */
        etiquetas;
        /**
         * @type {Array<import('./usuario').Usuario> | undefined}
         */
        usuariosCompartidos;
}