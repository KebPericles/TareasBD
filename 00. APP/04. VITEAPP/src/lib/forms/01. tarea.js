export class PRIORIDAD {
        static ALTA = new PRIORIDAD('Alta');
        static MEDIA = new PRIORIDAD('Media');
        static BAJA = new PRIORIDAD('Baja');
        static NULL = new PRIORIDAD(null);

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

        constructor(name) {
                this.name = name;
        }
        toString() {
                return `${this.name}`;
        }
}