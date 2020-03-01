<p align="center"> <!-- style="width:400px;" -->
  <img src="images/flutter/logo.png" title="tool tip here">
</p>

<!--ts-->
   * [Flutter](#flutter)
      * [include packages:](#include-packages)
      * [Project hierarchy:](#project-hierarchy)
      * [Remove debug banner](#remove-debug-banner)
      * [Useful widgets](#useful-widgets)
         * [Layout widget](#layout-widget)
      * [Single-child layout widgets](#single-child-layout-widgets)
         * [Container](#container)
            * [Margin (For the ouside of the widget)](#margin-for-the-ouside-of-the-widget)
            * [Padding (For the inside of the widget)](#padding-for-the-inside-of-the-widget)
      * [multiple-child layout widgets](#multiple-child-layout-widgets)
         * [Column](#column)
      * [Other](#other)
         * [Fonts](#fonts)
         * [Icons](#icons)
         * [Pallete](#pallete)
      * [Variables in Dart](#variables-in-dart)
      * [The correct file structure in flutter app](#the-correct-file-structure-in-flutter-app)
      * [Widget resource](#widget-resource)
         * [Boiler plate](#boiler-plate)
      * [Hotkeys](#hotkeys)
         * [Widget lifecycle](#widget-lifecycle)
            * [Stateless widget](#stateless-widget)
            * [Stateful widget](#stateful-widget)
         * [Setting state](#setting-state)
         * [Useful](#useful)
      * [Emulator](#emulator)
      * [Permissions](#permissions)
      * [Navigation](#navigation)
      * [Setting up RTL](#setting-up-rtl)
      * [Styled text with Flutter](#styled-text-with-flutter)
      * [Scaffold in details](#scaffold-in-details)
      * [Basic commands in flutter cli](#basic-commands-in-flutter-cli)
      * [Nice sites:](#nice-sites)

<!-- Added by: gil_diy, at: 2020-02-28T04:06+02:00 -->

<!--te-->

# Flutter

## include packages:

in the `pubspec.yaml`

holds the dependencies of your project.

## Project hierarchy:

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/labeling_example.png" title="tool tip here">
</p>

## Remove debug banner

`debugShowCheckedModeBanner: false`

## Useful widgets

[Link to widgets ](https://medium.com/flutter-community/flutter-basic-widgets-349e24140453)

### Layout widget

[Cheat sheet layout](https://medium.com/flutter-community/flutter-layout-cheat-sheet-5363348d037e)

[Link](https://flutter.dev/docs/development/ui/widgets/layout)

Widget name | Description
------------|-----
SafeArea | Container which takes the content and shows were it is visible for the user.
Text | Ouputing text
SizedBox | for adding something with fixed height usally for spacing between elements.
TextField | Receiving user input
Card | [demo](https://api.flutter.dev/flutter/material/Card-class.html)
ListTile | [Demo](https://api.flutter.dev/flutter/material/ListTile-class.html)
Column |
Row |
CircleAvatar | For profile page
FlatButton |
SingleChildScrollView |
ListView |
Expanded |


```flutter
CircleAvatar(
                  radius: 50.0,
                  backgroundImage: AssetImage('images/liran.jpg'),
                ),
```


```flutter
Card(
      color: Colors.white,
      margin:
          EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: ListTile(
        leading: Icon(
          Icons.phone,
          color: Colors.teal,
        ),
        title: Text(
          '052-6718195',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.teal.shade900,
            fontFamily: 'Source Sans Pro',
          ),
        ),
      ),
    ),

```
## Single-child layout widgets

### Container
```flutter
home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            height: 100.0,
            width: 100.0,
            margin: EdgeInsets.fromLTRB(30.0, 10.0, 50.0, 20.0),
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Text('Hello'),
          ),
        ),
      ),
```

#### Margin (For the ouside of the widget)
```flutter
margin: EdgeInsets.frontLTRB(30.0, 10.0, 50.0, 20.0)
```
or 

```flutter
margin: EdgeInsets.only(left: 30.0)
```

#### Padding (For the inside of the widget)




```flutter
padding: EdgeInsets.all(left: 20.0)
```

```flutter
TextField(
	decoration: InputDecoration(labelText:'Title'),
	),
```

## multiple-child layout widgets
### Column

```flutter
home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.fromLTRB(30.0, 10.0, 50.0, 20.0),
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Text('Container 1'),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.fromLTRB(30.0, 10.0, 50.0, 20.0),
                padding: EdgeInsets.all(10),
                color: Colors.blue,
                child: Text('Container 2'),
              ),
              Container(
                height: 100.0,
                width: 100.0,
                margin: EdgeInsets.fromLTRB(30.0, 10.0, 50.0, 20.0),
                padding: EdgeInsets.all(10),
                color: Colors.red,
                child: Text('Container 3'),
              ),
            ],
          ),
        ),
      ),
```

**Useful properties**

propery | description
------------|-----
verticalDirection: verticalDirection.down | lay the continers from up to bottom or the opposite direction.

```flutter
mainAxisAlignment: MainAxisAlignment.spaceEvenly
```

Strech the column width:
```flutter
crossAxisAlignment: CrossAxisAlignment.stretch
```
## Other
### Fonts
[Hebrew Fonts](https://fonts.google.com/?subset=hebrew)

### Icons
[Material Design Icons](https://material.io/resources/icons/?style=baseline)

convert image into icon:

**Website:** `https://appicon.co/`

### Pallete
[Material Pallete](https://www.materialpalette.com/)



## Variables in Dart


## The correct file structure in flutter app

`models` - This directory holds the **class files**
`widgets` - This directory holds the **widget files**


## Widget resource

[Link](https://flutter.dev/docs/development/ui/widgets)


### Boiler plate
Shortcut | Description
------------|-----
`stless` | stateless widget - boiler plate for stateless widget
`stful` | stateful widget - boiler plate for stateful widget

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

We can tap into each of these stages in the lifecycle if we wanted different things to happen at various times. I have listed here three common hooks:

* **initState()** - which gets triggered when that state initally gets initialized.

* **build()** - which gets triggered when the widgets are actually built and will show up on screen.

* **deactivate()** -  which gets called when that statefull widget gets destroyed.


**Comment:** There are more hooks, which i haven't mentioned here.

### Setting state

We actually need to specifically specify that we are updating the state by calling a method called set setState and inside the setState is where we do the actual change.

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

Property | Description
------------|-----
 mainAxisAlignment |
 verticalDirection | frg


## Emulator

```bash
flutter emulators --launch sim
```

**List all emulators:**

```bash
avdmanager list avd
```

[Great Reference](https://developer.android.com/studio/run/emulator-commandline)

## Permissions


You should list in the folowing files the permissions, which will be requested by the user:

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

## Setting up RTL


first you must add flutter_localizations package to your pubspec.yml

now you have two choices :
```
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter
```

**Now you have two choices :**

Force a locale ( and direction ) on all devices.

**method 1:** with localization 

```flutter
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

MaterialApp(
  localizationsDelegates: [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: [
    Locale("he"), // OR Locale('ar', 'AE') OR Other RTL locales
  ],
  locale: Locale("he") // OR Locale('ar', 'AE') OR Other RTL locales,
  .
  .
  .
);
```

**method 2:** without localization 
```flutter
MaterialApp(
  .
  .
  .
  builder: (context, child) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: child,
    );
  },
  .
  .
  .
);
```

[Reference](https://stackoverflow.com/questions/50535185/right-to-left-rtl-in-flutter)

## Styled text with Flutter

[Very impressive Link](https://pusher.com/tutorials/styled-text-flutter)


## Scaffold in details

[Great explanantion](https://medium.com/flutterdevs/know-your-widgets-scaffold-in-flutter-292b8bc1281)

## Buttons
[Link](https://medium.com/flutterpub/anatomy-of-material-buttons-in-flutter-first-part-40eb790979a6)

## Basic commands in flutter cli

command | Description
------------|-----
`flutter run` | Run your Flutter app on an attached device
`flutter install` | Install a Flutter app on an attached device.
`flutter devices` | List all connected devices.
`flutter clean` | Delete the build/ and .dart_tool/ directories.




## Nice sites:

* [Link](https://icons8.com)

* [Link](https://vecteezy.com)

* [Link](https://www.canva.com)