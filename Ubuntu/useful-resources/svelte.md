<!--ts-->
   * [Svelte 3.0](#svelte-30)
      * [My project's path](#my-projects-path)
      * [Setup a Svelte template](#setup-a-svelte-template)
      * [Project structure](#project-structure)
      * [Svelte building blocks](#svelte-building-blocks)
      * [Reactivity](#reactivity)
         * [Reactive declarations](#reactive-declarations)
         * [Reactive statements](#reactive-statements)
      * [Props](#props)
         * [Declaring props](#declaring-props)
         * [Default values](#default-values)
         * [Spread props](#spread-props)
      * [Logic](#logic)
         * [Else-if blocks](#else-if-blocks)
         * [For each](#for-each)
         * [Await blocks](#await-blocks)
      * [Bindings](#bindings)
         * [Text input bindings](#text-input-bindings)

<!-- Added by: gil_diy, at: 2019-12-15T14:55+02:00 -->

<!--te-->

# Svelte 3.0


[Swelte Reference](https://svelte.dev/examples#reactive-assignments)

## My project's path

```bash
/home/gil_diy/svelte_js_projects
```

## Setup a Svelte template

```bash
npx degit sveltejs/template/  my-svelte-project
cd my-svelte-project
npm i
```

## Project structure

Name | Description
------------|-----
rollup.config.js | Is a module bundle eqivallent to webpack and parcel
node_modules | project dependencies as defines in `package.json`
public | where the compiled code goes to
src | The actual source code

## Svelte building blocks

Part | Description
-----|-----
Logic | With script tags appear
Style | The CSS part
html  | With no tags appear


## Reactivity

[Link](https://svelte.dev/examples#reactive-assignments)

### Reactive declarations
```javascript
<script>
	let count = 1;

	// the `$:` means 're-run whenever these values change'
	// Which means when somewhere in the code i change the value of count
	// the statment `doubled = count * 2;` reruns.
	// The same with  `quadrupled = doubled * 2` when doubled is modified.

	$: doubled = count * 2;
	$: quadrupled = doubled * 2;

	function handleClick() {
		count += 1;
	}
</script>

<button on:click={handleClick}>
	Count: {count}
</button>

<p>{count} * 2 = {doubled}</p>
<p>{doubled} * 2 = {quadrupled}</p>
```

### Reactive statements

[Reactive statements](https://svelte.dev/examples#reactive-statements)

```javascript
<script>
	let count = 0;

	$: if (count >= 10) {
		alert(`count is dangerously high!`);
		count = 9;
	}

	function handleClick() {
		count += 1;
	}
</script>

<button on:click={handleClick}>
	Clicked {count} {count === 1 ? 'time' : 'times'}
</button>
```

## Props
### Declaring props

[Declaring-props](https://svelte.dev/examples#declaring-props)

**App.svelte** file:

```javascript
<script>
	import Nested from './Nested.svelte';
</script>

<Nested answer={42}/>
```

**Nested.svelte** file:

```javascript
<script>
	export let answer;
</script>

<p>The answer is {answer}</p>
```

### Default values

[Default values](https://svelte.dev/examples#default-values)

**App.svelte** file:

```javascript
<script>
	import Nested from './Nested.svelte';
</script>

<Nested answer={42}/>
<Nested/>
```

**Nested.svelte** file:

```javascript
<script>
	export let answer = 'a mystery';
</script>

<p>The answer is {answer}</p>
```

### Spread props


Using the `spread` operator is presented with 3 dots **used for combining and cloning objects/arrays** .

**App.svelte** file:

```javascript
<script>
	import Info from './Info.svelte';

	const pkg = {
		name: 'svelte',
		version: 3,
		speed: 'blazing',
		website: 'https://svelte.dev'
	};
</script>

<Info {...pkg}/>
```

**Info.svelte** file:

```javascript
<script>
	export let name;
	export let version;
	export let speed;
	export let website;
</script>

<p>
	The <code>{name}</code> package is {speed} fast.
	Download version {version} from <a href="https://www.npmjs.com/package/{name}">npm</a>
	and <a href={website}>learn more here</a>
</p>
```


## Logic

### Else-if blocks

```javascript
<script>
	let x = 7;
</script>

{#if x > 10}
	<p>{x} is greater than 10</p>
{:else if 5 > x}
	<p>{x} is less than 5</p>
{:else}
	<p>{x} is between 5 and 10</p>
{/if}
```

### For each


`i` is an enumerator start from 0 to length of `cats`-1

```javascript
<script>
	let cats = [
		{ id: 'J---aiyznGQ', name: 'Keyboard Cat' },
		{ id: 'z_AbfPXTKms', name: 'Maru' },
		{ id: 'OUtn3pvWmpg', name: 'Henri The Existential Cat' }
	];
</script>

<h1>The Famous Cats of YouTube</h1>

<ul>
	{#each cats as { id, name }, i}
		<li><a target="_blank" href="https://www.youtube.com/watch?v={id}">
			{i+1}: {name}
		</a></li>
	{/each}
</ul>
```


### Await blocks

```javascript
<script>
	let promise = getRandomNumber();

	async function getRandomNumber() {
		const res = await fetch(`tutorial/random-number`);
		const text = await res.text();

		if (res.ok) {
			return text;
		} else {
			throw new Error(text);
		}
	}

	function handleClick() {
		promise = getRandomNumber();
	}
</script>

<button on:click={handleClick}>
	generate random number
</button>

{#await promise}
	<p>...waiting</p>
{:then number}
	<p>The number is {number}</p>
{:catch error}
	<p style="color: red">{error.message}</p>
{/await}
```

## Bindings

### Text input bindings

[text-inputs](https://svelte.dev/examples#text-inputs)

```javascript
<script>
	let name = '';
</script>

<input bind:value={name} placeholder="enter your name">
<p>Hello {name || 'stranger'}!</p>
```
