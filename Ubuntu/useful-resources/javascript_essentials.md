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
      * [Destructuring](#destructuring)
      * [Spread](#spread)
      * [Classes](#classes)
         * [basic class](#basic-class)
         * [basic inheritance](#basic-inheritance)
      * [Modules](#modules)

<!-- Added by: gil_diy, at: 2019-01-29T11:48+02:00 -->

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
With **const** the variable **cannot be reassigned** and is **only accesiable in that block** which it is defined.


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
