<!-- Mostrar las tareas de hoy -->

<script lang="ts">
    import { carpetaActiva } from "$lib/stores";
    import TopMenu from "$lib/views/principal/TopMenu.svelte";
    import { Col, Container, Row } from "sveltestrap";
    import type { PageData } from "./$types";

    export let data: PageData;

    $carpetaActiva.idCarpeta = null;
    $carpetaActiva.nombre = "Hoy";
</script>

<Col xs="7">
    <Row>
        <TopMenu idUsuario={data.usuario.idUsuario} idCarpeta={null} />
    </Row>

    {#if data.tareas.length > 0}
        {#each data.tareas as tarea}
            <p>{tarea.titulo}</p>
        {/each}
    {:else}
        <p>Aún no has agregado tareas a esta lista</p>
    {/if}
    Holawa

    <pre>
        {JSON.stringify(data, null, 2)}
    </pre>
</Col>
<Col xs="5">Selecciona una tarea para ver los detalles</Col>
