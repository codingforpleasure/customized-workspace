<!--ts-->
   * [React](#react)
      * [Description](#description)
      * [basic requirements:](#basic-requirements)
      * [How to start my app super fast?](#how-to-start-my-app-super-fast)
         * [create react app](#create-react-app)
      * [Run the server:](#run-the-server)
      * [Props/render](#propsrender)
      * [What is the difference building components as functions vs components as functions?](#what-is-the-difference-building-components-as-functions-vs-components-as-functions)
      * [Orginizing the project:](#orginizing-the-project)
         * [Importing and exporting components to seperate files:](#importing-and-exporting-components-to-seperate-files)
            * [Default imports](#default-imports)
         * [export by name](#export-by-name)
      * [React fragment](#react-fragment)
         * [shorthand for fragments:](#shorthand-for-fragments)
      * [React snippets](#react-snippets)
      * [Conventions - Rule of thumbs](#conventions---rule-of-thumbs)

<!-- Added by: gil_diy, at: 2019-06-02T12:09+03:00 -->

<!--te-->


# React

## Description
At the heart of all react applications there are the components. a component is a piece of the user interface. When we build an application with react we build independed isolated reusable components and then compose and creat complex interfaces.
Every react application has a root component (App), this component contains other child components (tree of components).

Every component is a javascript class which has state and a render method. The state is the data we would like to display when the component is rendered.
The output of this render method is a react element.
A react element maps to DOM Element.
React keeps a lightweigh represntation of the DOM in memory which refer to the Virtual DOM.

Unlike the Real DOM this Virtual DOM is cheap to create. We simply change the state of our componets and React will automatically will change the Real DOM (React = react to state changes)

React is a library it only takes care of rendering the view. it all makes sure the view is synced with the state.


The JSX code will go through Babel, and Babel will convert this JSX code syntax to javascript code so browser can understand. (You can see for yourself here how Babel compiles from JSX to standard javascript code: [babeljs in action](https://babeljs.io/repl))

## basic requirements:
`node -v` (i'm using version 10.13.0)

`npm -v` (i'm using version 6.8.0)

## How to start my app super fast?

### create react app
```bash
npm init react-app my-demo-project
```
or
```bash
npx create-react-app my-demo-project
```

Simply enter the directory which was created and enter vscode:
```bash
cd my-demo-project && code .
```

## Run the server:
```bash
npm start run
```

check it is up and running with:

`localhost:3000`


## Props/render

[Create React.js Components (Youtube)](https://www.youtube.com/watch?v=bd3UGjPwl0w&index=3&list=PLN3n1USn4xlntqksY83W3997mmQPrUmqM)

[Passing Data to Components (Youtube) ](https://www.youtube.com/watch?v=ICmMVfKjEuo&list=PLN3n1USn4xlntqksY83W3997mmQPrUmqM&index=4)

* I have wrote a seperate component called `MySuperComponent` which is invoked as a single tag.

* Moreover I have wrote **MyBody** in 3 equivalent ways:

**Way #1:**
```javascript
const MyBody2 = () => {
  return <p className="App-intro">MyBody!!!! Hoooray (version 2)</p>;
};
```

**Way #2:**
```javascript
function MyBody3() {
  return <p className="App-intro">MyBody!!!! Hoooray (version 3)</p>;
}
```

**Way #3 (The shortest):**
```javascript
const MyBody1 = () => (
  <p className="App-intro">MyBody!!!! Hoooray (version 1)</p>
);
```


Here,
the whole code together is written below:

```javascript
class MySuperComponent extends Component {
  render() {
    return (
      <div>
        Hello there {this.props.name} your age is: {this.props.age}, pineapple
        cost: {this.props.fruits.Pineapple} of {this.props.myArray[1]} Dollars
      </div>
    );
  }
}

const MyBody1 = () => (
  <p className="App-intro">MyBody!!!! Hoooray (version 1)</p>
);

const MyBody2 = () => {
  return <p className="App-intro">MyBody!!!! Hoooray (version 2)</p>;
};

function MyBody3() {
  return <p className="App-intro">MyBody!!!! Hoooray (version 3)</p>;
}

class App extends Component {
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <p>
            Edit <code>src/App.js</code> and save to reload.
          </p>
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
        </header>
        <MySuperComponent
          name={"Gil"}
          age={35}
          fruits={{ Apple: 35, Pineapple: "70kg" }}
          myArray={[1, 3, 4, 8, 9]}
        />
        <MyBody1 />
        <MyBody2 />
        <MyBody3 />
      </div>
    );
  }
}
```


[passing functions to Components](https://youtu.be/ICmMVfKjEuo?list=PLN3n1USn4xlntqksY83W3997mmQPrUmqM&t=294)
## What is the difference building components as functions vs class bases components?

In functional component I can't refer to **this.props**, instead your props is passed as **your first argument to the function** :

```javascript
const Body = (props) => <p className="App-intro">{props.text}</p>
```
see function: `MyBody4`


* In function you just return content
* In a class you have an explicit render method, and your render return the content.


## Orginizing the project:
### Importing and exporting components to seperate files:
```bash
mkdir ./src/components
```
Each file holds a single component resides in the components directory.

#### Default imports

The following code will be moved to a sepearte file called `Body.js`:
```javascript
class Body extends React.Component {
  render() {
    return (
      <div>
        Hello there {this.props.name} your age is: {this.props.age}, pineapple
        cost: {this.props.fruits.Pineapple} of {this.props.myArray[1]} Dollars,
        example for invoking a function res: {this.props.myFunc(10, 18)}
      </div>
    );
  }
}
```
Since i'm using jsx i'll be importing react:
`import React from "react";`

and will retrieve the Component from React like this: `React.Component`.

will export the file so the component will be callable from outside of the file.

So the file `Body.js` would look like this:

```javascript
import React from "react";

class Body extends React.Component {
  render() {
    return (
      <div>
        Hello there {this.props.name} your age is: {this.props.age}, pineapple
        cost: {this.props.fruits.Pineapple} of {this.props.myArray[1]} Dollars,
        example for invoking a function res: {this.props.myFunc(10, 18)}
      </div>
    );
  }
}

export default Body;
```

Last step is importing the file `Body.js` in the original file `App.js`:

`import GilBody from "./components/Body";`

With export default you can only export one thing.

### export by name
For exporting multiple components from a single file
[Link](https://youtu.be/jSpihGu69v0?list=PLN3n1USn4xlntqksY83W3997mmQPrUmqM&t=265)

**Notice:**

On the import your need to use the curly braces and tell it the exactly name, i.e:

```javascript
import {Body} from "./components/Body";
```


## React fragment

For avoiding wraping return objects with <div> use frgments:

[Link](https://reactjs.org/docs/fragments.html)
```javascript
class Counter extends Component {
  render() {
    return (
      <React.Fragment>
        <h1>Hello World</h1>
        <button>Increment</button>
      </React.Fragment>
      );
  }
}
```
### shorthand for fragments:
```javascript
class Counter extends Component {
  render() {
    return (
      <>
        <h1>Hello World</h1>
        <button>Increment</button>
      </>
      );
  }
}
```


## Properties aka. Props

A useful component is a reusable one, this often means making it configurable or customizable.
Passing data in from a parent that helps customize or configure the child component.

in file `index.js`
```jsx
class App extends React.component {
	render() {
		return (
			<div>
			<Hello to="Ringo" from="Paul"/>
			<Hello
				to="Cher"
				from="Sonny"
				age={23}
				myArray={[1,48,46,26,15]}
				isFunny={true}
				bangs={3}
			/>
			<div>
		);
	}
}
```

**Note:** variables of type numbers, arrays, booleans are **passed by curly braces**.


in file `Hello.js` there is Hello component, which
the `this.props` are the properties which were passed through.

```jsx
class Hello extends React.Component{
	render() {
		//console.log(this.props)
		let bangs = "!".repeat(this.props.bangs)
		return (
			<div>
				<p>Hi {this.props.to} the message was sent from {this.props.from} </p>
				<p>He is {this.props.age} years old {bangs}</p>
			</div>
			);
	}
}
```

**Note:** Most times it's much more convenient to write with object destructuring:

```jsx
const {to, from, age, actualArray, isFunny, bangs} = this.props;
```

**Reminder**

* Properties are for configuring your component

* Properties are immutable (they don't change the properties they are read only), therefore you **can't do** this:
```js
this.props.myAge = 25
```
Directly changing the props is not done like this!!

### Default props

You should declare an object named `defaultProps`,
so in case you don't pass values the fields will get initilized to their default values. in case user passes values the default values will get overwritten.

```jsx
class App extends React.component {
	static defaultProps = {
		from: "Joel",
		to: "Anonymouse",
		age: 13,
		bangs: 1
	};


	render() {
		return (
			<div>
				<p>{this.props.from} has sent a letter to {this.props.to}</p>
			<div>
		);
	}
}
```




## React snippets

[Link](https://marketplace.visualstudio.com/items?itemName=xabikos.ReactSnippets)



## Conventions - Rule of thumbs

 Rule number | Rules
 ------------|-----
1 | functions' name must be in PascalCase
2 | Each component in a seperate file
