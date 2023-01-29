<script>
    /** @type {import('./$types').PageData} */  export let data;
</script>

<a href="/">Home</a>
<h1>{data.title}</h1>
<div>{@html data.content}</div>