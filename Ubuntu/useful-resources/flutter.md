<!--ts-->
   * [Flutter](#flutter)
      * [include packages:](#include-packages)
      * [Useful widgets](#useful-widgets)
      * [The correct file structure in flutter app](#the-correct-file-structure-in-flutter-app)
      * [Widget resource](#widget-resource)
      * [Hotkeys](#hotkeys)
         * [Widget lifecycle](#widget-lifecycle)
            * [Stateless widget](#stateless-widget)
            * [Stateful widget](#stateful-widget)
         * [Setting state](#setting-state)
         * [Useful](#useful)
      * [Emulator](#emulator)
      * [Permissions](#permissions)
      * [Navigation](#navigation)
      * [Basic commands in flutter cli](#basic-commands-in-flutter-cli)

<!-- Added by: gil_diy, at: 2019-10-03T23:47+03:00 -->

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



### Widget lifecycle



#### Stateless widget

#### Stateful widget

* We can tap into each of these stages in the lifecycle if we wanted different things to happen at various times.

**initState()** - which gets triggered when that state initally gets initialized.

**build()** - which gets triggered when the widgets are actually built and will show up on screen.

**deactivate()** -  which gets called when that statefull widget gets destroyed.


### Setting state

Example:

```bash
class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 3;
  int rightDiceNumber = 2;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
```

### Useful
property | Title2
------------|-----
 mainAxisAlignment |
 verticalDirection | frg


## Emulator

```bash
flutter emulators --launch sim
```

## Permissions

OS | Path
------------|-----
 android | ./android/app/src/main/AndroidManifest.xml
 ios | ./ios/Runner/Base.lproj/Info.plist


## Navigation
```bash
Navigator.push(context, MaterialPageRoute(builder: (context) {
  return myNewNextScreen();
})
```


## Basic commands in flutter cli

command | Description
------------|-----
`flutter run` | Run your Flutter app on an attached device
`flutter install` | Install a Flutter app on an attached device.
`flutter devices` | List all connected devices.
`flutter clean` | Delete the build/ and .dart_tool/ directories.
