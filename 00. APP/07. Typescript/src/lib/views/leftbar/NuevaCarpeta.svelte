<script lang="ts">
        import type { Usuario } from "$lib/schemas/schemas";
        import { InputGroup, InputGroupText, Input } from "sveltestrap";
        export let idUsuario: Usuario["idUsuario"];

        const nuevaCarpeta = () => {
                let input = document.getElementById("I_CarpetaNombre");
                let newFolderName = input?.getAttribute("value");
                fetch("/api/carpetas", {
                        method: "POST",
                        body: JSON.stringify({
                                nombre: newFolderName,
                                idUsuario: idUsuario,
                        }),
                }).then((res) => {
                        res.json().then((data) => {
                                console.log(data);
                        });
                });
        };

        const keypressFolderName = (e) => {
                if (e.keyCode === 13) nuevaCarpeta();
        };
</script>

<form method="post" action="/?/agregarCarpeta">
        <InputGroup>
                <!-- svelte-ignore a11y-click-events-have-key-events -->
                <button type="submit" style="padding: 0; border: 0;">
                        <InputGroupText>+</InputGroupText>
                </button>
                <input type="hidden" name="idUsuario" value={idUsuario} />
                <Input name="nombre" placeholder="Nombre de nueva carpeta" />
        </InputGroup>
</form>
