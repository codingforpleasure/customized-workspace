<!--ts-->
   * [CSS](#css)
      * [CSS Selectors](#css-selectors)
         * [Selector Specificity](#selector-specificity)
      * [CSS Units](#css-units)
      * [calc()](#calc)
         * [Use case #1: when we mix units](#use-case-1-when-we-mix-units)
      * [Position Property](#position-property)
      * [CSS Variables](#css-variables)
      * [Colors](#colors)
      * [Gradient](#gradient)
      * [Image](#image)
      * [Polygon](#polygon)
      * [Flex <a href="https://css-tricks.com/snippets/css/a-guide-to-flexbox/" rel="nofollow">(Reference)</a>](#flex-reference)
      * [Styling Text](#styling-text)
      * [Styling Links](#styling-links)
      * [Selectors](#selectors)
      * [Text properties](#text-properties)
      * [Playing with boxes](#playing-with-boxes)
         * [Margins (<a href="https://youtu.be/M6coJNLFBWI?list=PL4-IK0AVhVjM0xE0K2uZRvsM7LkIhsPT-&amp;t=246" rel="nofollow">Link</a>)](#margins-link)
         * [Padding](#padding)
         * [Border](#border)
         * [Floats &amp; Clears](#floats--clears)
         * [Dynamically for window's size](#dynamically-for-windows-size)
      * [2D Transforms](#2d-transforms)
      * [List style](#list-style)
      * [Useful shape tool](#useful-shape-tool)
      * [Animation](#animation)
         * [Example 1: Progress bar](#example-1-progress-bar)
         * [animation properties](#animation-properties)
         * [Example 2: Animating movement and opacity <strong>with keyframes</strong>](#example-2-animating-movement-and-opacity-with-keyframes)
         * [Example 3: Animating color transition](#example-3-animating-color-transition)

<!-- Added by: gil_diy, at: 2019-03-27T17:15+02:00 -->

<!--te-->

# CSS
Great resource, the book: **"CSS Visual Dictionary"**

## CSS Selectors

 Selctor type | Selector's description | Demo
------------|-----|---
.intro | Selects all elements with class="intro" |
\#firstname | Selects the element with id="firstname" |
\* | Selects all elements |
p | Selects all &lt;p&gt; elements |
div, p | Selects all &lt;div&gt; elements **and** all &lt;p&gt; elements |
div p | Selects all &lt;p&gt; elements **inside** &lt;div&gt; elements |
div > p | Selects all &lt;p&gt; elements where the parent is a &lt;div&gt; element |
:nth-child(n) | selector matches every element that is the nth child, regardless of type, of its parent. |  [Link](https://www.w3schools.com/csSref/tryit.asp?filename=trycss3_nth-child)

[CSS Selectors reference](https://www.w3schools.com/csSref/css_selectors.asp)


### Selector Specificity
[Easily check your selector specificity](https://specificity.keegan.st/)
The higher score the more accurate your selector is.

IDs > Classes, attributes and pseudo-classes > Elements and pseudo-elements

[Reference](https://youtu.be/c0kfcP_nD9E)







## CSS Units

[Great tutorial](https://www.youtube.com/watch?v=qrduUUdxBSY)


**Terminology:**

* The **viewport** is the user's visible area of a web page.

Unit | Full name / Category | Description
------------|-----|---
px | Pixels | Fixed pixels
% | Precenatges | Make the child percentage of the parent
em | Font-sizes | Relative to their parents elements
rem | Font-sizes | Relative to the font size of the **root element** of the document, the rem is constant throughout the document.|-
px | Pixels | -
vw | viewport width |-
vh | viewport height | Should be x% from the viewport height
vw | viewport width |-
vmin | viewport minimum |-
vmax | viewport maximum | -


**Example of rem:**

```css
html{
	font-size:10px; // By default the font size is 16px in the browser
}

p{
	font-size:2rem; // Multiplies 2*10 so we will get 20px
}
```

**Example of em:**

```css
html{
	font-size:10px; // By default the font size is 16px in the browser
}

.box {
	font-size:2em; // Multiplies 2*10 so we will get 20px (The box' parent is html)
}

p{
	font-size:2em; // Multiplies 2*(2*10) so we will get 40px (The p's parent is box)
}
```

## calc()
### Use case #1: when we mix units

```css

.container {
  max-width: 800px;
  width: calc(100vw - 2em);
  margin: 0 auto;
}

```



## Position Property

Type | Description
------------|-----
static | The elements follow the normal document flow (our block level elements)
absolute | Is positioned relative to the nearest positioned parent (parent is the containing element).
relative | Will cause it to be adjusted away from its **normal position** by setting `top` , `left`,etc.
fixed |  Is positioned relative to the viewport, which means it **always stays in the same place even if the page is scrolled** .

Important: After you use the `position` property, use `top`,`left`,`right` properties.

Nice trick:
In case you want **the center of the element to line up with the center of its parent**:

`
transform: translate(-50%, -50%);
`


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
Specify no color | `background: none;`

The `background:none` can be useful with:
```css
border:none;
background:none;
outline: none;
```



[Table of color names](https://www.w3schools.com/colors/colors_names.asp)
You can also use: **colorpicker**

## Gradient
Description | Example
------------|-----
Linear Gradient from left to right | `background-image: linear-gradient(to right, #a25b5b, #692e4c);`
Linear Gradient from left to right with opacity | `background-image: linear-gradient(to right, rgba(126, 213, 111, 0.8), rgba(40, 180, 131, 0.8));`
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
Set Background size cover | `background-size: cover;`
Set no repetition of the image | `background-repeat: no-repeat;`
Set repeat on the X-axis | `background-repeat: repeat-x;`
Set repeat on the Y-axis | `background-repeat: repeat-y;`
Resize an image proportionally according to the box size | `background-size: cover;`
Positioning an image | `background-position: center`


[Nice background patterns](https://www.toptal.com/designers/subtlepatterns/)


## Polygon

specify the coordinates(either px or percentage) of the polygen, clockwise order. i.e:

```css
clip-path: polygon(0 0, 100% 0 , 100% 200px, 0 100%)
```

[Useful tool](https://bennettfeely.com/clippy/)


## Flex [(Reference)](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)

* Flex is a set of rules for automatically streching multiple columns and rows of content across parent container.

* Elements placed inside this container are called items.

Description | Example
------------|-----
Add flex (mandatory before applying the other properties of flex) makes the children flex items | `display: flex `
Setting elements one beside the other on the smae row ( **by default it's row**)| `flex-direction: row | row-reverse;`
Setting the elements stack one above the other | `flex-direction: column | column-reverse;`
Setting alignment to the center (**Horizontal axis**) | `justify-content: center`
Set alignment to the left  (**Horizontal axis**) | `justify-content: flex-start`
Set alignment to the right (**Horizontal axis**) | `justify-content: flex-end`
Setting alignment to the center (**Vertical axis**) | `align-items: center`
Set alignment to the top  (**Vertical axis**) | `align-items: flex-start`
Set alignment to the buttom  (**Vertical axis**) | `align-items: flex-end`
Set space around each element (**Horizontal axis**) | `justify-content: space-around`
Set space between every pair of elements (**Horizontal axis**) | `justify-content: space-between`
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
Select all (universal selector) | `* { margin: 0; padding:0}`
Select all paragraphs and all h1's and color text in green | `p, h1 { color: green; }`
Select specific class-name | `.my_class { color: green; }`
Select the paragraphs that are **inside** `my_class` | `.my_class p { color: green; }`

Select the paragraphs that are inside body-text | `.body-tex`


## Text properties

Property | Value
------------|-----
text-align | center | left | right
text-decoration | none | underline | line-through | overline
text-transform | uppercase | lowercase | capitalize
text-indent | Property is used to specify the indentation of the first line of a text
letter-spacing | Specify the space between the characters in a text
line-height | Property is used to specify the space between lines
direction | rtl | ltr
word-spacing | Property is used to specify the space between the words in a text
text-shadow | text-shadow: <horizontal> <vertical> <shadow color>;

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
Set rounded corners (Controls ths radius of the corner's curve on both X and Y axis) | `border-radius: 20px;`
Set rounded corners so it would look exactly like a circle | `border-radius: 50%;`
Add shadow around a wide element | `box-shadow: 5px 5px 10px #000`
Add glowing effect | `box-shadow: 0 0 10px #FFF`


Great reference to resources:

[css-tricks (border-radius)](https://css-tricks.com/almanac/properties/b/border-radius/)
[css-tricks (box-shadow)](https://css-tricks.com/almanac/properties/b/box-shadow/)

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

* Useful for animating shapes in SVG ([Link](https://css-tricks.com/transforms-on-svg-elements/))

[Demonstrating transforms](https://codepen.io/Codingforpleasure/pen/vPMVzv)
[Demonstrating Perspective](https://codepen.io/Codingforpleasure/pen/WmWYLX)

 Description | Example | Demo
------------|-----|---
Move the element on it's X and Y axis | `transform: translate(30px,10px);` | [Link](https://www.w3schools.com/csSref/playit.asp?filename=playcss_transform_translate)
Rotating an element around its center | `transform: rotate(45deg);` | [Link](https://www.w3schools.com/csSref/playit.asp?filename=playcss_transform_rotate)
Setting the rotation origin in top right corner | `transform-origin: top right;` | [Link](https://codepen.io/Codingforpleasure/pen/oVEBjg)
Setting the rotation origin in top left corner | `transform-origin: top left;` | [Link](https://codepen.io/Codingforpleasure/pen/oVEBjg)
Setting the rotation origin with percent | `transform-origin: 20% 40%;` | [Link](https://www.w3schools.com/csSref/css3_pr_transform-origin.asp)
Scale element's size | `scale(2,0.5)`| [Link](https://www.w3schools.com/csSref/playit.asp?filename=playcss_transform_scale)
skew transformation along the X-axis | `skewX(20deg)` | [Link](https://www.w3schools.com/csSref/playit.asp?filename=playcss_transform_skew)

[Reference](https://www.w3schools.com/csSref/css3_pr_transform.asp)

**Important comment for SVG animation:**

Set the property: `transform-box: fill-box;`
<br>and the property `transform-origin` in the SVG element ([code example](https://codepen.io/Codingforpleasure/pen/KEoLVd)).
<br>Otherwise it won't work!!!

## List style

Description | example
------------|-----
Style **order** list | `list-style-type: lower-roman | lower-alpha | upper-alpha;`
Style **unorder** list | `list-style-type: circle | square | disc;`
Style list with image bullets| `list-style-image: url(../img/icon.png);`


## Useful shape tool

[Link](https://bennettfeely.com/clippy/)


## Animation

Useful extention for Chrome browser: [keyframes](https://keyframes.app/) ([Demo](https://www.youtube.com/watch?v=H598jXvQhLw))


### Example 1: Progress bar

```svg
#my-progress{
    background: #3A84D6;
    border-radius: 25px;
    height:35px;
    width:0px;
}

#my-progress: hover {
    transition: all 0.1s ease;
	width:125px;
}
```

All existed properties after **transitions**  will take effect in 0.1s.

### animation properties

Property | Duration
------------|-----
 animation-name |
 animation-duration | Defines how long time an animation should take to complete
 animation-delay | A delay for the start of an animation
 animation-iteration-count | The number of times an animation should run **or** use "infinite"
 animation-timing-function | specifies the speed curve of the animation


### Example 2: Animating movement and opacity **with keyframes**
```svg
.my-title{
    display:block;
    font-size: 60px;

    animation-name: moveInFromLeft; /* Must bind the animation to an element */
    animation-duration: 1s;
}

@keyframes moveInFromLeft {
    0% {
        opacity: 0;
        transform: translateX(-100px);
    }

    100% {
        opacity: 1;
        transform: translateX(0);
    }
}
```

### Example 3: Animating color transition


```svg
/* The element to apply the animation to */

div {
  width: 100px;
  height: 100px;
  background-color: red;
  animation-name: colorTransition;
  animation-duration: 4s;
}

@keyframes colorTransition {
  from {background-color: red;}
  to {background-color: yellow;}
}

```




[priceless](https://stackoverflow.com/questions/15139090/setting-transform-origin-on-svg-group-not-working-in-firefox)
@PatrickGrey's answer worked perfectly for me, but I needed to handle a much more complex SVG with several paths. I was able to accomplish this fix using Inkscape, but it was a multi-step process. I recommend doing this with the Inkscape XML Editor open so you can watch what's happening.

    Select the elements you want to transform and choose Object > Group to make a new group. Drag this group so that it is centered over the top left corner of the document. This applies a transform="translate(…, …)" attribute to the group.

    Choose Object > Ungroup from the menu. This will "flatten" the transform attribute, applying any coordinate transformations to the elements in the group.

    The original elements should still be selected. Choose Object > Group to put them back into a group. If you are using CSS to transform the elements, add your ID or class attribute to this group (The XML editor comes in handy for this bit, or you can modify the group's ID by right-clicking it and choosing Object Properties. Classes will need to be added through the XML editor or later in your text editor.).

    With the group selected, choose Object > Group again. This creates a new group around the original group.

    Drag this new group to the correct location in the document. If you inspect the DOM using the XML editor, you'll see the transform="translate(…, …)" is added to the outer group.

    Any CSS transforms can now be applied to the inner group, and they will be handled consistently by Chrome and Firefox.

Thanks to @PatrickGrey.co.uk for the initial insight. The trickiest part was figuring out how to apply the initial transform to the complex object's coordinates without resorting to hair pulling and extensive maths. The "Group, move, Ungroup" trick was documented a few places on StackOverflow, but I'd forgotten it until today. Hopefully these steps can save someone else a fair amount of grief.
