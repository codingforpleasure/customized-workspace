<!--ts-->
   * [SCSS (Sassy CSS)](#scss-sassy-css)
      * [Comparison of SCSS to SASS](#comparison-of-scss-to-sass)
      * [Setup](#setup)
         * [Configuring Live Sass Compiler](#configuring-live-sass-compiler)
      * [Good habits](#good-habits)
      * [Powerful capabilities:](#powerful-capabilities)
         * [Variables](#variables)
         * [Ampersand (adding another class)](#ampersand-adding-another-class)
         * [Importing](#importing)
         * [Partials](#partials)
         * [Map](#map)
         * [Function](#function)
            * [Example #1:](#example-1)
            * [Example #2:](#example-2)
         * [Mixins](#mixins)
            * [Example #1:](#example-1-1)
            * [Example #2:](#example-2-1)
            * [Example #3: Nested mixin](#example-3-nested-mixin)
            * [Example #4: Mixing with passing arguments](#example-4-mixing-with-passing-arguments)
            * [Example #5: Mixing with passsing unlimited arguments](#example-5-mixing-with-passsing-unlimited-arguments)
            * [Example #6: mixin real-world practive](#example-6-mixin-real-world-practive)
         * [Loops](#loops)
            * [For Loop](#for-loop)
            * [For each](#for-each)
         * [Conditional Directives](#conditional-directives)
         * [Inheritance](#inheritance)
         * [Media queries](#media-queries)

<!-- Added by: gil_diy, at: 2019-04-06T10:42+03:00 -->

<!--te-->


# SCSS (Sassy CSS)

## Comparison of SCSS to SASS


SCSS | SASS
------------|-----
 Curly braces & semi-colons | Indetation
 Ignores whitespaces | Strict rules for whitespace
 @mixin my-mixin | =my-mixin
 @include my-mixin | +my-mixin
 @import foo | @import too (same)
 @extend foo | @extend foo (same)


## Setup

Proprocessing from SCSS to css can be done here: [Link](https://www.sassmeister.com/)

Or you install two valuaeable extensions in vscode:

* `Live Sass Compiler` very useful and easy
  In vscode open the scss file and (Ctrl+Shift+p -> `Live Sass: Watch Sass`)

* `Live server`

* If your are using SASS install the extension: [Link](https://marketplace.visualstudio.com/items?itemName=robinbentley.sass-indented)


### Configuring `Live Sass Compiler`

According to this [Link](https://github.com/ritwickdey/vscode-live-sass-compiler/blob/master/docs/faqs.md)

Make sure the css file which was generated matches the path you mentioned in the index.html.

To generate the config easily run the script `create-config-scss`
which will create a `.vscode` and in it is the config file.


```css
.container {

	float: left;
	width: 100%;

	p {
		color: #333;
	}
}
```
## Good habits

[Link](https://medium.com/@osternaud_clem/organize-your-sass-files-b2c2513f3fcf)

## Powerful capabilities:

### Variables

```css
$my-color: green;

body {
    color: $my-color;
}
```

### Ampersand (adding another class)


The & comes in handy when you're nesting and you want to create a **more specific selector**, like an element that has *both* of two classes, like this:
```css
.some-class.another-class { }
```

would look like this:
```css
.some-class {
  &.another-class {}
}
```


[ampersand link](https://css-tricks.com/the-sass-ampersand/)

### Importing

Is for making our code more modular:

i.e:

```css

@import url('https://fonts.googleapis.com/css?family=Merriweather:300,900|Six+Caps');
@import "http://..."
@import "colors";  //You don't need to put the underscore and the file extention in partials

```

### Partials

Partials in Scss helps us to break our files into small files without affecting performance. A partial is simply an **Scss file preceded by an underscore**. An example is **_variables.scss** .
In case the size of the project is large. we can hold one file which holds dozen of colors for our app,
other file holds all fonts of our app, this way we make **our code more madular and more maintainable**, for exampele

The underscore tells Scss that the file is a partial and that it should not be compiled to CSS.
it's recommended to define a new directory for your partials called: **partials**


File: **_fonts.scss**:
```CSS
// == FONTS ===
$text-font: Verdana, Arial,sans-serif;
....
```

File: **_sizes.scss**:
```CSS
$content-width: 960ox;
$header-heigh: 60px;
$footer-heigh: 90px;
```

In file: **main.scss**, using relative paths:
```css
@import "partials/fonts";
@import "partials/sizes";

...
```

### Map

key-value structure

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


### Function

#### Example #1:

```css
@function sum($left, $right) {
	@return $left + $right;
}

sum(6,9);
```


#### Example #2:

Converting from pixels to em:

```css
@function convertPixel_to_em($pixels,$context: 16px) {
	return ($pixel / $context) * 1em;
}

body {
	font-family: $text-color;
	color: $text-color;
	font-size: convertPixel_to_em(15px); // Invoking the function
}
```


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


### Mixins

Allows to create reusable styles, so you can use those mixins to mix them into your other designs.


#### Example #1:

```css
@mixin warning {
	background-color: orange;
	color: #fff;
}


.warning-button {
	@include warning;
	padding: 8px 12px;
}

```

#### Example #2:

```css
@mixin large-text {
	font: {
		size: 22px;
		weight: bold;
	}
}


h2 {
	@include large-text;
}
```

#### Example #3: Nested mixin

```css
@mixin rounded {
	border-radius: 6px;
}


@mixin box {
	@include rounded;
	border: 1px solid #333;
}

header {
	@include box;
}
```

#### Example #4: Mixing with passing arguments

**comment:** The arguemnts have **default values** in case the value is not passed to the function.

```css
@mixin rounded($radius:6px) {
	border-radius: $radius;
}


@mixin box($radius: 6px, $border: 1px solid #000) {
	@include rounded($radius);  //Passing argument to our mixin
	border: 1px solid #333;
}

header {
	// Specifiying the name of the argument explicitly so we can pass the arguments in any order
	@include box($border: 1px solid #fff);

	// or invoke with default values
    // @include box();
}
```
#### Example #5: Mixing with passsing unlimited arguments

For passing multiple arguemnts vairable (the amount is not limited in any way)
```css
@mixin bos-shadow($shadows...) {
	box-shadow: $shadows;
	-moz-box-shadow: $shadows;
	-webkit-box-shadow: $shadows;

}

#header {
	#include box-shadow(2px 0px 4px #999, 1px 1px 6px #000)
}
```

#### Example #6: mixin real-world practive

This example is for typography:

```css
@mixin google-font($font) {
	$font: unquote($font); // built-in function in scss
	@import url(https://fonts.googleapis.com/css?family=#{$font})
}


$include google-font("Alegraya+Sans");
$include google-font("Titilli+Web");

```

**Comment**: interpolation so the prerocessor will understand this is an actual variable in the url path, so i'm using: #{varible}


### Loops

#### For Loop
For avoiding repetitive code,
So if I use in scss the following code:

```css
@for $i from 1 to 5 {
	.col-#{$i} {
		width: $1*2em;
	}
}
```

* Comment: not including 5

The **css output** would be:

```css
.col-1 {
	width: 2em;
}

.col-2 {
	width: 4em;
}

.col-3 {
	width: 6em;
}

.col-4 {
	width: 8em;
}
```

#### For each

Most well used loop in scss,


```css
$speakers: bob-banker, patty-plu,e, sandra-smith;

@each $speaker in $speakers {
	.#{$speakers}-profile {
		background-image: url('/img/#{$speaker}.png')
	}
}
```

Another example using map and for each loop:

```css
$font-sizes: (tiny: 8px, small: 11px, medium: 13px, large: 18px);
@each $name, $size in $font-sizes{
	.#($name){
		font-size:$size
	}
}
```
The output would be:

```css
.tiny{
	font-size: 8px;
}

.small{
	font-size: 11px;
}

.medium{
	font-size: 13px;
}


.large {
	font-size: 18px;
}
```

### Conditional Directives

Setting one variable for switching the look of the layout:

```css
$contrast: high;
body {
	font-family: $text-font;
	font-size: 18em;
	@if $contrast == high {
		color: #000;
	} @else if $contrast == low {
		color: #999;
	} @else {
	  color: $text-color;
	}
}
```


Another example for changing/switching the theme:

```css
$theme: Dark;

// === COLORS ===
// Allowed values: Dark, Light, Default

$theme: Dark;

$text-color: #222222;
$theme-color: #170a48;
$secondary-color: #f27731;
$trenary-color: #ccf962;
$link-color: $secondary-color;
$menu-item-color: white;

@if $theme == Dark {
	$text-color: #fff;
	body-background-color: #22222a;
	$theme-color: #42424a;
	$secondary-color: #c24721;
	$trenary-color: #698932;
	$link-color: $secondary-color;
	$menu-item-color: white;
} @else if $theme == Light {
	$text-color: #000;
	body-background-color: #fff;
	$theme-color: #372a27;
	$secondary-color: #d26741;
	$trenary-color: #b9da63;
	$link-color: $secondary-color;
	$menu-item-color: white;
}


```
### Inheritance

```css
.error {
	color: red;
}

.critical-error {
	@extend .error;
	bottom: 1px solid red;
	font-weight: bold;
}
```



### Media queries

If you are targeting to both mobile and desktop,
than you should make a decision in which state we should move from **mobile design** to **desktop design**.

```css

$desktop: 840px;

@mixin desktop {
    // The threshold:
	@media (min-width: #{$desktop}) {
		@content;
	}
}


    #bg {
        clip-path: polygon(100% 0, 100% 82%, 45% 100%, 0 100%, 0 0);
        width: 100%;
        height: 100%;

		// Using the mixin for changing the layout
        @include desktop {
            clip-path: polygon(0 0, 75% 0, 55% 100%, 0% 100%);
        }
	}
```

