<script>
        import { carpetaActiva, user } from "$lib/stores.js";
        import {
                Container,
                Row,
                Col,
                Navbar,
                NavItem,
                Nav,
                Input,
                Button,
                Icon,
                Form,
                Dropdown,
                DropdownItem,
                DropdownMenu,
                ButtonDropdown,
                DropdownToggle,
                NavbarBrand,
        } from "sveltestrap";

        import DinamicNavbar from "$lib/views/00. DinamicNavbar.svelte";

        export let data;

        $user = data.user;
</script>

{#if $user}
        <Row>
                <Navbar color="light" class="align-self-start">
                        <Col xs="4">
                                <Form action="/api/buscar" method="GET">
                                        <Row>
                                                <Col>
                                                        <Input
                                                                placeholder="Busqueda"
                                                                type="search"
                                                        />
                                                </Col>
                                                <Col xs="4">
                                                        <Button
                                                                color="primary"
                                                                type="submit"
                                                                ><Icon
                                                                        name="search"
                                                                /></Button
                                                        >
                                                </Col>
                                        </Row>
                                </Form>
                        </Col>
                        <Col xs="8">
                                <DinamicNavbar user={$user} />
                        </Col>
                </Navbar>
        </Row>
{/if}

<slot />

<svelte:head>
        <!--BOOTSTRAP-->
        <link
                href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
                rel="stylesheet"
                integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
                crossorigin="anonymous"
        />
        <script
                src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
                crossorigin="anonymous"
        ></script>
        <link
                rel="stylesheet"
                href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
        />
</svelte:head>

<style>
</style>
