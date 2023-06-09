import { Usuario } from "./01. usuario.js";
import { Tarea } from "./01. tarea.js";
import { MYSQL_STATUS } from "./00. util.js";
import { Manager } from "./00. manager.js";

class Carpeta {
        static campos = ['idCarpeta', 'idUsuario', 'idCarpetaPadre', 'nombre', 'enPapelera'];
        /**
         * @type {Number}
         */
        idCarpeta;
        /**
         * @type {Number}
         */
        idUsuario;
        /**
         * @type {Number}
         */
        idCarpetaPadre;
        /**
         * @type {String}
        */
        nombre;
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
         * @type {Carpeta}
         */
        carpetaPadre;
        /**
         * @type {Array<Carpeta>}
         */
        carpetasHijas;
        /**
         * @type {Array<Tarea>}
         */
        tareas;

        /**
         * 
         * @param {Carpeta} carpeta 
         */
        static async insertarCarpeta(carpeta) {
                let { results: query } = await Manager.callProcedure('I_Carpeta', [
                        carpeta.idUsuario,
                        null,
                        carpeta.nombre
                ]);

                let status = MYSQL_STATUS.WAITING;

                query.on('result', (row) => {
                        if (row.affectedRows === 1) status = MYSQL_STATUS.SUCCESS;
                });

                await new Promise(res => setTimeout(res, 50));
                // !La peor práctica posible, NO USAR (no tenía tiempo para reestructurar el código XD)
                for (let i = 0; i < 10; i++) {
                        await new Promise(res => setTimeout(res, 5));
                        if (status !== MYSQL_STATUS.WAITING) return status;
                }

                return MYSQL_STATUS.FAILURE;
        }

        /**
         * 
         * @return {Array<Tarea>} carpeta 
         */
        static async getTareasCarpeta({ idCarpeta }) {
                if (!idCarpeta) return null;

                let status = MYSQL_STATUS.WAITING;
                let tareas = [];

                let { results, listener } = await Manager.callProcedure('G_TareaCarpeta', [idCarpeta]);

                results.on('result', (row) => {
                        if (row.fieldCount !== undefined) return;
                        let tarea = new Tarea();
                        Object.keys(row).forEach((col) => {
                                tarea[col] = row[col];
                        });

                        tareas.push(tarea);
                });

                // *No tan mala con esto agregado
                listener.addListener('end', () => {
                        status = MYSQL_STATUS.SUCCESS;
                })

                await new Promise(res => setTimeout(res, 30));
                // !La peor práctica posible, NO USAR (no tenía tiempo para reestructurar el código XD)
                for (let i = 0; i < 10; i++) {
                        await new Promise(res => setTimeout(res, 5));
                        if (status === MYSQL_STATUS.SUCCESS) return tareas;
                }

                return null;
        }

        static async getTareasHoy({ idUsuario }){
                if (!idUsuario) return null;

                let status = MYSQL_STATUS.WAITING;
                let tareas = [];

                let { results, listener } = await Manager.callProcedure('G_TareaVencimientoDia', [idUsuario]);

                results.on('result', (row) => {
                        if (row.fieldCount !== undefined) return;
                        let tarea = new Tarea();
                        Object.keys(row).forEach((col) => {
                                tarea[col] = row[col];
                        });

                        tareas.push(tarea);
                });

                // *No tan mala con esto agregado
                listener.addListener('end', () => {
                        status = MYSQL_STATUS.SUCCESS;
                })

                await new Promise(res => setTimeout(res, 30));
                // !La peor práctica posible, NO USAR (no tenía tiempo para reestructurar el código XD)
                for (let i = 0; i < 10; i++) {
                        await new Promise(res => setTimeout(res, 5));
                        if (status === MYSQL_STATUS.SUCCESS) return tareas;
                }

                return null;
        }

        static async getTareasProximas({idUsuario}){
                if (!idUsuario) return null;

                let status = MYSQL_STATUS.WAITING;
                let tareas = [];

                let { results, listener } = await Manager.callProcedure('G_TareasProximas', [idUsuario]);

                results.on('result', (row) => {
                        if (row.fieldCount !== undefined) return;
                        let tarea = new Tarea();
                        Object.keys(row).forEach((col) => {
                                tarea[col] = row[col];
                        });

                        tareas.push(tarea);
                });

                // *No tan mala con esto agregado
                listener.addListener('end', () => {
                        status = MYSQL_STATUS.SUCCESS;
                })

                await new Promise(res => setTimeout(res, 30));
                // !La peor práctica posible, NO USAR (no tenía tiempo para reestructurar el código XD)
                for (let i = 0; i < 10; i++) {
                        await new Promise(res => setTimeout(res, 5));
                        if (status === MYSQL_STATUS.SUCCESS) return tareas;
                }

                return null;
        }

        /**
         * 
         * @param {Carpeta} carpeta 
         */
        static async borrarCarpeta(carpeta) {
                let { results: query, listener } = await Manager.callProcedure('D_Carpeta', [
                        carpeta.idCarpeta
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

export { Carpeta };