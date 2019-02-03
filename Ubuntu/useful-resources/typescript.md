<!--ts-->
   * [Typescript](#typescript)
      * [Typescript intro](#typescript-intro)
         * [Compiling easliy from .ts to <code>.js</code> is done with:](#compiling-easliy-from-ts-to-js-is-done-with)
         * [The types in typescript](#the-types-in-typescript)
         * [Functions](#functions)
         * [Unions](#unions)
         * [interfaces in type script (Like structure in c)](#interfaces-in-type-script-like-structure-in-c)
         * [Casting](#casting)
         * [Any](#any)
      * [Typescript with React](#typescript-with-react)

<!-- Added by: gil_diy, at: 2019-02-03T18:30+02:00 -->

<!--te-->

# Typescript

## Typescript intro

[Youtube reference](http://www.my-website.com)

### Compiling easliy from `.ts` to `.js` is done with:

```javascript
tsc myExample.ts
```
### The types in typescript

Type | Description
------------|-----
 number | **Any numeric values** including decimals.
 string | element-description
 boolean | element-description
 enum | element-description
 array | element-description
 tuple | element-description
 void | element-description
 null | element-description

[basic-data-types-in-typescript](https://dzone.com/articles/what-are-the-basic-data-types-in-typescript)


### Functions

**With javacript:**
```javascript
const add = (x,y) => x+y
```

**With typescript:**
```javascript
const add = (x: number,y: number) => x + y
```
You can write this way too:
```javascript
const add: AddFunc = (x: number, y: number) => x + y
const add2 = (nums: {a: number; b: number}) => x + y
```

### Unions

```javascript
// Either a number or a string:
let maybeNum: number | string = 5;
maybeNum = "Hello";
```


### interfaces in type script (Like structure in c)

```javascript
interface MyObj {
	x: number;
	y: number;
	z?: number; //The question mark means it's optional property.
}

const obj1: MyObj {
	x: 5.32,
	y: 7
}

const obj2: MyObj {
	x: 123,
	y: 213
}

obj1.z = 568;

```

moreover you can merge two objects/interfaces:

```javascript
interface Dog {
	bark: string;
}

interface Cat {
	purr: string;
}

type DogCat = Dog & Cat | ; //Merging the two either a number

const dogCat: DogCat = {
	bark: "bark!",
	purr: "purr!",
}
```

### Casting

**Example of cast:**
```javascript
add(digCat as number, dogCat as any)
```


### Any

const doesAnything = (a: any) => {
	console.log(x);
}


## Typescript with React

```bash
npx create-react-app [project-name] --typescript
```

[Using Typescript in React](https://www.youtube.com/watch?v=OkIDr8QSrLg)


