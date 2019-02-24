<!--ts-->
   * [CSS](#css)
      * [CSS Variables](#css-variables)
      * [Colors](#colors)
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
         * [Floats &amp; Clears](#floats--clears)
         * [Dynamically for window's size](#dynamically-for-windows-size)
      * [2D Transforms](#2d-transforms)
      * [List style](#list-style)
      * [Useful shape tool](#useful-shape-tool)
   * [SCSS (Sassy CSS)](#scss-sassy-css)
      * [SASS Variables](#sass-variables)
      * [SASS Map](#sass-map)
      * [Function in SASS](#function-in-sass)
   * [HTML](#html)
      * [HTML tags](#html-tags)
      * [HTML lists](#html-lists)
         * [Order list](#order-list)
         * [Unorder list](#unorder-list)
      * [Font awesome](#font-awesome)

<!-- Added by: gil_diy, at: 2019-02-24T15:02+02:00 -->

<!--te-->

# CSS
Great resource, the book: **"CSS Visual Dictionary"**

## CSS Variables


Put the variables in the root (root element),since the properties cascade down.
This way they would be global.

```css

:root {
   --my-primary-color: green;
}


body {
   color: var(--my-primary-color);
}
```

Title1 | Title2
------------|-----
 element | element-description


## Colors
Description | Example
------------|-----
Specify color with hex value | `background: #FF0000;`
Specify color with RGB | `background: RGB(250,247,20)`
Specify color with RGB with Transparency, Alpha channel (0 to 1 scale) | `background: RGB(250,247,20, 0.5);`



[Table of color names](https://www.w3schools.com/colors/colors_names.asp)
You can also use: **colorpicker**

## Gradient
Description | Example
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
Add flex (mandatory before applying the other properties of flex) | `display: flex `
Setting flex direction ( **by default it's row**)| `flex-direction: row | row-reverse | column | column-reverse;`
Setting alignment to the center (**Horizontal axis**) | `justify-content: center`
Set alignment to the right (**Horizontal axis**) | `justify-content: flex-end`
Set alignment to the left  (**Horizontal axis**) | `justify-content: flex-start`
Set space around each element (**Horizontal axis**) | `justify-content: space-around`
Set space between every pair of elements (**Horizontal axis**) | `justify-content: space-between`
Set alignment to the top  (**Vertical axis**) | `align-items: flex-start`
Set alignment to the buttom  (**Vertical axis**) | `align-items: flex-end`
Streching elements ( **Vertical axis**
Set how items will be wrapped ([Link](https://youtu.be/hwbqquXww-U?list=PL4-IK0AVhVjMSb9c06AjRlTpvxL3otpUd&t=269)) | `flex-wrap: nowrap | wrap | wrap-reverse;`


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

[Well explained video](https://www.youtube.com/watch?v=Oh0TplG4nYw&index=16&list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-)

Description | Example
------------|-----
Select all paragraphs and all h1's and color text in green | `p, h1 { color: green; }`
Select specific class-name | `.my_class { color: green; }`
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
Set margin (**All sides**): | `margin: 100px;`
Set margin top: | `margin-top: 70px;`
Set margin right: | `margin-right: 90px;`
Set margin buttom: | `margin-buttom: 30px;`
Set margin left: | `margin-left: 50px;`
Set margin written in concise : | `margin: 70px 90px 30px 50px;`
Keep the div/container in the middle of the page | `margin: 0 auto;`
- | it means zero top and buttom and automatically calaculate the margins in left and right

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


### Floats & Clears

The float CSS property places an element on the left or right side of its container, allowing text and inline elements to wrap around it.

Description | Example
------------|-----
Set float to the right | `float: right;`
Set float to the left | `float: left;`



### Dynamically for window's size

Description | Example
------------|-----
Specify the percentage taken from total screen | `width: 70%`
Limit the width of the element | `max-width: 1000px`


## 2D Transforms
 Description | Example
------------|-----
Move the element on it's X and Y axis | `transform: translate(30px,10px);`
Rotating an element around its center | `transform: rotate(45deg);`
Setting the rotation origin in top left corner | `transform-origin: 0 0;`
Setting the rotation origin in top right corner | `transform-origin: 100% 0;`



## List style

Description | example
------------|-----
Style **order** list | `list-style-type: lower-roman | lower-alpha | upper-alpha;`
Style **unorder** list | `list-style-type: circle | square | disc;`
Style list with image bullets| `list-style-image: url(../img/icon.png);`


## Useful shape tool

[Link](https://bennettfeely.com/clippy/)

# SCSS (Sassy CSS)

Compiling from SCSS to css can be done here: [Link](https://www.sassmeister.com/)

Or you install two valuaeable extensions in vscode:

* `Live Sass Compiler` very useful and easy.

* `Live server`


## SASS Variables

```css
$my-color: green;

body {
    color: $my-color;
}
```

## SASS Map

```css
$my-color: green;

$colors: (
    primary: #005DFF,
    accent: #FFF6BB
)


body {
    background-color: map-get($colors,primary);
    color: $my-color;
}
```


## Function in SASS


```css
$colors: (
    primary: #005DFF,
    accent: #FFF6BB
);

@function color($color-name){
    @return map-get($colors,$color-name);
}

body {
    background-color: color(primary);
}
```






# HTML

## HTML tags

[List of html tags](https://www.w3schools.com/tags/ref_byfunc.asp)

## HTML lists

### Order list
```html
<ol>
	<li>iterm number 1</li>
	<li>iterm number 2</li>
	<li>iterm number 3</li>
	<li>iterm number 4</li>
</ol>
```

### Unorder list
```html
<ul>
	<li>iterm number 1</li>
	<li>iterm number 2</li>
	<li>iterm number 3</li>
	<li>iterm number 4</li>
</ul>
```
## Font awesome
[Link](https://origin.fontawesome.com/icons/youtube?style=brands)

