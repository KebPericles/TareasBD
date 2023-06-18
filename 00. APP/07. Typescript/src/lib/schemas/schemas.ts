export class Usuario {
        idUsuario!: number | null
        correo!: string
        contrasena!: string
        nombre!: string
        apellido!: string


}

export class Carpeta {
        idCarpeta!: number | null
        idUsuario!: Usuario["idUsuario"]
        idCarpetaPadre!: Carpeta["idCarpeta"]
        nombre!: string
        enPapelera!: boolean

        carpetasHijas: Carpeta[] | undefined
}

export class Tarea {
        idTarea!: number | null
        idUsuario!: Usuario["idUsuario"]
        idCarpeta!: Carpeta["idCarpeta"]
        titulo!: string
        descripcion!: string
        fechaInicio!: Date | null
        fechaVencimiento!: Date | null
        prioridad!: "Alta" | "Media" | "Baja" | null
        estado!: "Completado" | "No completado"
        enPapelera!: boolean

        etiquetas: Etiqueta[] | undefined
}

export class Etiqueta {
        idEtiqueta!: number | null
        idUsuario!: Usuario["idUsuario"]
        nombre!: string


}