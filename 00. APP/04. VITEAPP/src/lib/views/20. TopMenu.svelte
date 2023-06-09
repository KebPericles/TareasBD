<script>
        import { carpetaActiva, tareasSeleccionadas, user } from "$lib/stores";
        import { Button, ButtonGroup, Icon } from "sveltestrap";
        import NuevaTarea from "./20. NuevaTarea.svelte";

        $: possibleMove = $tareasSeleccionadas.length !== 1 ? true : false;

        const actualizarTareas = () => {
                fetch(`/api/tareas/${$carpetaActiva.idCarpeta}`).then((res) => {
                        res.json().then((data) => {
                                console.log(data);
                                $user.tareas = data.tareas;
                        });
                });
        };

        const borrarTareas = () => {
                let tarea;
                do {
                        tarea = $tareasSeleccionadas.pop();
                        fetch("/api/tareas", {
                                method: "DELETE",
                                body: JSON.stringify({
                                        tarea: {
                                                idTarea: tarea.idTarea,
                                        },
                                }),
                        }).then((res) => {
                                res.json().then((data) => {
                                        console.log(data);
                                        if (tarea === undefined)
                                                actualizarTareas();
                                });
                        });
                } while (tarea !== undefined);
        };
</script>

{#if $tareasSeleccionadas.length === 0}
        <NuevaTarea idUsuario={$user.idUsuario} />
{:else}
        <ButtonGroup>
                <Button disabled={possibleMove}>Mover a...</Button>
                <Button color="danger" on:click={borrarTareas}>
                        <Icon name="trash3-fill" />
                </Button>
        </ButtonGroup>
{/if}
