# Animations on the web

<!--ts-->
   * [Animations on the web](#animations-on-the-web)
      * [CSS Transitions](#css-transitions)
      * [CSS Animations](#css-animations)
      * [When do we need javascript?](#when-do-we-need-javascript)
         * [Coordination between different components or data sources using State management](#coordination-between-different-components-or-data-sources-using-state-management)
         * [Interaction with user behavior](#interaction-with-user-behavior)
      * [JS Frameworks](#js-frameworks)
         * [Pros](#pros)
         * [Cons](#cons)
      * [Should check:](#should-check)

<!-- Added by: gil_diy, at: 2019-02-19T13:21+02:00 -->

<!--te-->



## CSS Transitions

1. Declarative API
2. Transition states using pseudo selectors
3. Capabilities: Timing, easing, and duration
4. Browser performance & compatibility
5. Access to other css features like media queries

[Link](https://www.youtube.com/watch?v=Nloq6uzF8RQ)


## CSS Animations

1. Everything from CSS Transition.
2. Key frame Api.
3. Infinite Loops (ex. Loading states)


## When do we need javascript?

Complex interactions across user behavior,
multiple components and data sources.

The benefit of JS is it gives us a hook into the rendering process (**AKA Request Animation Frame (RAF)!**)

Examples tasks for the need of js:


### Coordination between different components or data sources using State management
Task number | Description
------------|----
1 | Notification bar that toggles between success and fail states based on form submission.
2 | Tooltip thta appears on button hover
3 | Data visualizations that animate differently based on data

### Interaction with user behavior

Task number | Description | Solution
------------|-----|---
1 | Parallox effect on scroll event
2 | Page turning, snap to grid, drag and drop (touchstart/tauchend)
3 | Story telling, games development


## JS Frameworks

GSAP
Anime.js
Popmotion
Three.js
Lottie
react-motion (spring)

### Pros
1. Performant
2. Browser Compatible
3. Community tested

### Cons
1. Requires DOM Access
2. No Access to React lifecycle


## Should check:
Animating with Styled Components + React Pose

```javascript
import styled from 'styled-components';
import posed from 'styled-pose';
```
