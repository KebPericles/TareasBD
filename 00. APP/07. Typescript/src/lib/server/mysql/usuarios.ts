import { handleUsuario } from "$lib/schemas/handlers";
import type { Usuario } from "$lib/schemas/schemas";
import { query } from "./database"

export const getUsuario = async (idUsuario: Usuario["idUsuario"]): Promise<Usuario | null> => {
        let q = query('CALL G_Usuario(?)', [idUsuario]);
        let usuario: Usuario | null = null;
        let flag = false;

        q.on('result', (row) => {
                if (row.fieldCount !== undefined) return;
                usuario = handleUsuario(row);
        });

        q.on('end', () => {
                flag = true;
        })

        while (!flag) await new Promise(res => setTimeout(res, 10))

        return usuario;
}

export const getUsuarioPorCorreo = async (correo: Usuario["correo"]): Promise<Usuario | null> => {
        let q = query('CALL G_UsuarioPorCorreo(?)', [correo]);
        let usuario: Usuario | null = null;
        let flag = false;

        q.on('result', (row) => {
                if (row.fieldCount !== undefined) return;
                usuario = handleUsuario(row);
        });

        q.on('end', () => {
                flag = true;
        })


        while (!flag) await new Promise(res => setTimeout(res, 10))

        return usuario;
}