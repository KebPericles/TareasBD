import { query_selector_all } from "svelte/internal";
import { Manager } from "./00. manager.js";
import { MYSQL_STATUS } from "./00. util.js";
import { Carpeta } from "./01. carpeta.js";
import { Etiqueta } from "./01. etiqueta.js";
import { Tarea } from "./01. tarea.js";



class Usuario {

        static CAMPOS = ['idUsuario', 'correo', 'contrasena', 'nombre', 'apellido']
        /**
         * @type {Number}
         */
        idUsuario;
        /**
         * @type {String}
         */
        correo;
        /**
         * @type {String}
         */
        contrasena;
        /**
         * @type {String}
         */
        nombre;
        /**
         * @type {String}
         */
        apellido;

        // RELACIONES
        /**
         * @type {Array<Carpeta>}
         */
        carpetas;
        /**
         * @type {Array<Etiqueta>}
         */
        etiquetas;
        /**
         * @type {Array<Tarea>}
         */
        tareas;
        /**
         * @type {Array<Carpeta>}
         */
        carpetasCompartidas;
        /**
         * @type {Array<Tarea>}
         */
        tareasCompartidas;

        /**
         * 
         * @param {Usuario} usuario sin id
         */
        static async insertarUsuario(usuario) {
                let results = await Manager.callProcedure('I_Usuario', [
                        usuario.correo,
                        usuario.contrasena,
                        usuario.nombre,
                        usuario.apellido
                ]);
                let query = results.results;

                let status = MYSQL_STATUS.WAITING;

                query.on('result', (row) => {
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
         * @returns {Promise<Usuario>}
         */
        static async getUsuario({ idUsuario = null, correo = null }) {
                if (!idUsuario && !correo) return null;

                let query;
                let usuario;
                let r;
                if (idUsuario)
                         r = await Manager.callProcedure('G_Usuario', [idUsuario]);
                else
                        r = await Manager.callProcedure('G_UsuarioPorCorreo', [correo]);

                query = r.results;

                query.on('result', (row) => {
                        if (row.fieldCount !== undefined) return;
                        usuario = new Usuario();
                        Object.keys(row).forEach((col) => {
                                usuario[col] = row[col];
                        });
                });

                await new Promise(res => setTimeout(res, 30));
                // !La peor práctica posible, NO USAR (no tenía tiempo para reestructurar el código XD)
                for (let i = 0; i < 10; i++) {
                        await new Promise(res => setTimeout(res, 5));
                        if (usuario !== undefined) return usuario;
                }

                return null;
        }

        /**
         * 
         * @param {Usuario} param0 
         * @returns {Carpeta[]}
         */
        static async getCarpetas({ idUsuario }) {
                if (!idUsuario) return null;

                let query;
                let status = MYSQL_STATUS.WAITING;
                let carpetas = [];

                let { results, listener } = await Manager.callProcedure('G_Carpetas', [idUsuario]);
                query = results;

                query.on('result', (row) => {
                        if (row.fieldCount !== undefined) return;
                        let carpeta = new Carpeta();
                        Object.keys(row).forEach((col) => {
                                carpeta[col] = row[col];
                        });

                        carpetas.push(carpeta);
                });

                // *No tan mala con esto agregado
                listener.addListener('end', () => {
                        status = MYSQL_STATUS.SUCCESS;
                })

                await new Promise(res => setTimeout(res, 30));
                // !La peor práctica posible, NO USAR (no tenía tiempo para reestructurar el código XD)
                for (let i = 0; i < 10; i++) {
                        await new Promise(res => setTimeout(res, 5));
                        if (status === MYSQL_STATUS.SUCCESS) return carpetas;
                }

                return null;
        }
        constructor() {
                this.idUsuario = -1;

        }
}

export { Usuario };