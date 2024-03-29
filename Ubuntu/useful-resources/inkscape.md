# Inkscape

<!--ts-->
- [Inkscape](#inkscape)
  - [Get the outline of a complex shape](#get-the-outline-of-a-complex-shape)
  - [Useful Hotkeys](#useful-hotkeys)
    - [Operations on objects](#operations-on-objects)
    - [Operations on path](#operations-on-path)
    - [Setting up the relevant python interpreter for inkscape](#setting-up-the-relevant-python-interpreter-for-inkscape)
  - [SVG processing on the command line](#svg-processing-on-the-command-line)
    - [Export an SVG file into PNG with the default resolution of 96 dpi](#export-an-svg-file-into-png-with-the-default-resolution-of-96-dpi)
    - [Actions](#actions)
      - [Select all objects with ellipse tag, rotate them 30 degrees, save the file, and quit.](#select-all-objects-with-ellipse-tag-rotate-them-30-degrees-save-the-file-and-quit)
      - [Select all objects, rescale and resize the page to selection and export](#select-all-objects-rescale-and-resize-the-page-to-selection-and-export)
      - [Get all list of actions](#get-all-list-of-actions)
      - [Reference](#reference)
  - [Reference](#reference-1)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sun 26 Feb 2023 08:58:29 AM IST -->

<!--te-->

## Get the outline of a complex shape

Ungroup all elemnts in the complex shape (Do it couple of times until all elements are ungrouped), and then go to the menu pick: `path` and pick `Union`

Reference: https://youtu.be/GjkVKpB2Gh0

## Useful Hotkeys

###  Operations on objects

Description | Hotkey
------------|-----
Duplicate object | `Ctrl + d`
Group elements | `Ctrl + g`
Ungroup elements | `Ctrl + Shift + g`
Move up the object | `Page up`
Move Down the object | `Page up`

###  Operations on path

* **First choose all relevant paths**

Description | Hotkey
------------|-----
Union paths | `Ctrl + Shift +`
differenece paths | `Ctrl + Shift + -`

[Great Reference](https://www.youtube.com/watch?v=jxhR9aT6crU)


### Setting up the relevant python interpreter for inkscape 

```bash
/home/gil_diy/.config/inkscape/preferences.xml
```

[Reference](https://wiki.inkscape.org/wiki/index.php/Extension_Interpreters)

Important message:

Since Inkscape version 0.92.5 (Released on 2020-04-09) 
**Python extensions will now run with Python 3**


## SVG processing on the command line

### Export an SVG file into PNG with the default resolution of 96 dpi

```bash
inkscape --export-filename=filename.png filename.svg
```


Same, but force the PNG file to be **600x400 pixels**:

```bash
inkscape --export-filename=filename.png -w 600 -h 400 filename.svg
```


export the drawing (bounding box of all objects), not the page:

```bash
inkscape --export-filename=filename.png --export-area-drawing filename.svg
```
### Actions

#### Select all objects with ellipse tag, rotate them 30 degrees, save the file, and quit.

```bash
inkscape --actions="select-by-element:ellipse;transform-rotate:30" --export-overwrite filename.svg
```


#### Select all objects, rescale and resize the page to selection and export

```bash
inkscape <input-svg-file> --actions="select-all;transform-scale:2;page-fit-to-selection" --export-filename=<output-svg-file>
```



Command property | Description
-----------------|-------------
  | 


#### Get all list of actions

```bash
inkscape --action-list
```

#### Reference

See all in the following source code of inkscape (cpp files):

```bash
inkscape/src/actions
```


https://wiki.inkscape.org/wiki/Using_the_Command_Line

## Reference

[inkscape manual](https://inkscape.org/doc/inkscape-man.html)