<!-- Mostrar las tareas de la carpeta -->

<script lang="ts">
    import { Container, Row, Col, ListGroup } from "sveltestrap";
    import type { LayoutData } from "./$types";
    import { Tarea } from "$lib/schemas/schemas";
    import { carpetaActiva } from "$lib/stores";
    import TopMenu from "$lib/views/principal/TopMenu.svelte";

    export let data: LayoutData;
    let tareas = data.tareas;

    let tareasMostrar: Tarea[] = [];
    let tareasCompletadas: Tarea[] = [];
    let tareasPapelera: Tarea[] = [];

    
</script>

<Container fluid>
    <Row>
        <Col xs="7" class="g-1 p-1">
            <Row>
                <TopMenu idUsuario={data.usuario.idUsuario} />
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
        </Col>
        <Col xs="5" class="justify-content-end p-2">
            <slot />
        </Col>
    </Row>
</Container>
