<!--ts-->
   * [React](#react)
      * [basic requirements:](#basic-requirements)
      * [How to start my app super fast?](#how-to-start-my-app-super-fast)
         * [create react app](#create-react-app)
      * [Run the server:](#run-the-server)
      * [Props and render](#props-and-render)
      * [What is the difference building components as functions vs components as functions?](#what-is-the-difference-building-components-as-functions-vs-components-as-functions)
      * [Orginizing the project:](#orginizing-the-project)
      * [Conventions - Rule of thumbs](#conventions---rule-of-thumbs)
   * [| Rules](#-rules)

<!-- Added by: gil_diy, at: 2019-01-19T17:16+02:00 -->

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


## Props and render


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
        cost: {this.props.fruits.Pineapple}
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
          fruits={{ Apple: 35, Pineapple: 70 }}
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

## What is the difference building components as functions vs components as functions?


## Orginizing the project:

```bash
mkdir ./src/components
```
Each file holds a single component resides in the components directory.




## Conventions - Rule of thumbs

 # | Rules
 ------------|-----
1 | functions' name must be in PascalCase
1 | Each component in a seperate file
