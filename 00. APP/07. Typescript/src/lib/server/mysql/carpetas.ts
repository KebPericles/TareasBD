import { handleCarpeta } from "$lib/schemas/handlers";
import type { Carpeta, Usuario } from "$lib/schemas/schemas";
import type { OkPacket, ResultSetHeader } from "mysql2";
import { query } from "./database";

export async function insertCarpeta(carpeta: Carpeta) {
        let q = query('CALL I_Carpeta(?,?,?)', [carpeta.idUsuario, carpeta.idCarpetaPadre, carpeta.nombre]);
        let flag = false;

        q.on('result', (row) => {
                console.log(row);
        });

        q.on('end', () => {
                flag = true;
        })

        while (!flag) await new Promise(res => setTimeout(res, 10))
}

export async function getCarpetas(idUsuario: Usuario["idUsuario"]) {
        let q = query('CALL G_Carpetas(?)', [idUsuario]);
        let carpetas: Carpeta[] = [];
        let flag = false;

        q.on('result', (row) => {
                if (row.fieldCount !== undefined) return;
                let carpeta = handleCarpeta(row);
                carpetas.push(carpeta);
        });

        q.on('end', () => {
                flag = true;
        })

        while (!flag) await new Promise(res => setTimeout(res, 10))

        return carpetas;
}

export async function deleteCarpeta(idCarpeta: Carpeta["idCarpeta"]) {
        let q = query('CALL D_Carpeta(?)', [idCarpeta]);
        let flag = false;

        q.on('result', (row) => {
                console.log(row);
        });

        q.on('end', () => {
                flag = true;
        })

        while (!flag) await new Promise(res => setTimeout(res, 10));


}