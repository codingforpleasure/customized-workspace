
<!--ts-->
   * [SVG](#svg)
      * [Terminology](#terminology)
      * [Latex to svg](#latex-to-svg)
      * [Generate svg with python](#generate-svg-with-python)
      * [Prettify svg in vscode](#prettify-svg-in-vscode)
      * [Edit svg in vscode](#edit-svg-in-vscode)
      * [See the the XML code in inkscape](#see-the-the-xml-code-in-inkscape)
      * [How to export svg in <strong>inkskape</strong> ?](#how-to-export-svg-in-inkskape-)
      * [SVG optimizer from shell](#svg-optimizer-from-shell)
      * [Tools for SVG](#tools-for-svg)
      * [How to convert "Object to Path" in inkscape?](#how-to-convert-object-to-path-in-inkscape)
      * [Line animation in svg](#line-animation-in-svg)
   * [SVG Elements](#svg-elements)
      * [SVG circle element](#svg-circle-element)
         * [Basic circle properties](#basic-circle-properties)
         * [Styling the circle](#styling-the-circle)
      * [SVG rectangle element](#svg-rectangle-element)
         * [Basic rectangle properties](#basic-rectangle-properties)
         * [Styling the rectangle](#styling-the-rectangle)
      * [SVG text element](#svg-text-element)
         * [transform attribute](#transform-attribute)
         * [Styling text](#styling-text)
      * [SVG tspan element](#svg-tspan-element)
      * [SVG tref element](#svg-tref-element)
      * [SVG textpath element](#svg-textpath-element)
      * [SVG line element](#svg-line-element)
      * [Tools overview for the job:](#tools-overview-for-the-job)
      * [Python library for drawing svg](#python-library-for-drawing-svg)
      * [Visulize svg path on the web fast!!](#visulize-svg-path-on-the-web-fast)

<!-- Added by: gil_diy, at: 2020-07-23T15:14+03:00 -->

<!--te-->


# SVG

## Terminology

Term | Description
------------|-----
viewport | The size of the vieawble area
viewBox | Controls what is inside of this viewable area
    -     |  viewBox(min-x, min-y, width,height)
    -    | if viewBox-width/viewBox-height > viewport-width/height then zoom-in
    -     | if viewBox-width/viewBox-height < viewport-width/height then zoom-out


Setting up the view port:

```html
<svg width="100" height="100">

</svg>

```

Setting up the viewBox:

```html

//viewport starts at 0,0 and the other coordinates controls on zoom in/out
//
<svg viewBox="0 0 300 300">

</svg>

```

## Latex to svg

[Link](https://viereck.ch/latex-to-svg/)

## Generate svg with python

[Link](https://github.com/hogesonline/svg_play)
[Link](https://github.com/cduck/drawSvg)


## Prettify svg in vscode

1. Make sure this [extension](https://marketplace.visualstudio.com/items?itemName=jock.svg) is installed.
2. Press 'Ctrl + Shift + p' enter 'pretty SVG'.

## Edit svg in vscode

1. Install: [Very useful extension (svg editor) ](https://marketplace.visualstudio.com/items?itemName=henoc.svgeditor)
2. open the svg file
3. `Ctrl + Shift + p` afterwards enter:`svg editor` you will be suggested: **"Open SVG Editor"**

## See the the XML code in inkscape

press the keys `Ctrl + Shift + x`

## How to export svg in **inkskape** ?

1. Select the object(s) to export
2. Open the document properties window (Ctrl+Shift+D)
3. Select "Resize page to drawing or selection"
4. File > Save As Copy...
5. Select `Optimized SVG` as the format if you want to use it on the web

Great repository for svg optimization: [Github repo](https://jakearchibald.github.io/svgomg/)

Difference between SVG to html:

html land | SVG land
------------|-----
 Background | fill
 Borders | stroke

## SVG optimizer from shell

SVGO is terminal-based, with no visual GUI
```bash
sudo npm install -g svgo
```

[official github](https://github.com/svg/svgo)

## Tools for SVG

* [sublime SVG snippets](https://packagecontrol.io/packages/SVG-Snippets) - Very useful

* [prettify SVG code](https://jakearchibald.github.io/svgomg/)

## How to convert "Object to Path" in inkscape?

Path -> Object to Path

## Line animation in svg

[Nice](https://youtu.be/plEKge4zq68)

# SVG Elements

## SVG circle element

### Basic circle properties

Property | Description
------------|-----
cx | position the center with x coordinate
cy | position the center with y coordinate
r | radius size


### Styling the circle

Property | Description
------------|-----
stroke |
stroke-width |
stroke-dasharray | [Link](https://youtu.be/c9KHUPGzgYg?t=118)
stroke-opacity | Setting the stroke's opacity
fill | color to fill in the circle
fill-opacity | Adding transparency

**code example:**

```svg
 <circle cx="105" cy="105" r="100"
	style="stroke: #006600;
			stroke-width: 5;
			stroke-dasharray: 10 5;
			fill: #ff0000;
			fill-opacity: 0.5;"
 />
```

## SVG rectangle element

### Basic rectangle properties

Property | Description
------------|-----
x | x coordinate
y | y coordinate
height | rectangle height
width | rectangle width
rx | rounded corner x
ry | rounded corner y

### Styling the rectangle

Property | Description
------------|-----
stroke |
stroke-width |
stroke-dasharray | [Link](https://youtu.be/c9KHUPGzgYg?t=118)
stroke-opacity | Setting the stroke's opacity
fill | color to fill in the circle
fill-opacity | Adding transparency

**code example:**

```svg
<rect x="10" y="10" height="10"
      rx="20"
      ry="10"
      style="stroke: #990000;
      stroke-width: 3;
      stroke-dasharray:10 10;
      fill: #ff0000;"
/>
```


## SVG text element


Property | Description
------------|-----
 x | x coordinate
 y | y coordinate
 textLength | set the text length in px (the text will get streched)

### transform attribute

Function | Description
------------|-----
rotate(deg,x,y) | roatate in a degrees in the point (x,y)
 | The space in px between words


### Styling text

Property | Description
------------|-----
font-family | Pick one of the fonts
direction | rtl
letter-spacing | The space in px between letters
word-spacing | The space in px between words
writing-mode | You can write text in different modes (tb - top to bottom)
glypyh-orientation-vertical | [glypyh-orientation-vertical](https://youtu.be/2l3Nm3PtKsk?t=605)
stroke |
stroke-width |
fill |
text-decoration | `underline | overline | line-through `


```svg
<text x="10" y="40">
	SVG text example
</text>
```

```svg
<text x="10" y="40" style="stroke: #cccccc; fill: #000000; font-size: 120px;">
	SVG text example
</text>
```

```svg
<text x="10" y="40"
      style="stroke: #cccccc;
      		 font-family: Arial;
             fill: #000000;
             font-size: 120px;
             text-decoration: line-through;
             stroke: #0000ff;
             stroke-width: 2;
             fill: #ffffff;
            ">
	SVG text example
</text>
```


## SVG tspan element

Used to render multiple lines relative to each other below each other.

## SVG tref element

Can be used to define a text once and then refer to a text several times in an svg image, no need include it multiple times just refer it.

## SVG textpath element

Draw a text along with a path, very nice and cool.


## SVG line element



## Tools overview for the job:


* GSAP (GreenSock), example:
[ease-visualizer](https://greensock.com/ease-visualizer)

* **React Spring/React-Motion**
  Great for single movement that you'd like to look realistic.

* **AnimeJS**
  is a lot like GSAP! But less plugins



## Python library for drawing svg

[Link](https://github.com/mozman/svgwrite)

## Visulize svg path on the web fast!!

[Link](http://svghelper.com/)