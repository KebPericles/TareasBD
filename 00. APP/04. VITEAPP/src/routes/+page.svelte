<script>
        import { F_Usuario } from "$lib/forms/01. usuario.js";
        import Carpeta from "$lib/views/10. Carpeta.svelte";
        import Login from "$lib/views/00. Login.svelte";
        import ListaTareas from "$lib/views/20. ListaTareas.svelte";
        import Tarea from "$lib/views/30. Tarea.svelte";
        import NuevaCarpeta from "$lib/views/10. NuevaCarpeta.svelte";
        import TopMenu from "$lib/views/10. TopMenu.svelte";

        import {
                Button,
                ButtonGroup,
                Col,
                Container,
                Icon,
                Input,
                InputGroup,
                InputGroupText,
                ListGroup,
                ListGroupItem,
                Row,
        } from "sveltestrap";

        import { carpetaActiva, user } from "$lib/stores.js";
        import { CARPETAS, F_Carpeta } from "$lib/forms/01. carpeta.js";

        export let data;

        let tareas = data.tareas;
        if ($user) {
                $user.tareas = tareas;
        }

        let contextFolderTarget;

        /**
         * @type {import('$lib/server/database/01. usuario.js').Usuario}
         */
        $carpetaActiva = data.carpetaActiva;
        let hoyActivo = false;
        let proximoActivo = false;

        $: if (CARPETAS.compare($carpetaActiva, CARPETAS.DEFAULT)) {
                proximoActivo = false;
                hoyActivo = true;
        } else if (CARPETAS.compare($carpetaActiva, CARPETAS.PROXIMAS)) {
                proximoActivo = true;
                hoyActivo = false;
        } else {
                proximoActivo = false;
                hoyActivo = false;
        }

        const cambiarCarpeta = (e) => {
                /**
                 * @type {String}
                 */
                let id = JSON.parse(e.srcElement.id.replace("C_", ""));

                if (id === $carpetaActiva.idCarpeta) return;
                if (id === CARPETAS.DEFAULT.idCarpeta)
                        $carpetaActiva = CARPETAS.DEFAULT;
                else if (id === CARPETAS.PROXIMAS.idCarpeta)
                        $carpetaActiva = CARPETAS.PROXIMAS;

                // Carpeta específica manejada en el componente carpeta
        };
</script>

{#if !$user}
        <Row class="justify-content-center">
                <Col xs="6">
                        <Login />
                </Col>
        </Row>
{:else}
        <Row class="align-self-start">
                <Col xs="4">
                        <Row style="flex-direction: column;">
                                <Col xs="12" class="py-2">
                                        <ListGroup>
                                                <ListGroupItem
                                                        id="C_null"
                                                        active={hoyActivo}
                                                        action
                                                        on:click={cambiarCarpeta}
                                                        >Hoy</ListGroupItem
                                                >
                                                <ListGroupItem
                                                        id="C_-1"
                                                        active={proximoActivo}
                                                        action
                                                        on:click={cambiarCarpeta}
                                                        >Próximas tareas</ListGroupItem
                                                >
                                        </ListGroup>
                                </Col>
                                <Col xs="12">
                                        <Row>
                                                <TopMenu />
                                        </Row>
                                </Col>
                                <Col xs="12" class="py-2">
                                        <Col xs="12">
                                                {#if $user.carpetas}
                                                        <ListGroup flush>
                                                                {#each $user.carpetas as carpeta}
                                                                        <Carpeta
                                                                                {carpeta}
                                                                        />
                                                                {/each}
                                                        </ListGroup>
                                                {:else}
                                                        No tienes carpetas
                                                {/if}
                                        </Col>
                                </Col>
                                <Col xs="12">
                                        <Row>
                                                <ButtonGroup>
                                                        <Button>
                                                                <Icon
                                                                        name="trash3-fill"
                                                                /> Papelera
                                                        </Button>
                                                </ButtonGroup>
                                        </Row>
                                </Col>
                        </Row>
                </Col>
                <Col xs="8">
                        <Container fluid>
                                <Row>
                                        <Col xs="7" class="g-1 p-1">
                                                <ListaTareas {tareas} />
                                        </Col>
                                        <Col
                                                xs="5"
                                                class="justify-content-end p-2"
                                        >
                                                <Tarea />
                                        </Col>
                                </Row>
                        </Container>
                </Col>
        </Row>
{/if}
