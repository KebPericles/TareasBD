import { carpetaActiva } from "$lib/stores";

export const CARPETAS = {
        /**
         * @type {import("$lib/server/database/01. carpeta").Carpeta}
         */
        DEFAULT: {
                idCarpeta: null,
                idUsuario: null,
                idCarpetaPadre: null,
                nombre: 'Hoy',
                carpetaPadre: null,
                carpetasHijas: null,
                enPapelera: false,
                tareas: null,
                usuarioPropietario: null
        },
        PROXIMAS: {
                idCarpeta: -1,
                nombre: 'Próximas tareas',
                carpetaPadre: null,
                carpetasHijas: null,
                enPapelera: false,
                tareas: null,
                usuarioPropietario: null
        },

        compare: (carpeta1, carpeta2) => {
                return carpeta1.idCarpeta === carpeta2.idCarpeta
                        && carpeta1.nombre === carpeta2.nombre
                        && carpeta1.usuarioPropietario === carpeta2.usuarioPropietario;
        },

        compareDefaults: (carpeta) => {
                return CARPETAS.compare(carpeta, CARPETAS.PROXIMAS) || CARPETAS.compare(carpeta, CARPETAS.DEFAULT)
        }
}

export const F_Carpeta = {
        DEFAULT_ID: {
                DEFAULT: 'C_Hoy',
                PROXIMOS: 'C_Proximos'
        },

        ID_CARPETA: {
                name: 'idFolder',
                placeholder: 'ID de carpeta',
                type: 'number'
        },
        NOMBRE: {
                name: 'folderName',
                placeholder: 'Nombre de la carpeta',
                type: 'string'
        },
}