<script>
        import { InputGroup, InputGroupText, Input } from "sveltestrap";
        export let idUsuario;
        import { user } from "$lib/stores";

        const actualizarCarpetas = () => {
                fetch(`/api/carpetas/${idUsuario}`).then((res) => {
                        res.json().then((data) => {
                                console.log(data);
                                $user.carpetas = data.carpetas;
                        });
                });
        };

        const nuevaCarpeta = () => {
                let input = document.getElementById("I_CarpetaNombre");
                let newFolderName = input.value;
                fetch("/api/carpetas", {
                        method: "POST",
                        body: JSON.stringify({
                                nombre: newFolderName,
                                idUsuario: idUsuario,
                        }),
                }).then((res) => {
                        res.json().then((data) => {
                                if (data.status === "Registrao")
                                        actualizarCarpetas();
                                        input.value = "";
                        });
                });

        };

        const keypressFolderName = (e) => {
                if (e.keyCode === 13) nuevaCarpeta();
        };
</script>

<InputGroup>
        <!-- svelte-ignore a11y-click-events-have-key-events -->
        <div on:click={nuevaCarpeta}>
                <InputGroupText>+</InputGroupText>
        </div>
        <Input
                on:keypress={keypressFolderName}
                id="I_CarpetaNombre"
                name="folderName"
                placeholder="Nombre de nueva carpeta"
        />
</InputGroup>
