<script>
        import { carpetaActiva } from "$lib/stores";
        import {
                Container,
                Row,
                Col,
                NavbarBrand,
                Button,
                Icon,
                ButtonDropdown,
                DropdownToggle,
                DropdownMenu,
                DropdownItem,
        } from "sveltestrap";

        export let user;
</script>

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
                                        <Button
                                                color="success"
                                                class="align-self-end"
                                        >
                                                <Icon name="share-fill" />
                                        </Button>
                                </Col>
                        </Row>
                </Col>
                <Col xs="5" style="display: flex;" class="justify-content-end">
                        <form method="post" action="/login?/logout">
                                <ButtonDropdown>
                                        <DropdownToggle color="info" caret
                                                >{user.nombre}
                                                {user.apellido}</DropdownToggle
                                        >
                                        <DropdownMenu>
                                                <DropdownItem
                                                        >Modificar perfil</DropdownItem
                                                >
                                                <DropdownItem
                                                        type="submit"
                                                        action="/login?/logout"
                                                        >Cerrar sesión</DropdownItem
                                                >
                                        </DropdownMenu>
                                </ButtonDropdown>
                        </form>
                </Col>
        </Row>
</Container>
