<!--ts-->
<!--te-->

# Component lifecycle

## lifecycle methods (hooks)

If you want to use lifecycle hooks you should use only a class component.
There are 3 phases which every component spends:

### phase 1: MOUNT phase
"Mounting" Whenever a component is rendered to the DOM for the first time.

The `componentDidMount` function is called when the component first rendered in the DOM:
```javascript
componentDidMount(){

}

```



* Constructor
* render
* componentDidMount

### phase 2: UPDATE phase
* render
* componentDidUpdate


### phase 3: UNMOUNT phase
* commponentWillUnmount

"Unmounting" when we want to clear that component whenever the DOM produced by the component is removed.

The `componentWillUnmount` function is called when the component is removed:

```javascript
componentWillUnmount(){

}
```
