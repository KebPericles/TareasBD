import { Carpeta, Tarea, Usuario } from "./schemas";

export function handleUsuario(rawUser: any) {
        let usuario: Usuario = new Usuario();
        usuario.idUsuario = Number.parseInt(rawUser.idUsuario);
        usuario.correo = rawUser.correo;
        usuario.contrasena = rawUser.contrasena;
        usuario.nombre = rawUser.nombre;
        usuario.apellido = rawUser.apellido;

        return usuario;
}

export function handleCarpeta(rawCarpeta: any) {
        let carpeta: Carpeta = new Carpeta();
        carpeta.idCarpeta = Number.parseInt(rawCarpeta.idCarpeta);
        carpeta.idUsuario = Number.parseInt(rawCarpeta.idUsuario);
        carpeta.idCarpetaPadre = JSON.parse(rawCarpeta.idCarpetaPadre?.toString() ?? "null");
        carpeta.nombre = rawCarpeta.nombre.toString();
        carpeta.enPapelera = JSON.parse(rawCarpeta.enPapelera?.toString());
        return carpeta;
}

export function handleTarea(rawTarea: any) {
        let tarea: Tarea = new Tarea();
        tarea.idTarea = Number.parseInt(rawTarea.idTarea);
        tarea.idUsuario = Number.parseInt(rawTarea.idUsuario);
        tarea.idCarpeta = Number.parseInt(rawTarea.idCarpeta);
        tarea.titulo = rawTarea.titulo.toString();
        tarea.descripcion = rawTarea.descripcion.toString();
        tarea.fechaInicio = rawTarea.fechaInicio ? new Date(rawTarea.fechaInicio) : null;
        tarea.fechaVencimiento = rawTarea.fechaVencimiento ? new Date(rawTarea.fechaVencimiento) : null;
        tarea.prioridad = rawTarea.prioridad?.toString() as any;
        tarea.estado = rawTarea.estado?.toString() as any;
        tarea.enPapelera = JSON.parse(rawTarea.enPapelera?.toString());
        return tarea;
}