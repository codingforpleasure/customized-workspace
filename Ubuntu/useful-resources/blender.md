<!--ts-->
   * [Blender](#blender)
      * [Increase UI size](#increase-ui-size)
      * [Main hotkey conventions](#main-hotkey-conventions)
         * [Transforms Hotkeys](#transforms-hotkeys)
         * [How to rotate in 45 degrees in the y axis?](#how-to-rotate-in-45-degrees-in-the-y-axis)
         * [How to grab and move up by 1m on the z axis?](#how-to-grab-and-move-up-by-1m-on-the-z-axis)
      * [What is edit mode?](#what-is-edit-mode)
      * [What is object mode?](#what-is-object-mode)
      * [Give color to objects](#give-color-to-objects)
      * [Hide object](#hide-object)
      * [Hide object](#hide-object-1)
      * [Modifiers](#modifiers)
      * [Applying shade smooth](#applying-shade-smooth)
      * [Adding Subdivision surface](#adding-subdivision-surface)
      * [Installing addon in Blender](#installing-addon-in-blender)
      * [Python with Blender](#python-with-blender)
         * [Show all python operations done under the hood](#show-all-python-operations-done-under-the-hood)
         * [Adding Scripts to Blender For the Templates Menu](#adding-scripts-to-blender-for-the-templates-menu)
         * [Executing External Scripts](#executing-external-scripts)
      * [Useful web pages](#useful-web-pages)

<!-- Added by: gil_diy, at: Sat 22 Jan 2022 21:20:20 IST -->

<!--te-->

# Blender

## Increase UI size

[Link](https://www.youtube.com/watch?v=Py9CHZkHh4U)

## Main hotkey conventions

`Alt` key is the opposite operation

for example:

`h` vs `Alt + h`

`r` vs `Alt + r`

`s` vs `Alt + s`

`s` vs `Alt + s`


### Transforms Hotkeys


 Description | Hotkey
------------|-----
Grab | G (pick axis and press: x,y,z)
Rotate | R (pick axis and press: x,y,z)
Scale | S (pick axis and press: x,y,z)
Orbiting (Rotating the view) | press the middle button on the mouse
Pan | press the middle button on the mouse and Shift


### How to rotate in 45 degrees in the y axis?

* Pressing r for `rotate`,  afterwards press `y` (focus on the y axis)

* Pressing `45` as for degrees


### How to grab and move up by 1m on the z axis?

* Pressing `g` and `m`,  afterwards press `z` (focus on the y axis)

* Pressing `1` as for 1 meter


## What is edit mode?

You'll be edit vertices, edges, phaces and to change the
shape of your mesh


## What is object mode?

You'll be able to move, rotate, and resize


Description | Hotkey
------------|-----
Add object | `Shift+a`
hide object | pick object and press `h`
unhide object | press `Alt + h`
Show properties | 'n'
Move and orbit | press down the Middle button mouse
Focus on object in the horizon | click on the object and press period key `.`
Add Object | `Shift+A`
Search Bar | `F3`
Switch between `Edit mode` to `Object mode` | tab
Duplicate | `Shift+d`
Seperate | `p`
Xray | `Alt+z`
See location | `n`
See Toolbox | `t`
Wireframe mode | `Shift + z`
Apply transfrom | `Ctrl + a`
Duplicate Object | `Shift + d`
Duplicate Linked (All properties are inherited) | `Alt + d`
Inherit  | `Ctrl + l`

## Give color to objects

`color +l` => link material

[Link](https://youtu.be/kVXTmUWK_nI?t=2070)

## Hide object

In object mode press `h`

## Hide object

## Modifiers

Modifiers are automatic operations that affects geometry in non destructive way.
This means you can apply many modeling operation automatically without changing the base geometry of your object.

[Link](https://youtu.be/idcFMhoSdIc)

## Applying shade smooth

Pick  `Object Mode` and right click your mesh, and pick `shade smooth`

## Adding Subdivision surface
Click on the rench icon in the properties -> press add modifier -> Pick 'subdivision surface'


## Installing addon in Blender

Edit -> Preferences... -> Addons (Press 'Install' button)

## Python with Blender

### Show all python operations done under the hood

Enabling the debug option before running Blender:

```python
blender --debug-wm
```

### Adding Scripts to Blender For the Templates Menu

All Templates are well orginized in the following directory:

```bash
/opt/blender-3.0.0-linux-x64/3.0/scripts/templates_py
```

### Executing External Scripts
```python
import bpy
import os
 
dir_path = "/media/gil_diy/Backup/Blender_Lectures/3D_Rendered_Datasets_in_Blender_for_Beginners_Playlist/my_project"
filename = os.path.join(dir_path, "main.py")

exec(compile(open(filename).read(), filename, 'exec'))
```


[Reference](https://docs.blender.org/api/current/info_tips_and_tricks.html#executing-external-scripts)




## Useful web pages

[Blender Documentation](https://docs.blender.org/manual/en/latest/)

[Blender Python API](https://docs.blender.org/api/current/)

[Pycharm with Blender](https://b3d.interplanety.org/en/using-external-ide-pycharm-for-writing-blender-scripts/)

[Add Autocomplete](https://github.com/Korchy/blender_autocomplete)
