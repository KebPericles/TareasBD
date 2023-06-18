import { createPool } from "mysql2";
import type { Pool } from "mysql2";

const env = process.env;
let pool: Pool;

export function connectPool() {
        pool = createPool({
                connectionLimit: 10,
                host: env.DB_HOST,
                user: env.DB_USER,
                password: env.DB_PASS,
                database: env.DB_DB
        });
}

export function query(sql: string, values: any[]) {
        let query = pool.query({ sql: sql, values: values, timeout: 1000 });
        query.on('error', (err)=> console.log(err));
        query.on('end', () => console.log('Released connection'));
        return query;
}
