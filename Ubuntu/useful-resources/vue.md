# Vuejs- [Vuejs](#vuejs)
- [Vuejs- Vuejs](#vuejs--vuejs)
  - [Course 1 - Intro to Vue 3](#course-1---intro-to-vue-3)
    - [Creating Vue app](#creating-vue-app)
    - [Attribute binding](#attribute-binding)
    - [v-bind: shorthand](#v-bind-shorthand)
  - [Conditional rendering](#conditional-rendering)
    - [Example 1](#example-1)
    - [Example 2](#example-2)
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

### Attribute binding

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

### Example 1

```
<p v-if="inStock">In Stock</p>
<p v-else>Out of Stock</p>
```

### Example 2

<p v-if="inventory > 10">In Stock</p>
<p v-else-if="inventory <= 10 && inventory > 0">Almost sold out!</p>
<p v-else>Out of Stock</p>


## Creating project from start

```
npm create vue@latest
cd <your-project-name>
npm install
npm run dev     
```