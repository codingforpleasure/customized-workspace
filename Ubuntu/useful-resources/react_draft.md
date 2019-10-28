
## Example of creating two components:

The class component `app`, which is the parent component creats the Pet component (child-component) 3 times.
The parent component passes the props component on each invocation.


```js

class App extends React.Component{
	handleTitleClick(){
		alert("You clicked the title");
	}
	render(){
		return React.createElement("div",{},[
		    React.createElement("h1", { onClick: this.handleTitleClick }, "Adopt Me!"),
			    React.createElement(Pet, {
			    	name: "Luna",
			    	animal: "dog",
			    	breed: "Havanese"
			    }),
			    React.createElement(Pet, {
			    	name: "Pepper",
			    	animal: "bird",
			    	breed: "Cockatiel"
			    }),
			    React.createElement(Pet, {
			    	name: "Doink",
			    	animal: "cat",
			    	breed: "Mixed"
			   	})
			])
	}
}

const Pet = (props) => {
  return React.createElement("div",{},[
  React.createElement("h1", {}, props.name),
  React.createElement("h2", {}, props.animal),
  React.createElement("h2", {}, props.breed)
  ]);
}


ReactDom.render(React.createElement(App), document.getElementById('root'))
```
