<!--ts-->
   * [SVG](#svg)
      * [Terminology](#terminology)
      * [Prettify svg in vscode](#prettify-svg-in-vscode)
      * [Edit svg in vscode](#edit-svg-in-vscode)
      * [How to export svg in <strong>inkskape</strong> ?](#how-to-export-svg-in-inkskape-)
      * [Tools for SVG](#tools-for-svg)
      * [Hot to convert "Object to Path" in inkscape?](#hot-to-convert-object-to-path-in-inkscape)
      * [Tools overview for the job:](#tools-overview-for-the-job)

<!-- Added by: gil_diy, at: 2019-03-13T12:48+02:00 -->

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

## Prettify svg in vscode

1. Make sure this [extension](https://marketplace.visualstudio.com/items?itemName=jock.svg) is installed.
2. Press 'Ctrl + Shift + p' enter 'pretty SVG'.

## Edit svg in vscode

1. Install: [Very useful extension (svg editor) ](https://marketplace.visualstudio.com/items?itemName=henoc.svgeditor)
2. open the svg file
3. `Ctrl + Shift + p` afterwards enter:`svg editor` you will be suggested: **"Open SVG Editor"**

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

## Tools for SVG

* [sublime SVG snippets](https://packagecontrol.io/packages/SVG-Snippets) - Very useful

* [prettify SVG code](https://jakearchibald.github.io/svgomg/)

## Hot to convert "Object to Path" in inkscape?

Path -> Object to Path

## Tools overview for the job:
* GSAP (GreenSock), example:
[ease-visualizer](https://greensock.com/ease-visualizer)

* **React Spring/React-Motion**
  Great for single movement that you'd like to look realistic.

* **AnimeJS**
  is a lot like GSAP! But less plugins



