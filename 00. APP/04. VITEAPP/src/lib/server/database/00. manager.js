import 'dotenv/config.js';

const env = process.env;
import { promisify } from 'util';
import * as mysql from 'mysql';
import EventEmitter from 'events';

let pool = mysql.createPool({
        connectionLimit: 10,
        host: env.DB_HOST,
        user: env.DB_USER,
        password: env.DB_PASS,
        database: env.DB_DB
});

pool.on('closePool', () => {
        pool.end((err) => {
                if (err) throw err;
        })
});

class Manager {
        /**
         * @type {()=>Promise<mysql.PoolConnection>}
         */
        static getConnection = promisify(pool.getConnection).bind(pool);

        static callProcedure = async (/** @type {string} */ nombreProcedimiento, /** @type {any[]} */ parametros) => {
                const connection = await this.getConnection();
                let listener = new EventEmitter();

                let queryString = 'CALL ' + nombreProcedimiento + '(';

                for (let i = 0; i < parametros.length; i++) {
                        queryString += '?';

                        if (i === parametros.length - 1) break;
                        queryString += ',';
                }

                queryString += ');';

                let results = connection.query({
                        sql: queryString,
                        values: parametros
                });

                results.on('end', () => {
                        connection.release();
                        listener.emit('end');
                });

                return {results: results, listener: listener};
        }
}

export { Manager };