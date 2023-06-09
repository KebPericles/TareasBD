<script>
        import { CARPETAS } from "$lib/forms/01. carpeta";
        import { ESTADO } from "$lib/forms/01. tarea";
        import {
                carpetaActiva,
                tareasMostrar,
                tareasPapelera,
                tareasCompletadas,
                user,
        } from "$lib/stores";
        import { onMount } from "svelte";
        import { Accordion, AccordionItem, ListGroup, Row } from "sveltestrap";
        import Tarea from "$lib/views/20. Tarea.svelte";
        import TopMenu from "$lib/views/20. TopMenu.svelte";

        /**
         * @type {import('$lib/server/database/01. tarea.js').Tarea[]}
         */
        $: tareas = $user.tareas;
        const carpetaActivaStatic = $carpetaActiva;

        const filtrarTareas = () => {
                tareas.forEach((tarea) => {
                        if (tarea.enPapelera) {
                                $tareasPapelera.push(tarea);
                        } else if (tarea.estado == ESTADO.COMPLETADO) {
                                $tareasCompletadas.push(tarea);
                        } else {
                                $tareasMostrar.push(tarea);
                        }
                });

                $tareasMostrar = $tareasMostrar;
                $tareasCompletadas = $tareasCompletadas;
                $tareasPapelera = $tareasPapelera;
        };

        const actualizarTareas = () => {
                $tareasPapelera.splice(0, $tareasPapelera.length);
                $tareasCompletadas.splice(0, $tareasCompletadas.length);
                $tareasMostrar.splice(0, $tareasMostrar.length);

                filtrarTareas();
        };

        $: if ($carpetaActiva !== carpetaActivaStatic) {
                if (CARPETAS.compare($carpetaActiva, CARPETAS.DEFAULT)) {
                        //* Fetch defs
                        fetch(`/api/tareas/null/${$user.idUsuario}`).then(
                                (res) => {
                                        res.json().then((data) => {
                                                console.log(data);
                                                tareas = data;
                                                actualizarTareas();
                                        });
                                }
                        );
                } else if (
                        CARPETAS.compare($carpetaActiva, CARPETAS.PROXIMAS)
                ) {
                        // * Fetch proximas
                        fetch(`/api/tareas/-1/${$user.idUsuario}`).then(
                                (res) => {
                                        res.json().then((data) => {
                                                tareas = data;
                                                actualizarTareas();
                                        });
                                }
                        );
                } else {
                        // fetch tareas carpeta
                        fetch(`/api/tareas/${$carpetaActiva.idCarpeta}`).then(
                                (res) => {
                                        res.json().then((data) => {
                                                console.log(data);
                                                tareas = data;
                                                actualizarTareas();
                                        });
                                }
                        );
                }
        }

        $: if (tareas) {
                actualizarTareas();
        }
</script>

<Row>
        <TopMenu />
</Row>

<Row class="py-1">
        <h3>Tareas no completadas</h3>
        <ListGroup flush>
                {#each $tareasMostrar as tarea}
                        <Tarea {tarea} />
                {/each}
        </ListGroup>
</Row>
{#if $carpetaActiva.idCarpeta !== -1}
        <Row>
                <h3>Tareas completadas</h3>
                <ListGroup flush>
                        {#each $tareasCompletadas as tarea}
                                <Tarea {tarea} />
                        {/each}
                </ListGroup>
        </Row>
        <Row>
                <h3>Tareas en papelera</h3>
                <ListGroup flush>
                        {#each $tareasPapelera as tarea}
                                <Tarea {tarea} />
                        {/each}
                </ListGroup>
        </Row>
{/if}
