<!--ts-->
   * [CSS](#css)
      * [Gradient](#gradient)
      * [Flex <a href="https://css-tricks.com/snippets/css/a-guide-to-flexbox/" rel="nofollow">(Reference)</a>](#flex-reference)
      * [Text](#text)
      * [Playing with boxes](#playing-with-boxes)
      * [2D Transforms](#2d-transforms)
   * [SCSS (Sassy CSS)](#scss-sassy-css)

<!-- Added by: gil_diy, at: 2019-02-23T11:56+02:00 -->

<!--te-->

# CSS
Great resource, the book: **"CSS Visual Dictionary"**


## Gradient
Title1 | Title2
------------|-----
Linear Gradient from left to right | `background-image: linear-gradient(to right, #a25b5b, #692e4c);`
Linear Gradient from left to right | `radial-gradient`
 | `background-image: repeating-linear-gradient(white 100px, black 200px, white 300px);`
 | `background-image: repeating-radial-gradient(white 100px, black 200px, white 300px);`
 Set image background | `background-image: url("image.jpg");`
 Disable margin | `margin: 0`


Direction|
----------|
to right|
to left|
to top|
to bottom|
to bottom right|
to bottom left|
to top right|
to top left|



## Flex [(Reference)](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)

* Flex is a set of rules for automatically streching multiple columns and rows of content across parent container.

* Elements placed inside this container are called items.

Description | Example
------------|-----
Add flex | `display: flex `
Setting flex direction ( **by default it's row**)| `flex-direction: row | row-reverse | column | column-reverse;`
Setting alignment to the center (**Horizontal axis**) | `justify-content: center`
Set alignment to the right (**Horizontal axis**) | `justify-content: flex-end`
Set alignment to the left  (**Horizontal axis**) | `justify-content: flex-start`
Set space around each element (**Horizontal axis**) | `justify-content: space-around`
Set space between every pair of elements (**Horizontal axis**) | `justify-content: space-between`
Set alignment to the top  (**Vertical axis**) | `align-items: flex-start`
Set alignment to the buttom  (**Vertical axis**) | `align-items: flex-end`
Streching elements ( **Vertical axis** ) | `align-items: stretch`

Set how items will be wrapped | `flex-wrap: nowrap | wrap | wrap-reverse;`


3 different properties that contribute to the appearance of the background image of an HTML element:

Description | Example
------------|-----
 element | `background-color: #000000;`
 element | `background-image: url("image.jpg");`
 element | `background-repeat: no-repeat;`

[Link](https://medium.com/@js_tut/flexbox-the-animated-tutorial-8075cbe4c1b2)

## Text
Description | example
------------|-----
Set font type| `font-family: david;`
Set style | `font-style: italic;`
Set font size | `font-size: 12px;`
Set text-shadow: `text-shadow: 2px 2px 4px #FFF`


## Playing with boxes

Description | example
------------|-----
Set rounded corners (Controls ths radius of the corner's curve on bioth X and Y axis) | `border-radius: 20px;`
Add shadow around a wide element | `box-shadow: 5px 5px 10px #000`
Add glowing effect | `box-shadow: 0 0 10px #FFF`


## 2D Transforms
Description | example
------------|-----
Move the element on it's X and Y axis | `transform: translate(30px,10px);`
Rotating an element around its center | `transform: rotate(45deg);`
Setting the rotation origin in top left corner | `transform-origin: 0 0;`
Setting the rotation origin in top right corner | `transform-origin: 100% 0;`


# SCSS (Sassy CSS)

compiling from SCSS to css can be done here: [Link](https://www.sassmeister.com/)
