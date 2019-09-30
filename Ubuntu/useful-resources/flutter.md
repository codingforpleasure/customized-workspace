<!--ts-->
   * [Flutter](#flutter)
      * [include packages:](#include-packages)
      * [Useful widgets](#useful-widgets)
      * [The correct file structure in flutter app](#the-correct-file-structure-in-flutter-app)
      * [Widget resource](#widget-resource)
      * [Hotkeys](#hotkeys)
         * [Useful](#useful)

<!-- Added by: gil_diy, at: 2019-09-30T10:31+03:00 -->

<!--te-->

# Flutter

## include packages:

in the `pubspec.yaml`
```flutter

```
holds the dependencies of your project.


## Useful widgets

Widget name | Description
------------|-----
Text | Ouputing text
TextField | Receiving user input
Card |
Column |
Row |
FlatButton |
SingleChildScrollView |
ListView |
Expanded |

```flutter
TextField(
	decoration: InputDecoration(labelText:'Title'),
	),
```


## The correct file structure in flutter app

`models` - This directory holds the **class files**
`widgets` - This directory holds the **widget files**


## Widget resource

[Link](https://flutter.dev/docs/development/ui/widgets)



Shortcut | Description
------------|-----
`stless` | stateless widget - boiler plate for stateless widget

## Hotkeys

[Very useful for developing IDEA](https://medium.com/flutter-community/flutter-ide-shortcuts-for-faster-development-2ef45c51085b)

Shortcut | Description
------------|-----
`Ctrl+Shift I` | Get info about a widget without moving a to another file
`Ctrl + w` | Just click on the widget you want to extract and press Ctrl+W
 | The entire Widget is selected for you without your cursor moving an inch




### Useful
property | Title2
------------|-----
 mainAxisAlignment |
 verticalDirection | frg
