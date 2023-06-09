<script>
        import {
                Accordion,
                AccordionHeader,
                AccordionItem,
                FormCheck,
                Input,
                Label,
                ListGroup,
                ListGroupItem,
                Row,
        } from "sveltestrap";
        import Carpeta from "./10. Carpeta.svelte";
        import { carpetaActiva, carpetasSeleccionadas } from "$lib/stores";

        /**
         * @type {import('../server/database/01. carpeta').Carpeta}
         */
        export let carpeta;

        $: activa = $carpetaActiva === carpeta ? true : false;
        let idNameCarpeta = "chbCarpeta" + carpeta.idCarpeta;

        const cambiarCarpeta = () => {
                $carpetaActiva = carpeta;
        };
        const checkCarpeta = (e) => {
                if (e.srcElement.checked) {
                        $carpetasSeleccionadas.push(carpeta);
                        $carpetasSeleccionadas = $carpetasSeleccionadas;
                } else
                        $carpetasSeleccionadas = $carpetasSeleccionadas.filter(
                                (car) => car.idCarpeta !== carpeta.idCarpeta
                        );
        };
</script>

{#if !carpeta.enPapelera}
        {#if carpeta.carpetasHijas && carpeta.carpetasHijas.length > 0}
                <Accordion>
                        <AccordionHeader>{carpeta.nombre}</AccordionHeader>
                        {#each carpeta.carpetasHijas as carpetaHija}
                                <svelte:self carpeta={carpetaHija} />
                        {/each}
                </Accordion>
        {:else}
                <ListGroupItem active={activa} on:click={cambiarCarpeta}>
                        <FormCheck
                                id={idNameCarpeta}
                                on:change={checkCarpeta}
                                label={carpeta.nombre}
                        />
                </ListGroupItem>
        {/if}
{/if}
