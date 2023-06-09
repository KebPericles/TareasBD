<script>
        import { carpetasSeleccionadas, user } from "$lib/stores";
        import { Button, ButtonGroup, Icon } from "sveltestrap";
        import NuevaCarpeta from "./10. NuevaCarpeta.svelte";

        $: possibleMove = $carpetasSeleccionadas.length !== 1 ? true : false;

        const actualizarCarpetas = () => {
                fetch(`/api/carpetas/${$user.idUsuario}`).then((res) => {
                        res.json().then((data) => {
                                console.log(data);
                                $user.carpetas = data.carpetas;
                        });
                });
        };

        const borrarCarpetas = () => {
                let carpeta;
                do {
                        carpeta = $carpetasSeleccionadas.pop();
                        fetch("/api/carpetas", {
                                method: "DELETE",
                                body: JSON.stringify({
                                        idCarpeta: carpeta.idCarpeta,
                                }),
                        }).then((res) => {
                                res.json().then((data) => {
                                        console.log(data);
                                        if (carpeta === undefined)
                                                actualizarCarpetas();
                                });
                        });
                } while (carpeta !== undefined);
        };
</script>

{#if $carpetasSeleccionadas.length === 0}
        <NuevaCarpeta idUsuario={$user.idUsuario} />
{:else}
        <ButtonGroup>
                <Button disabled={possibleMove}>Mover a...</Button>
                <Button color="danger" on:click={borrarCarpetas}>
                        <Icon name="trash3-fill" />
                </Button>
        </ButtonGroup>
{/if}
