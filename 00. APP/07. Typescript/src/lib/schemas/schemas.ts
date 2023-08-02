import {z} from "zod";

export const UsuarioSchema = z.object({
        idUsuario: z.number().optional(),
        correo: z.string().email(),
        contrasena: z.string(),
        nombre: z.string(),
        apellido: z.string()
});
export type Usuario = z.infer<typeof UsuarioSchema>;

export const CarpetaSchema = z.object({
        idCarpeta: z.number().nullable(),
        idUsuario: z.number(),
        idCarpetaPadre: z.number().nullable(),
        nombre: z.string(),
        enPapelera: z.boolean()
});
export type Carpeta = z.infer<typeof CarpetaSchema>;

export const EtiquetaSchema = z.object({
        idEtiqueta: z.number().nullable(),
        idUsuario: z.number(),
        nombre: z.string()
});
export type Etiqueta = z.infer<typeof EtiquetaSchema>;

export const TareaSchema = z.object({
        idTarea: z.number().nullable(),
        idUsuario: z.number(),
        idCarpeta: z.number(),
        titulo: z.string(),
        descripcion: z.string(),
        fechaInicio: z.date().nullable(),
        fechaVencimiento: z.date().nullable(),
        prioridad: z.enum(["Alta", "Media", "Baja"]).nullable(),
        estado: z.enum(["Completado", "No completado"]),
        enPapelera: z.boolean()
});
export type Tarea = z.infer<typeof TareaSchema>;