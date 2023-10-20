# Vuejs- [Vuejs](#vuejs)
- [Vuejs- Vuejs](#vuejs--vuejs)
  - [Course 1 - Intro to Vue 3](#course-1---intro-to-vue-3)
    - [Creating Vue app](#creating-vue-app)
    - [Attribute binding](#attribute-binding)
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

```html
<img v-bind:src="image">
```
The attribute is the `src` and the expression is `image`


## Creating project from start

```
npm create vue@latest
cd <your-project-name>
npm install
npm run dev     
```