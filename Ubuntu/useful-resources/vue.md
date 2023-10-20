# Vuejs- [Vuejs](#vuejs)
- [Vuejs- Vuejs](#vuejs--vuejs)
  - [Course 1 - Intro to Vue 3](#course-1---intro-to-vue-3)
    - [Creating Vue app](#creating-vue-app)
- [V-directives](#v-directives)
  - [Attribute binding](#attribute-binding)
    - [v-bind: shorthand](#v-bind-shorthand)
  - [Conditional rendering](#conditional-rendering)
    - [Example 1 (v-if, v-else)](#example-1-v-if-v-else)
    - [Example 2 (v-show)](#example-2-v-show)
    - [Example 3](#example-3)
  - [List rendering](#list-rendering)
    - [Key Attribute: An essential for list items](#key-attribute-an-essential-for-list-items)
  - [Event Handling](#event-handling)
  - [Creating project from start](#creating-project-from-start)


## Course 1 - Intro to Vue 3

https://www.vuemastery.com/courses/intro-to-vue-3/intro-to-vue3

Github repo taken from here:
https://github.com/Code-Pop/Intro-to-Vue-3


### Creating Vue app

```js
const app = Vue.createApp({
    data(){
        return {
            product:'Socks',
        }
    }
})
```

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Vue Mastery</title>
    <!-- Import Styles -->
    <link rel="stylesheet" href="./assets/styles.css" />
    <!-- Import Vue.js -->
    <script src="https://unpkg.com/vue@3/dist/vue.global.js"></script>
  </head>
  <body>

    <!--I'm accesing the fields after I have mounted the Vue app-->
    <div id="app">
      <h1>{{ product }}  </h1>
    </div>
    
    <!-- Import app -->

    <script src="./main.js"></script>
    
    <!-- Mounting the app (Here is the secret souce)-->
    <script>
      const mountedApp = app.mount('#app')
    </script>

  </body>
</html>
```

# V-directives

## Attribute binding

```js
const app = Vue.createApp({
    data(){
        return {
            product:'Socks',
            image: './assets/images/socks_green.jpg'
        }
    }
})
```

Using **v-bind** it will dynamically bind an attribute to an expression

```html
<img v-bind:src="image">
```
The attribute is the `src` and the value of the expression is `image`.


```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Vue Mastery</title>
    <!-- Import Styles -->
    <link rel="stylesheet" href="./assets/styles.css" />
    <!-- Import Vue.js -->
    <script src="https://unpkg.com/vue@3.0.11/dist/vue.global.js"></script>
  </head>
  <body>
    <div id="app">
      <div class="nav-bar"></div>
      
      <div class="product-display">
        <div class="product-container">
          <div class="product-image">
            <!-- Here is the actual binding -->        
            <img v-bind:src="image">
          </div>
          <div class="product-info">
            <h1>{{ product }}</h1>
          </div>
        </div>
      </div>
    </div>

    <!-- Import App -->
    <script src="./main.js"></script>

    <!-- Mount App -->
    <script>
      const mountedApp = app.mount('#app')
    </script>
  </body>
</html>
```


### v-bind: shorthand

```
<img :src="image">
<img :alt="description">
<a :href="url">
<div :class="isActive">
<span :style="isActive">
<span :disabled="isDisabled">
```


## Conditional rendering

### Example 1 (v-if, v-else)

```
<p v-if="inStock">In Stock</p>
<p v-else>Out of Stock</p>
```
### Example 2 (v-show)


The **v-show** directive is used for toggling an element’s visibility instead of adding and removing the element from the DOM entirely, like v-if does.

```
<p v-show="inStock">In Stock</p>
```
We can verify this by setting inStock to false and viewing the element in the browser’s Developer Tools.
When v-show is used, we can see that the element is still present in the DOM, but **it’s now hidden** with an inline style of display: none; added to it.

### Example 3

```js
const app = Vue.createApp({
    data(){
        return {
            product:'Socks',
            image: './assets/images/socks_green.jpg',
            inventory: 10
        }
    }
})
```


```html
<p v-if="inventory > 10">In Stock</p>
<p v-else-if="inventory <= 10 && inventory > 0">Almost sold out!</p>
<p v-else>Out of Stock</p>
``` 

## List rendering

A simple for loop

```js
const app = Vue.createApp({
    data(){
        return {
            product:'Socks',
            image: './assets/images/socks_green.jpg',
            details: ['50% cotton', '30% wool', '20% polyester']
        }
    }
})
```

```html
<ul>
    <li v-for="detail in details">{{ detail }}</li>
</ul>
```


### Key Attribute: An essential for list items

By saying :key="variant.id", we’re using the shorthand for v-bind to bind the variant’s id to the key attribute. This gives each DOM element a unique key so that Vue can grasp onto the element and not lose track of it as things update within the app.

```js
const app = Vue.createApp({
    data(){
        return {
            product:'Socks',
            image: './assets/images/socks_green.jpg',
            details: ['50% cotton', '30% wool', '20% polyester']
            sizes: ['S', 'M', 'L', 'XL'],
            variants: [
                {id:2234, color:'green'},
                {id:2235, color:'blue'}
            ]
        }
    }
})
```

```html
<div v-for="variant in variants" :key="variant.id">{{ variant.color }}</div>
<ul>
    <li v-for="(size, index) in sizes" :key="index">{{ size }}</li>
</ul>
```


## Event Handling

```js

```

## Creating project from start

```
npm create vue@latest
cd <your-project-name>
npm install
npm run dev     
```