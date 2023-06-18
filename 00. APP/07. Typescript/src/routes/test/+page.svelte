<script>
        export let data;
        export let form;
</script>

<pre>
        {JSON.stringify(data)}
{JSON.stringify(form)}
</pre>

<form method="get" action="/test/">
        <input type="checkbox" name="test" value="asdf" />
        <input type="checkbox" name="test" value="asdg" />
        <input type="submit" />
</form>
