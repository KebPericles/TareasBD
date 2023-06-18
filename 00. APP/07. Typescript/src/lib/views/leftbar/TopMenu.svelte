<script lang="ts">
        import { carpetasSeleccionadas } from "$lib/stores";
        import { Button, ButtonGroup, Icon } from "sveltestrap";
        import NuevaCarpeta from "./NuevaCarpeta.svelte";
        import type { Carpeta, Usuario } from "$lib/schemas/schemas";

        export let user: Usuario;

        $: possibleMove = $carpetasSeleccionadas.length !== 1 ? true : false;

        const borrarCarpetas = () => {
                let carpeta: Carpeta | undefined;
                carpeta = $carpetasSeleccionadas.pop();
                while (carpeta !== undefined) {
                        fetch("/?/carpetas", {
                                method: "POST",
                                body: JSON.stringify({
                                        
                                }),
                        }).then((res) => {
                                res.json().then((data) => {
                                        console.log(data);
                                });
                        });
                        carpeta = $carpetasSeleccionadas.pop();
                }
        };
</script>

{#if $carpetasSeleccionadas.length === 0}
        <NuevaCarpeta idUsuario={user.idUsuario} />
{:else}
        <ButtonGroup>
                <Button disabled={possibleMove}>Mover a...</Button>
                <Button color="danger" type="submit">
                        <Icon name="trash3-fill" />
                </Button>
        </ButtonGroup>
{/if}
