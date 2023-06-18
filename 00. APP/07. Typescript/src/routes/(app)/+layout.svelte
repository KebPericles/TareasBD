<script lang="ts">
    import {
        Row,
        Navbar,
        Col,
        Form,
        Input,
        Button,
        Icon,
        ButtonDropdown,
        Container,
        DropdownItem,
        DropdownMenu,
        DropdownToggle,
        NavbarBrand,
        ButtonGroup,
        ListGroup,
        ListGroupItem,
    } from "sveltestrap";
    import type { LayoutData } from "./$types";
    import { carpetaActiva } from "$lib/stores";
    import CarpetaItem from "$lib/views/leftbar/CarpetaItem.svelte";
    import TopMenu from "$lib/views/leftbar/TopMenu.svelte";

    export let data: LayoutData;
    let usuario = data.usuario;
    let carpetas = data.carpetas;

    console.log("carpetas", carpetas);
    console.log(carpetas);

    $: hoyActivo = $carpetaActiva.idCarpeta === null;
    $: proximoActivo = $carpetaActiva.idCarpeta === -1;
</script>

<Row>
    <Navbar color="light" class="align-self-start">
        <Col xs="4">
            <Form action="/api/buscar" method="GET">
                <Row class="justify-content-around">
                    <Col xs="9">
                        <Input placeholder="Busqueda" type="search" />
                    </Col>
                    <Col xs="2">
                        <Button color="primary" type="submit"
                            ><Icon name="search" /></Button
                        >
                    </Col>
                </Row>
            </Form>
        </Col>
        <Col xs="8">
            <Container fluid>
                <Row>
                    <Col xs="7">
                        <Row>
                            <Col
                                style="display: flex;"
                                class="justify-content-center"
                            >
                                <NavbarBrand
                                    >{$carpetaActiva.nombre}</NavbarBrand
                                >
                            </Col>
                            <Col xs="2">
                                <Button color="success" class="align-self-end">
                                    <Icon name="share-fill" />
                                </Button>
                            </Col>
                        </Row>
                    </Col>
                    <Col
                        xs="5"
                        style="display: flex;"
                        class="justify-content-end"
                    >
                        <form method="POST" action="/login?/logout">
                            <ButtonDropdown>
                                <DropdownToggle color="info" caret
                                    >{usuario.nombre}
                                    {usuario.apellido}</DropdownToggle
                                >
                                <DropdownMenu>
                                    <DropdownItem href="/perfil"
                                        >Modificar perfil</DropdownItem
                                    >
                                    <DropdownItem type="submit"
                                        >Cerrar sesión</DropdownItem
                                    >
                                </DropdownMenu>
                            </ButtonDropdown>
                        </form>
                    </Col>
                </Row>
            </Container>
        </Col>
    </Navbar>
</Row>
<Row>
    <Col xs="4">
        <Row style="flex-direction: column;">
            <Col xs="12" class="py-2">
                <ListGroup>
                    <ListGroupItem active={hoyActivo} action href="/"
                        >Hoy</ListGroupItem
                    >
                    <ListGroupItem
                        active={proximoActivo}
                        action
                        href="/lista/-1">Próximas tareas</ListGroupItem
                    >
                </ListGroup>
            </Col>
            <form method="post" action="/?/borrarCarpetas">
                <Col xs="12">
                    <Row>
                        <TopMenu user={usuario} />
                    </Row>
                </Col>
                <Col xs="12" class="py-2">
                    <Col xs="12">
                        {#if carpetas}
                            <ListGroup flush>
                                {#each carpetas as carpeta}
                                    <CarpetaItem {carpeta} />
                                {/each}
                            </ListGroup>
                        {:else}
                            No tienes carpetas
                        {/if}
                    </Col>
                </Col>
            </form>
            <Col xs="12">
                <Row>
                    <ButtonGroup>
                        <Button>
                            <Icon name="trash3-fill" /> Papelera
                        </Button>
                    </ButtonGroup>
                </Row>
            </Col>
        </Row>
    </Col>
    <Col xs="8" style="display: flex;" class="flex-row">
        <slot />
    </Col>
</Row>
