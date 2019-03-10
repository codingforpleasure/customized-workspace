<!--ts-->
   * [SCSS (Sassy CSS)](#scss-sassy-css)
      * [Comparison of SCSS to SASS](#comparison-of-scss-to-sass)
      * [Setup](#setup)
      * [Powerful capabilities:](#powerful-capabilities)
         * [Variables](#variables)
         * [Importing](#importing)
         * [Partials](#partials)
         * [Map](#map)
         * [Function](#function)
         * [Mixins](#mixins)
            * [Example #1:](#example-1)
            * [Example #2:](#example-2)
            * [Example #3: Nested mixin](#example-3-nested-mixin)

<!-- Added by: gil_diy, at: 2019-03-10T10:42+02:00 -->

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




```css
.container {

	float: left;
	width: 100%;

	p {
		color: #333;
	}
}
```

## Powerful capabilities:

### Variables

```css
$my-color: green;

body {
    color: $my-color;
}
```

### Importing

```css
@import url('https://fonts.googleapis.com/css?family=Merriweather:300,900|Six+Caps');
```

### Partials

Partials in Scss helps us to break our files into small files without affecting performance. A partial is simply an **Scss file preceded by an underscore**. An example is **_variables.scss** .
In case the size of the project is large. we can hold one file which holds dozen of colors for our app,
other file holds all fonts of our app, this way we make **our code more madular and more maintainable**, for exampele

The underscore tells Scss that the file is a partial and that it should not be compiled to CSS.


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

In file: **my-main-design.scss**:
```css
@import "fonts";
@import "sizes";

...
```

### Map

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

Allows to create reusable styles, so you can use those mimixs to mix them into your other designs.


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

-----------------------------------------------------------------------

If you are targetting to both mobile and desktop,
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
