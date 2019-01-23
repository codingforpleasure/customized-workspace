<!--ts-->
   * [React](#react)
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
      * [Conventions - Rule of thumbs](#conventions---rule-of-thumbs)

<!-- Added by: gil_diy, at: 2019-01-23T09:22+02:00 -->

<!--te-->


# React

## basic requirements:
`node -v` (i'm using version 10.13.0)

`npm -v` (i'm using version 6.4.1)

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
## What is the difference building components as functions vs components as functions?

In functional component I can't refer to **this.props**, instead your props is passed as **your first argument to the function** :

```javascript
const Body = (props) => <p className="App-intro">{props.text}</p>
```
see function: `MyBody4`

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

## States in React

class components have states, but function components doesn't have state.


## Conventions - Rule of thumbs

 Rule number | Rules
 ------------|-----
1 | functions' name must be in PascalCase
2 | Each component in a seperate file
