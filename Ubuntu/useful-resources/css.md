<!--ts-->
   * [CSS](#css)
      * [Gradient](#gradient)
      * [Image](#image)
      * [Flex <a href="https://css-tricks.com/snippets/css/a-guide-to-flexbox/" rel="nofollow">(Reference)</a>](#flex-reference)
      * [Styling Text](#styling-text)
      * [Styling Links](#styling-links)
      * [Selectors](#selectors)
      * [Playing with boxes](#playing-with-boxes)
         * [Margins (<a href="https://youtu.be/M6coJNLFBWI?list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-&amp;t=246" rel="nofollow">Link</a>)](#margins-link)
         * [Padding](#padding)
         * [Border](#border)
      * [2D Transforms](#2d-transforms)
   * [SCSS (Sassy CSS)](#scss-sassy-css)

<!-- Added by: gil_diy, at: 2019-02-23T16:07+02:00 -->

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


## Image

Description | Example
------------|-----
Set image background | `background-image: url("../img/hamster.jpg");`
Set no repetition of the image | `background-repeat: no-repeat;`
Set repeat on the X-axis | `background-repeat: repeat-x;`
Set repeat on the Y-axis | `background-repeat: repeat-y;`
Resize an image proportionally according to the box size | `background-size: cover;`
Positioning an image | `background-position: center`


[Nice background patterns](https://www.toptal.com/designers/subtlepatterns/)

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
 Set background image | `background-image: url("img/haster.jpg");`
 element | `background-repeat: no-repeat;`

[Link](https://medium.com/@js_tut/flexbox-the-animated-tutorial-8075cbe4c1b2)


## Styling Text

Description | Example
------------|-----
Choose font with fall-backs alternatives (font stacks)  | `font-family: Calibri, Candara, Segoe;`
Set style | `font-style: italic | oblique;`
Set font weight| `font-weight: normal | bold | light | lighter;`
Set font size | `font-size: 12px;`
Set text-shadow: `text-shadow: 2px 2px 4px #FFF;`
Set the space between lines (5px up, 5px down) | `line-height: 10px;`
Set text alignment | `text-align: right | center | left;`
Add text lines | `text-decorations: underline | overline | line-through;`
Set letters' case | `text-transform: capitalize | uppercase | lowercase;`


[Great collection of web safe CSS font stacks](https://www.cssfontstack.com/)

## Styling Links

Description | Example
------------|-----
Set link colors | `a { color: green; }`
Change link color on hover (on hover state) | `a:hover { color: light-blue; }`
Change link color in case you visited the link | `a:visited { color: purple; }`


* comment: The order is important:

```css
a: link {
	color: light-blue;
}

a: visited {
	color: green;
}

a: hover {
	color: red;
}

```


[Nice short lecture](https://www.youtube.com/watch?v=t3wsQnjM4F4&list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-&index=15)

## Selectors

Description | Example
------------|-----
Select all paragraphs and all h1's and color text in green | `p, h1 { color: green; }`
Select specific classname | `.my_class { color: green; }`
Select the paragraphs that are **inside** `my_class` | `.my_class p { color: green; }`

Select the paragraphs that are inside body-text | `.body-tex`


## Playing with boxes

Padding+Margin+border adds to the width of the actual object.


<p align="center">
  <img src="images/css/padding_margin.png" width="320" title="Padding, Margin, Border">
</p>

### Margins ([Link](https://youtu.be/M6coJNLFBWI?list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-&t=246))
Description | example
------------|-----
Set margin (**All sides**): | margin: 100px;
Set margin top: | margin-top: 70px;
Set margin right: | margin-right: 90px;
Set margin buttom: | margin-buttom: 30px;
Set margin left: | margin-left: 50px;
Set margin written in concise : | margin: 70px 90px 30px 50px;

* creates an empty space outside of the actual object.
* The short `margin: <top> <right> <bottom> <left>`

### Padding

creates an empty space with my object's background color (into the object's space)
[explain Padding vs Margins](https://youtu.be/M6coJNLFBWI?list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-&t=620)


Description | example
------------|-----
Padding each side differently | `padding: 100px 80px 30px 40px`

### Border

Description | example
------------|-----
Add border | `border: 10px solid red`
Set border width (**All sides**)  | `border-width: 5px;`
Set border color (**All sides**)  | `border-color: red;`
Set border style (**All sides**)  | `border-style: solid;`
Set border style to a **Specific side** | `border-left/right/top/bottom-style: solid;`


Style type|
----------|
double|
dashed|
solid|
dotted|
inset|
groove|
inherit|
ridge|
to bottom right|
to bottom left|
to top right|
to top left|

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
