<script>
        import { ESTADO } from "$lib/forms/01. tarea.js";
        import { tareaActiva } from "$lib/stores";
        import {
                Button,
                ButtonGroup,
                Col,
                FormCheck,
                FormGroup,
                FormText,
                Icon,
                Input,
                InputGroup,
                InputGroupText,
                Label,
                Row,
        } from "sveltestrap";
        import Etiquetas from "./30. Etiquetas.svelte"

        let tareaCompletada =
                $tareaActiva.estado == ESTADO.COMPLETADO ? true : false;

        const cambiarEstado = () => {
                $tareaActiva.estado =
                        $tareaActiva.estado === ESTADO.COMPLETADO
                                ? ESTADO.NO_COMPLETADO
                                : ESTADO.COMPLETADO;
        };
</script>

{#if $tareaActiva}
        <Row class="p-2">
                <Col xs="9">
                        <InputGroup>
                                <Input
                                        class="btn-check"
                                        type="checkbox"
                                        id="T_Completada"
                                        bind:checked={tareaCompletada}
                                        autocomplete="off"
                                />
                                <Label
                                        class="btn btn-primary"
                                        for="T_Completada"
                                >
                                        {#if tareaCompletada}
                                                <Icon
                                                        name="circle-fill"
                                                />
                                        {:else}
                                                <Icon name="circle" />
                                        {/if}
                                </Label>
                                <Input
                                        type="text"
                                        value={$tareaActiva.titulo}
                                        placeholder="Nombre de tarea"
                                />
                        </InputGroup>
                </Col>
                <Col xs="3">
                        <Button class="align-self-center">
                                <Icon name="share-fill" />
                        </Button>
                </Col>
        </Row>
        <Row>
                <Col xs="12">
                        <Input
                                type="textarea"
                                value={$tareaActiva.descripcion}
                        />
                </Col>
                <Col xs="12" class="g-2 justify-content-center">
                        <Row class="g-2">
                                <Col>
                                        <InputGroup>
                                                <InputGroupText>Fecha inicio</InputGroupText>
                                                <Input
                                                        type="datetime-local"
                                                        value={$tareaActiva.fechaInicio}
                                                />
                                        </InputGroup>
                                </Col>
                                <Col>
                                        <InputGroup>
                                                <InputGroupText>Fecha de vencimiento</InputGroupText>
                                                <Input
                                                        type="datetime-local"
                                                        value={$tareaActiva.fechaVencimiento}
                                                />
                                        </InputGroup>
                                </Col>
                        </Row>
                </Col>
        </Row>
        <Row class="p-1 g-1">
                <Etiquetas></Etiquetas>
        </Row>
        <Row class="p-2">
                <ButtonGroup>
                        <Button>Guardar</Button>
                        <Button color="danger">
                                <Icon name="trash3-fill" />
                        </Button>
                </ButtonGroup>
        </Row>
{/if}

TODO 30. Tarea
