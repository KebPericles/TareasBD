import { Manager } from "./00. manager.js";
import { MYSQL_STATUS, acondicionar } from "./00. util.js";
import { Carpeta } from "./01. carpeta.js";
import { Etiqueta } from "./01. etiqueta.js";
import { Usuario } from "./01. usuario.js";



class Tarea {
        static campos = ['idTarea', 'idUsuario', 'idTareaPadre'
                , 'idCarpeta', 'titulo', 'descripcion'
                , 'fechaInicio', 'fechaVencimiento', 'prioridad'
                , 'estado', 'enPapelera'];
        /**
         * @type {Number}
         */
        idTarea;
        /**
         * @type {String}
        */
        titulo;
        /**
         * @type {String}
         */
        descripcion;
        /**
         * @type {Date}
        */
        fechaInicio;
        /**
           * @type {Date}
           */
        fechaVencimiento;
        /**
         * @type {PRIORIDAD}
        */
        prioridad
        /**
         * @type {ESTADO}
        */
        estado;
        /**
         * @type {Boolean}
        */
        enPapelera;

        // RELACIONES
        /**
         * @type {Usuario}
         */
        usuarioPropietario;
        /**
         * @type {Tarea}
         */
        tareaPadre;
        /**
         * @type {Carpeta}
         */
        carpeta;
        /**
          * @type {Array<Tarea>}
          */
        tareasHijas;
        /**
         * @type {Array<Etiqueta>}
         */
        etiquetas;
        /**
         * @type {Array<Usuario>}
         */
        usuariosCompartidos;

        /**
         * @param {Tarea}
         */
        static async insertTarea(tarea) {
                let results = await Manager.callProcedure('I_Tarea', [
                        tarea.idUsuario,
                        tarea.idCarpeta,
                        tarea.titulo,
                        '',
                        acondicionar(tarea.fechaInicio, "Date"),
                        acondicionar(tarea.fechaVencimiento, "Date"),
                        tarea.prioridad
                ]);
                let query = results.results;
                console.log(query);

                let status = MYSQL_STATUS.WAITING;

                query.on('result', (row) => {
                        console.log(row);
                        if (row.affectedRows === 1) status = MYSQL_STATUS.SUCCESS;
                });

                await new Promise(res => setTimeout(res, 30));
                // !La peor práctica posible, NO USAR (no tenía tiempo para reestructurar el código XD)
                for (let i = 0; i < 10; i++) {
                        await new Promise(res => setTimeout(res, 5));
                        if (status !== MYSQL_STATUS.WAITING) return status;
                }

                return MYSQL_STATUS.FAILURE;
        }
        /**
         * 
         * @param {Tarea} tarea 
         */
        static async updateTarea(tarea) {
                let results = await Manager.callProcedure('U_Tarea', [
                        tarea.idTarea,
                        tarea.titulo,
                        tarea.descripcion,
                        acondicionar(tarea.fechaInicio, "Date"),
                        acondicionar(tarea.fechaVencimiento, "Date"),
                        tarea.prioridad,
                        tarea.estado.name
                ]);
                let query = results.results;
                console.log(query);

                let status = MYSQL_STATUS.WAITING;

                query.on('result', (row) => {
                        console.log(row);
                        if (row.affectedRows === 1) status = MYSQL_STATUS.SUCCESS;
                });

                await new Promise(res => setTimeout(res, 30));
                // !La peor práctica posible, NO USAR (no tenía tiempo para reestructurar el código XD)
                for (let i = 0; i < 10; i++) {
                        await new Promise(res => setTimeout(res, 5));
                        if (status !== MYSQL_STATUS.WAITING) return status;
                }

                return MYSQL_STATUS.FAILURE;
        }

        /**
         * 
         * @param {Tarea} tarea 
         */
        static async deleteTarea({idTarea}) {
                let { results: query, listener } = await Manager.callProcedure('D_Tarea', [
                        idTarea
                ]);

                let status = MYSQL_STATUS.WAITING;

                query.on('result', (row) => {
                        console.log(row);
                        if (row.affectedRows === 1) status = MYSQL_STATUS.SUCCESS;
                        else status = MYSQL_STATUS.FAILURE;
                });

                await new Promise(res => setTimeout(res, 50));
                // !La peor práctica posible, NO USAR (no tenía tiempo para reestructurar el código XD)
                for (let i = 0; i < 10; i++) {
                        await new Promise(res => setTimeout(res, 5));
                        if (status !== MYSQL_STATUS.WAITING) return status;
                }

                return MYSQL_STATUS.FAILURE;
        }
}

export { Tarea };