<script lang="ts">
    import {
        Row,
        Button,
        Input,
        InputGroup,
        InputGroupText,
    } from "sveltestrap";
    import type { ActionData, PageData } from "./$types";

    export let data: PageData;
    export let form: ActionData;
</script>

<pre>{JSON.stringify(data, null, 2)}</pre>,
<pre>{JSON.stringify(form, null, 2)}</pre>

<form method="POST" action="/register">
    <Row class="g-4 p-3">
        <InputGroup>
            <InputGroupText>Correo</InputGroupText>
            <Input placeholder="Correo" name="correo" type="email" />
        </InputGroup>

        <InputGroup>
            <InputGroupText>Contraseña</InputGroupText>
            <Input placeholder="Contraseña" name="contrasena" type="password" />
        </InputGroup>

        <InputGroup>
            <InputGroupText>Nombre</InputGroupText>
            <Input placeholder="Nombre" name="nombre" type="text" />
        </InputGroup>

        <InputGroup>
            <InputGroupText>Apellido</InputGroupText>
            <Input placeholder="Apellido" name="apellido" type="text" />
        </InputGroup>

        <Button class="align-self-end" color="primary" type="submit"
            >Registrarse</Button
        >
        <Button class="align-self-end" href="/login"
            >¿Ya tienes una cuenta? Inicia sesión</Button
        >
    </Row>
</form>
