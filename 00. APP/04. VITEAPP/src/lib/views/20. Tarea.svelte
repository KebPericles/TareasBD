<script>
        import { ESTADO } from "$lib/forms/01. tarea";
        import { tareaActiva, tareasSeleccionadas } from "$lib/stores";
        import {
                Accordion,
                AccordionHeader,
                ListGroupItem,
                FormCheck,
                AccordionItem,
                InputGroup,
                Input,
                Label,
                Icon,
                InputGroupText,
        } from "sveltestrap";

        export let tarea;

        $: thisTareaActiva =
                $tareaActiva.idTarea === tarea.idTarea ? true : false;
        let tareaCompletada = tarea.estado == ESTADO.COMPLETADO ? true : false;
        let idInputTareaCompletada = `T_Completada${tarea.idTarea}`;

        // Maneja el cambio de estado de tarea
        $: if (tareaCompletada !== (tarea.estado == ESTADO.COMPLETADO)) {
                actualizarTarea();
        }

        const actualizarTarea = () => {
                tarea.estado = tareaCompletada
                        ? ESTADO.COMPLETADO
                        : ESTADO.NO_COMPLETADO;

                // Serializar
                fetch("/api/tareas", {
                        method: "PUT",
                        body: JSON.stringify({
                                tarea: tarea,
                        }),
                }).then((res) => {
                        res.json().then((data) => {
                                console.log(data);
                        });
                });
        };
        const cambiarTarea = () => {
                $tareaActiva = tarea;
        };

        const checkTarea = (e) => {
                if (e.srcElement.checked) {
                        $tareasSeleccionadas.push(tarea);
                        $tareasSeleccionadas = $tareasSeleccionadas;
                } else
                        $tareasSeleccionadas = $tareasSeleccionadas.filter(
                                (car) => car.idCarpeta !== tarea.idCarpeta
                        );
        };
</script>

<ListGroupItem color="primary" active={thisTareaActiva} on:click={cambiarTarea}>
        <InputGroup>
                <InputGroupText>
                        <Input addon type="checkbox" on:change={checkTarea} />
                </InputGroupText>
                <InputGroupText class="col-8">
                        {tarea.titulo}
                </InputGroupText>
                <InputGroupText>
                        <Input
                                class="btn-check"
                                type="checkbox"
                                id={idInputTareaCompletada}
                                bind:checked={tareaCompletada}
                        />
                        <Label
                                class="btn btn-primary"
                                for={idInputTareaCompletada}
                        >
                                {#if tareaCompletada}
                                        <Icon name="check-circle-fill" />
                                {:else}
                                        <Icon name="check-circle" />
                                {/if}
                        </Label>
                </InputGroupText>
        </InputGroup>
</ListGroupItem>
