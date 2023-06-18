<script lang="ts">
    import type { ActionData, PageData } from "./$types";
    import {
        Row,
        Col,
        Container,
        Button,
        Input,
        InputGroup,
        InputGroupText,
    } from "sveltestrap";

    export let data: PageData;
    export let form: ActionData;
</script>

<pre>
    {JSON.stringify(form, null, 2)}
</pre>

<form method="POST" action="/login?/login">
    <Row class="g-4 p-3">
        <InputGroup>
            <InputGroupText>Correo</InputGroupText>
            <Input placeholder="Correo" name="correo" type="email" />
        </InputGroup>

        <InputGroup>
            <InputGroupText>Contraseña</InputGroupText>
            <Input placeholder="Contraseña" name="contrasena" type="password" />
        </InputGroup>
        <Button class="align-self-end" color="primary" type="submit"
            >Iniciar sesión</Button
        >
        <Button class="align-self-end" href="/register"
            >¿Aún no tienes una cuenta? Crea una aquí</Button
        >
    </Row>
</form>
