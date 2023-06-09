<script>
    import { InputGroup, InputGroupText, Input } from "sveltestrap";

        export let field;
</script>

<InputGroup>
        <InputGroupText>{field.placeholder}</InputGroupText>
        <Input
                placeholder={field.placeholder}
                name={field.name}
                type={field.type}
        />
</InputGroup>