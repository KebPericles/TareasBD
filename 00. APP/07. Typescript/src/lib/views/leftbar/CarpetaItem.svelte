<script lang="ts">
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
        import { carpetaActiva, carpetasSeleccionadas } from "$lib/stores";
        import type { Carpeta } from "$lib/schemas/schemas";

        export let carpeta: Carpeta;

        $: activa = $carpetaActiva === carpeta ? true : false;
        let idNameCarpeta = "carpeta-" + carpeta.idCarpeta;

        const cambiarCarpeta = () => {
                $carpetaActiva = carpeta;
        };

        const checkCarpeta = (e: any) => {
                if (e.srcElement?.checked) {
                        $carpetasSeleccionadas.push(carpeta);
                        $carpetasSeleccionadas = $carpetasSeleccionadas;
                } else
                        $carpetasSeleccionadas = $carpetasSeleccionadas.filter(
                                (car: Carpeta) =>
                                        car.idCarpeta !== carpeta.idCarpeta
                        );
        };
</script>

{#if !carpeta.enPapelera}
        {#if carpeta?.carpetasHijas?.length && carpeta?.carpetasHijas?.length > 0}
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
                                name={idNameCarpeta}
                        />
                </ListGroupItem>
        {/if}
{/if}
