# Inkscape

<!--ts-->
* [Inkscape](#inkscape)
   * [Useful Hotkeys](#useful-hotkeys)
      * [Operations on objects](#operations-on-objects)
      * [Operations on path](#operations-on-path)
      * [Setting up the relevant python interpreter for inkscape](#setting-up-the-relevant-python-interpreter-for-inkscape)
   * [SVG processing on the command line](#svg-processing-on-the-command-line)
      * [Export an SVG file into PNG with the default resolution of 96 dpi](#export-an-svg-file-into-png-with-the-default-resolution-of-96-dpi)
      * [Actions](#actions)
         * [Select all objects with ellipse tag, rotate them 30 degrees, save the file, and quit.](#select-all-objects-with-ellipse-tag-rotate-them-30-degrees-save-the-file-and-quit)
      * [See all in the s](#see-all-in-the-s)
   * [Reference](#reference)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sun 26 Feb 2023 01:12:35 AM IST -->

<!--te-->

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


### See all in the s

```bash
inkscape/src/actions
```
## Reference

[Link](https://inkscape.org/doc/inkscape-man.html)