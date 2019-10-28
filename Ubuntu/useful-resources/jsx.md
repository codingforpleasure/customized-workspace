<!--ts-->
   * [JSX (Javascript Syntax with extensions)](#jsx-javascript-syntax-with-extensions)
      * [Embedding Expressions in JSX](#embedding-expressions-in-jsx)
      * [Conditionals in JSX](#conditionals-in-jsx)
         * [Approach #1: Trenary operator](#approach-1-trenary-operator)
         * [Approach #2: Simple if](#approach-2-simple-if)
      * [Looping in JSX](#looping-in-jsx)

<!-- Added by: gil_diy, at: 2019-10-07T21:35+03:00 -->

<!--te-->


# JSX (Javascript Syntax with extensions)


[Reference](https://reactjs.org/docs/introducing-jsx.html)

* It's transpiled to Javascript, it's done by Babel.


JSX is more strict than HTML - elements must either:

* Have an explicit closing tag: `<b> ... </b>`

* Be explicitly self-closed : `<input name="msg"/>`


## Embedding Expressions in JSX

```jsx
const name = 'Josh Perez';
const element = <h1>Hello, {name}</h1>;
```

```jsx
function formatName(user) {
  return user.firstName + ' ' + user.lastName;
}

const user = {
  firstName: 'Harper',
  lastName: 'Perez'
};

const element = (
  <h1>
    Hello, {formatName(user)}!
  </h1>
);
```


```jsx
const element = (
  <h1 className="greeting">
    Hello, world!
  </h1>
);
```


Example:

```jsx
function getMood(){
	const moods = ['Angry', 'Hungry', 'Silly', 'Quiet', 'Paranoid'];
	return moods[Math.floor(Math.random() * moods.length)];
}


class JSXDemo extends React.Component {
	render() {
		return (
			<div>
				<H1>My Current Mood is: {getMood()}</H1>
			</div>
		);
	}
}
```



## Conditionals in JSX

[Link](https://blog.logrocket.com/conditional-rendering-in-react-c6b0e5af381e/)

### Approach #1: Trenary operator


```javascript
function getNum(){
	return Math.floor(Math.random()*10)+1;
}

class NumPicker extends React.Component {
	render() {
		return (
				const num = getNum();
				<div>
					<H1>Your number is: {num}</H1>
					<p>{num === 7 ? 'Congrats!': 'Unlucky!'}</p>
					{
						num ===7 &&
						<img src="https://i.giphy.com.media/nXhfjd/giphy.webp">
					}
				</div>

		);
	}
}
```

### Approach #2: Simple if

```javascript
class NumPicker extends React.Component {
	render() {
		const num = getNum();
		let msg;
		if (num === 7){
			msg =
			<div>
				<h2>congrats you win!</h2>
				<img src = "https://i.giphy.com.media/nXhfjd/giphy.webp"/>
			</div>
		} else{
			msg = <p>Sorry You Lose!</p>
		}

		return (
			<div>
				<h1>Your number is: {num}</h1>
				{msg}
			</div>
		);
	}
}
```

## Looping in JSX

using map

```jsx
class Messages extends React.component {
	render() {

		const msgs= [
			{id: 1, text: "Greetings!"},
			{id: 2, text: "Goodbye!"},
		];

		return (
			<ul>
				{msgs.map(m=> <li>{m.text}</li>)}
			</ul>
		);
	}
}
```

Another example:

```jsx
class App extends React.component {
	render() {
		return (
			<div>
			<Friend
				name="Elton"
				hobbies={['Piano', 'Singing', 'Dancing']}
			/>
			<Friend
				name="Frida"
				hobbies={['Drawing', 'Painting']}
			/>
			<div>
		);
	}
}
```

```jsx
class Friend extends React.component {
	render() {
		const { name, hobbies } = this.props;
		return (
			<div>
				<h1>{name}</h1>
				<ul>
					{hobbies.map(hobby => <li>{hobby}</li>)}
				</ul>
			<div>
		);
	}
}
```
