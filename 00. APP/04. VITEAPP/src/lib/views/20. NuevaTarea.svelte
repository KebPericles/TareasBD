<script>
        import {
                InputGroup,
                InputGroupText,
                Input,
                FormGroup,
                FormText,
                Col,
        } from "sveltestrap";
        export let idUsuario;
        import { carpetaActiva, user } from "$lib/stores";
        import { PRIORIDAD } from "$lib/forms/01. tarea";
        import { onMount } from "svelte";

        const actualizarCarpetas = () => {
                fetch(`/api/carpetas/${idUsuario}`).then((res) => {
                        res.json().then((data) => {
                                console.log(data);
                                $user.carpetas = data.carpetas;
                        });
                });
        };

        const nuevaTarea = () => {
                let inputNombre = document.getElementById("I_TareaNombre");
                let inputVencimiento =
                        document.getElementById("I_TareaVencimiento");
                let inputInicio = document.getElementById("I_TareaInicio");
                let inputPrioridad =
                        document.getElementById("I_TareaPrioridad");

                let newTaskName = inputNombre.value;
                let newTaskPrio = inputPrioridad.value;
                let newTaskInicio = inputInicio.value;
                let newTaskVencimiento = inputVencimiento.value;

                fetch("/api/tareas", {
                        method: "POST",
                        body: JSON.stringify({
                                tarea: {
                                        titulo: newTaskName,
                                        idUsuario: idUsuario,
                                        prioridad: newTaskPrio,
                                        fechaInicio: newTaskInicio,
                                        fechaVencimiento: newTaskVencimiento,
                                        idCarpeta: $carpetaActiva.idCarpeta
                                },
                        }),
                }).then((res) => {
                        res.json().then((data) => {
                                if (data.status === "Registrao")
                                        actualizarCarpetas();
                                inputNombre.value = "";
                                document.getElementById("prioDef").setAttribute(
                                        "selected",
                                        "true"
                                );
                        });
                });
        };

        const keypressFolderName = (e) => {
                if (e.keyCode === 13) nuevaTarea();
        };

        onMount(() => {
                document.getElementById("prioDef").setAttribute(
                        "selected",
                        "true"
                );
        });
</script>

<InputGroup>
        <!-- svelte-ignore a11y-click-events-have-key-events -->
        <div on:click={nuevaTarea}>
                <InputGroupText>+</InputGroupText>
        </div>
        <Input
                on:keypress={keypressFolderName}
                id="I_TareaNombre"
                name="taskName"
                placeholder="Título de la tarea"
        />

        <Col xs="2" data-tooltip="Prioridad de la tarea" data-flow="top">
                <Input type="select" id="I_TareaPrioridad">
                        <option id="prioDef" selected value={PRIORIDAD.NULL}
                                >-</option
                        >
                        <option value={PRIORIDAD.ALTA}>⏫</option>
                        <option value={PRIORIDAD.MEDIA}>🔼</option>
                        <option value={PRIORIDAD.BAJA}>🔽</option>
                </Input>
        </Col>
        <Col xs="3" style="display: flex;">
                <Col xs="6" data-tooltip="Fecha de inicio" data-flow="top">
                        <Input
                                id="I_TareaInicio"
                                type="datetime-local"
                                class="nueva-tarea"
                                placeholder="Fecha inicio"
                        />
                </Col>
                <Col xs="6" data-tooltip="Fecha de vencimiento" data-flow="top">
                        <Input
                                id="I_TareaVencimiento"
                                type="datetime-local"
                                class="nueva-tarea"
                        />
                </Col>
        </Col>
</InputGroup>
