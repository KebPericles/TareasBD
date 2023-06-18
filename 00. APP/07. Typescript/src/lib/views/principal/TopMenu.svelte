<script lang="ts">
        import {
                InputGroup,
                InputGroupText,
                Input,
                FormGroup,
                FormText,
                Col,
        } from "sveltestrap";
        import type { Carpeta, Usuario } from "$lib/schemas/schemas";
        import { onMount } from "svelte";

        export let idUsuario: Usuario["idUsuario"];
        export let idCarpeta: Carpeta["idCarpeta"];

        onMount(() => {
                document.getElementById("prioDef")?.setAttribute(
                        "selected",
                        "true"
                );
        });
</script>

<form method="post" action="/lista?/agregarTarea">
<InputGroup>
                <input type="hidden" name="idUsuario" value={idUsuario} />
                <input type="hidden" name="idCarpeta" value={idCarpeta} />
                <!-- svelte-ignore a11y-click-events-have-key-events -->
                <button style="padding: 0; border: 0;" type="submit">
                        <InputGroupText>+</InputGroupText>
                </button>
                <Input name="titulo" placeholder="Título de la tarea" />

                <Col
                        xs="2"
                        data-tooltip="Prioridad de la tarea"
                        data-flow="top"
                >
                        <Input type="select" name="prioridad">
                                <option id="prioDef" selected value="null"
                                        >-</option
                                >
                                <option value="Alta">⏫</option>
                                <option value="Media">🔼</option>
                                <option value="Baja">🔽</option>
                        </Input>
                </Col>
                <Col xs="3" style="display: flex;">
                        <Col
                                xs="6"
                                data-tooltip="Fecha de inicio"
                                data-flow="top"
                        >
                                <Input
                                        type="datetime-local"
                                        class="nueva-tarea"
                                        placeholder="Fecha inicio"
                                        name="fechaInicio"
                                />
                        </Col>
                        <Col
                                xs="6"
                                data-tooltip="Fecha de vencimiento"
                                data-flow="top"
                        >
                                <Input
                                        name="fechaVencimiento"
                                        type="datetime-local"
                                        class="nueva-tarea"
                                />
                        </Col>
                </Col>
        </InputGroup>
</form>
