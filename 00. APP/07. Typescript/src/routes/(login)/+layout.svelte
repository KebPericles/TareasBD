<script lang="ts">
    import { Row, Col, Container } from "sveltestrap";
    import type { LayoutData } from "./$types";

    export let data: LayoutData;
</script>

<Row class=" justify-content-center">
    <Col xs="6">
        <Container>
            <slot />
        </Container>
    </Col>
</Row>
