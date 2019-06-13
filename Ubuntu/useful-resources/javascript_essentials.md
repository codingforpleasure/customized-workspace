<!--ts-->
   * [Javascript in a nutshell](#javascript-in-a-nutshell)
      * [Var vs Let vs Const](#var-vs-let-vs-const)
         * [var](#var)
         * [let](#let)
         * [const](#const)
      * [Objects](#objects)
      * [this](#this)
      * [Arrow Funcs](#arrow-funcs)
      * [template literals](#template-literals)
      * [template strings](#template-strings)
      * [Destructuring](#destructuring)
      * [Spread](#spread)
      * [Classes](#classes)
         * [basic class](#basic-class)
         * [basic inheritance](#basic-inheritance)
      * [Modules](#modules)
      * [Useful functions in javascript](#useful-functions-in-javascript)
         * [reduce](#reduce)
         * [slice](#slice)
         * [splice](#splice)
         * [map](#map)
         * [forEach](#foreach)
         * [every](#every)

<!-- Added by: gil_diy, at: 2019-06-13T08:58+03:00 -->

<!--te-->

# Javascript in a nutshell

## Var vs Let vs Const

### var
```javascript
function shayHello(){
	for (var i = 0; i< 5;i++){
		console.log(i)
	}

	console.log('i is accessable from here too: ',i)
}
```
With **var** the variable **is accesiable in the function which it is defined**.

### let
With **let** that variable is **only accessable in that block** which it is defined.

### const
```javascript
const x = 1;
x = 2; /* ERROR! */
```
With **const** the variable **cannot be reassigned** and is **only accessiable in that block** which it is defined.


## Objects
set of key value pairs:

An example of object with one member and two methods
```javascript
const person = {
	name: 'Mosh',
	walk: function() {},
	talk() {} /*From */
}

/* invoking functions: */
person.walk()
person.talk()

```

## this
```javascript

```
## Arrow Funcs
```javascript
const square = function(number){
	return number * number;
}
```

starting from ECMA 6:
```javascript
const square = number => number * number;
```

if the function receives zero arguemnts, you can write:
```javascript
const square = () => console.log("No input so no area");
```
Another example of arrow function:

```javascript
const jobs = [
	{id: 1, isActive: true},
	{id: 2, isActive: true},
	{id: 3, isActive: false},
];

const activeJobs = jobs.filter(function(job) { return job.isActive; });

// With Arrow function it would look like this:
const activeJobs = jobs.filter(job => job.isActive);
```

```javascript
const colors=['red','green','blue'];

const items = colors.map(function(color){
	return '<li>' + color + '</li>';
});

// With Arrow function it would look like this:

const items = colors.map(color =>'<li>' + color + '</li>'});
```

## template literals
```javascript
const items = colors.map(color => `<li>${color}</li>`)
```

[Link more about template literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals)

## template strings



## Destructuring
```javascript

const address = {
	street: '',
	city: '',
	country: ''
};

/* The problem with chunk of code is it is repetitive */
const street = address.street;
const city = address.city;
const country = address.country;

/* Here is the following destructuring syntax, this way we avoid the repetitive code as we written above */
const {street, city, country } = address;

/* In case we would like to call it with a different name we can use alias: */
const { street: st } = address;

```
## Spread

The `spread` operator is presented with 3 dots **used for combining and cloning objects/arrays**.

```javascript
const first = [1,2,3]
const second = [4,5,6]

/* Combining two arrays */
const combined = first.concat(second); /* [1,2,3,4,5,6]*/

const combined = [...first, ...second];


/* Cloning an array */
const clone = [...first]
console.log(clone)
console.log(first)


/* Combining two objects */
const firstObject = { name: "Gil"}
const secondObject = { job: "CTO"}

cons combined = { ...firstObject, ...secondObject, location: "Israel"}

console.log(combined)

/* Cloning an object */
const clone = [...firstObject]
console.log(clone)


```


## Classes

Attention: class name is `Pascal case notation`

### basic class
```javascript
class Person {
	constructor(name) {
		this.name = name;
	}

	walk() {
		console.log("walk");
	}
}


const person = new Person('Gil');
person.

```
### basic inheritance
```javascript
class Person {
	constructor(name) {
		this.name = name;
	}

	walk() {
		console.log("walk");
	}
}

class Teacher extends Person {
	constructor(name, degree) {
		super(name); /* Calling the parent's constructor */
		this.degree = degree;
	}

	teach() {
		console.log("teach");
	}
}

const teacher = new Teacher('Gil','Bsc');
```

## Modules

The object we define in a module are private by default so they are not accessiable from outside.

* Step 1: Put every class in a seperate js file.
* Step 2:  For making the class to be visiable outside we should export the class.

* Step 3: Import the class

## Useful functions in javascript

[Reference]http://www.lukaszewczak.com/2015/02/js-array-method-quick-reference.html)

### reduce
The reduce method is used to calculate a single value from an array.
Syntax: array.reduce(callback, initialValue)

reduce executes callback function once for each element in the array, which receives four arguments:


```javascript
var numbers = [12,34,23,56,78,34];
function max(array){
   function mathMax(a, b) {return Math.max(a, b);}
   return array.reduce(mathMax);
}
```

### slice
Slice method create new array which containes shallow copy of elements from original array.**This method does not change original array**.


`Syntax: array.slice(begin, end)`


var array = 'Successful Project'.split('');
console.log(array.slice(0,2))
// ["S", "u"]
console.log(array.slice(0,-3))
// ["S","u","c","c","e","s","s","f","u","l"," ","P","r","o","j"]
console.log(array.slice(-8))
//["S","u","c","c","e","s","s","f","u","l"]


## splice

Splice change the original array by **removing** or **adding** new elements

`Syntax: array.splice(start, deleteCount, item1, item2, ...)`

```javascript
var array = [1, 2, 3, 9, 10];

// Adding items 4,5,6,7,8 from index 3.
var removed = array.splice(3, 0, 4, 5, 6, 7, 8);

// It modified the array
console.log(array)
// [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

console.log(removed)
// []


// Removing 5 items from index 3.
removed = array.splice(3,5);
console.log(array)
// [1, 2, 3, 9, 10]

console.log(removed)
// [4, 5, 6, 7, 8]
```

### map

The map method transforms the array by applying a function to all of its elements and building a new array from the returned values. The new array will have the same length as the input array.

array.map(callback)

```javascript
var array = [1, 2, 3, 4];
var plusOne = array.map(function(el, index, orgArr) {
            return el + 1;
        });

console.log(plusOne);
//[2, 3, 4, 5]
```
### forEach

Callback function takes three arguments:

* currentValue – current element being processed
* index – index of the current element array

```javascript
[10,20,30,40,50,60].forEach(function (element, index) {
    console.log('Element: {', element, '}, index {', index,'}');
});
// Element: { 10 }, index { 0 }
// Element: { 20 }, index { 1 }
// Element: { 30 }, index { 2 }
// Element: { 40 }, index { 3 }
// Element: { 50 }, index { 4 }
// Element: { 60 }, index { 5 }
```
### every

If You want to check if all elements in array meet yours specific criteria you can use method every which will return false as soon as it find element which does not meet your criteria.

`Syntax: array.every(callback);`

```javascript
[10,20,30,40,50,60].every(Number.isInteger);
//true
[10,20,30,40,'test',60].every(Number.isInteger);
//false
```
### some
If You want to check wheater at least one element in array meets your specific criteria you can use method some which will return true as soon as it find element meeting this specific criteria.

`Syntax: array.some(callback)`

```javascript
function ifElementBiggerThen30(element){ return element > 30;}
[10,20,30,40,50,60].some(ifElementBiggerThen30);
//true
```
