<!--ts-->
<!--te-->

# States in React


[Nicely written documentation](https://reactjs.org/docs/state-and-lifecycle.html)

## First example: counter component

class components have states, but function components doesn't have state (stateless).

```javascript
export default class Counter extends React.Component{

    constructor(props){
        super(props);

        this.state= {
            count: props.initialCount
        };
    }

    //  Binding it with lambda function
    increment= ()=> {
        console.log(this.state);

        this.setState({
            count: this.state.count+1
        });
    }

    //  Binding it with lambda function
    decrement= ()=> {
        console.log(this.state);

        this.setState({
            count: this.state.count-1
        });
    }

    render(){
        console.log("Render function")
        return(
            <div>
                <div>count: {this.state.count}</div>
                <button onClick={this.increment}>increment</button>
                <button onClick={this.decrement}>decrement</button>
            </div>
        );
    }
}
```

## Second example: Image slider

```javascript
export default class ImageSlider extends React.Component{
    state={
        images: [
            "https://www.cancercouncil.com.au/wp-content/uploads/2014/09/Heart-1.jpg",
            "https://cdn3.volusion.com/kceqm.mleru/v/vspfiles/photos/4-1.jpg?1521734349",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQzFXx7aEgFMyk19k66YPViF8Zrmz1QFyCAhso7SRydYJoJ1uOd",
            "http://www.provisionskart.com/image/cache/data/vegetables-200x200.jpg"
        ],
        idx: 0
    }


    handleNext=()=>{
        this.setState({
            idx:this.state.idx+1 // Shallow merge
        })
    }

    //Attention: setState is Async function
    handlePrev=()=>{
        this.setState({
            idx:this.state.idx-1 // Shallow merge
        },()=>{
            console.log(this.state)
        })
    }

    render(){
        return (
            <div>
                <img
                style={{
                    width:100,
                    height: 100
                }}
                 src={this.state.images[this.state.idx]}
                 alt="description"
                 />
                 <button onClick={this.handleNext}>next</button>
                 <button onClick={this.thandlePrev}>prev</button>
            </div>
            );
    }
}
```
Few points to notice:

* setState is Async function so if you print the value before and after it won't reflect necessarily. therefore you can add a second arguemnt a function call which be called when the setState will be completed.

[Youtube: video1](https://youtu.be/34fE23aib1o?list=PLN3n1USn4xlntqksY83W3997mmQPrUmqM)


[Youtube: video2](https://youtu.be/3wvdq_j5S1c?list=PLN3n1USn4xlntqksY83W3997mmQPrUmqM)
