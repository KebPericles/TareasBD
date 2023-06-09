<script>
        import { F_Usuario } from "$lib/forms/01. usuario";
        import {
                Button,
                Container,
                Input,
                InputGroup,
                InputGroupText,
                Label,
                Row,
        } from "sveltestrap";

        import InputField from "./00. InputField.svelte";

        let registrar = false;

        const switchMode = () => {
                registrar = !registrar;
        };

        let fields = Object.keys(F_Usuario).filter(
                (key) => !key.includes("ID_")
        );
</script>

<Container>
        {#if !registrar}
                <form method="POST" action="/login?/login">
                        <Row class="g-4 p-3">
                                
                                <InputGroup>
                                        <InputGroupText>Correo</InputGroupText>
                                        <Input
                                                placeholder="Correo"
                                                name={F_Usuario.CORREO.name}
                                                type="email"
                                        />
                                </InputGroup>

                                <InputGroup>
                                        <InputGroupText
                                                >Contraseña</InputGroupText
                                        >
                                        <Input
                                                placeholder="Contraseña"
                                                name={F_Usuario.CONTRASENA.name}
                                                type="password"
                                        />
                                </InputGroup>
                                <Button
                                        class="align-self-end"
                                        color="primary"
                                        type="submit">Iniciar sesión</Button
                                >
                                <Button
                                        class="align-self-end"
                                        on:click={switchMode}
                                        >Registrarse</Button
                                >
                        </Row>
                </form>
        {:else}
                <form method="POST" action="/login?/register">
                        <Row class="g-4 p-3">
                                {#each fields as field}
                                        <InputField field={F_Usuario[field]}></InputField>
                                {/each}

                                <Button
                                        class="align-self-end"
                                        color="primary"
                                        type="submit">Registrarse</Button
                                >
                                <Button
                                        class="align-self-end"
                                        on:click={switchMode}
                                        >¿Ya tienes una cuenta? Inicia sesión</Button
                                >
                        </Row>
                </form>
        {/if}
</Container>
