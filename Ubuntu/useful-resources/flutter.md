<p align="center"> <!-- style="width:400px;" -->
  <img src="images/flutter/logo.png" title="tool tip here">
</p>

<!--ts-->
   * [Flutter](#flutter)
      * [include packages:](#include-packages)
      * [Project hierarchy:](#project-hierarchy)
      * [Remove debug banner](#remove-debug-banner)
      * [Layout in flutter](#layout-in-flutter)
      * [Modify Launcher Icon in Flutter](#modify-launcher-icon-in-flutter)
      * [Useful widgets](#useful-widgets)
         * [Widgets for layout](#widgets-for-layout)
         * [Typography Widgets](#typography-widgets)
         * [Button Widgets](#button-widgets)
         * [Animation Widgets](#animation-widgets)
            * [Implicit Animations Widgets](#implicit-animations-widgets)
            * [Other Animations Widgets](#other-animations-widgets)
         * [Dialog Widgets](#dialog-widgets)
         * [Events Widgets](#events-widgets)
         * [Layout widget](#layout-widget)
      * [Single-child layout widgets](#single-child-layout-widgets)
         * [Container](#container)
            * [Margin (For the ouside of the widget)](#margin-for-the-ouside-of-the-widget)
            * [Padding (For the inside of the widget)](#padding-for-the-inside-of-the-widget)
      * [multiple-child layout widgets](#multiple-child-layout-widgets)
         * [Column](#column)
      * [Scroll widget](#scroll-widget)
      * [Other](#other)
         * [Fonts](#fonts)
         * [Icons](#icons)
         * [Pallete](#pallete)
      * [Variables in Dart](#variables-in-dart)
      * [The correct file structure in flutter app](#the-correct-file-structure-in-flutter-app)
      * [Widget resource](#widget-resource)
      * [Hotkeys](#hotkeys)
         * [Boiler plate](#boiler-plate)
      * [Widget lifecycle](#widget-lifecycle)
         * [Stateless widget](#stateless-widget)
         * [Stateful widget](#stateful-widget)
         * [Setting state](#setting-state)
         * [Useful](#useful)
      * [Exceptions](#exceptions)
         * [Try and Catch block](#try-and-catch-block)
      * [Emulator](#emulator)
         * [Permissions](#permissions)
      * [Navigation](#navigation)
      * [Setting up RTL](#setting-up-rtl)
      * [Styled text with Flutter](#styled-text-with-flutter)
      * [Scaffold in details](#scaffold-in-details)
      * [Buttons](#buttons)
      * [Basic commands in flutter cli](#basic-commands-in-flutter-cli)
      * [Nice sites:](#nice-sites)

<!-- Added by: gil_diy, at: 2020-05-22T21:14+03:00 -->

<!--te-->

# Flutter

## include packages:

in the `pubspec.yaml`

holds the dependencies of your project.

The actual packages are located and installed in:
`./External Libraries/Flutter Plugins`

## Project hierarchy:

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/labeling_example.png" title="tool tip here">
</p>

## Remove debug banner

`debugShowCheckedModeBanner: false`


## Layout in flutter

[Link](https://flutter.dev/docs/development/ui/layout)

## Modify Launcher Icon in Flutter

To modify the icon of the app change the images (per resolution) in the following path:
For Android the relevant path is: `./android/app/src/main/res`
For IOS the relevant path is: `./ios/Runner/Assets.xcassets/AppIcon.appiconset`


## Useful widgets

### Widgets for layout
Widget name | Description | Link to youtube
------------|-------------|-----------------
SafeArea | Make sure your text/photo not gets cropped | [Link](https://www.youtube.com/watch?v=lkF0TQJO0bA&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=2)
SliverAppBar |  | [Link](https://www.youtube.com/watch?v=R9C5KMJKluE&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=12)
FadeInImage | | [Link](https://www.youtube.com/watch?v=pK738Pg9cxc&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=14)
ClipRRect | round the corners on a box of content in your app | [Link](https://www.youtube.com/watch?v=eI43jkQkrvs&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=17)
Tooltip | Adding Tooltip | [Link](https://www.youtube.com/watch?v=EeEfD5fI-5Q&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=20)
Transform | Adding 3d effect | [Link](https://www.youtube.com/watch?v=9z_YNlRlWfA&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=24)
Align | The widget lets you place a widget in a defined area of its parent widget | [Link](https://www.youtube.com/watch?v=g2E7yl3MwMk&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=26)
Positioned | The widget to position Flutter widgets in a Stack | [Link](https://www.youtube.com/watch?v=EgtPleVwxBQ&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=27)
Spacer | The Spacer widget can help you control how much space appears between widgets in a Row or Column | [Link](https://www.youtube.com/watch?v=7FJgd7QN1zI)
Flexible | Flexible for resizing your widgets in rows and columns | [Link](https://www.youtube.com/watch?v=CI7x0mAZiY0&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=34)
| |
[Link](https://www.youtube.com/watch?v=zNZvuP8h1vs)
ShaderMask | ShaderMasks let you apply a shader to one or more widgets in the tree | [Link](https://www.youtube.com/watch?v=7sUL66pTQ7Q&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=71)
Image| Use the Image widget to render an image to the screen, wherever it may come from: assets, network, file system, RAM  | [Link](https://www.youtube.com/watch?v=7oIAs-0G4mw&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=66)
Stack| Stack allows you to overlay multiple widgets on top of each other | [Link](https://www.youtube.com/watch?v=liEGSeD3Zt8)
LimitedBox | The LimitedBox widget provides size constraints to widgets in cases where their dimensions are unbounded (Row, Column) | [Link](https://www.youtube.com/watch?v=uVki2CIzBTs)
AlertDialog |Show Alert Dialog |[Link](https://www.youtube.com/watch?v=75CsnyRXf5I)

### Typography Widgets

Widget name | Description | Link to youtube
------------|-------------|---------------
RichText| Show a line or paragraph that combines multiple styles|[Link](https://www.youtube.com/watch?v=rykDVh-QFfw&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=42)
SelectableText | Select your text | [Link](https://www.youtube.com/watch?v=ZSU3ZXOs6hc&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=56)


### Button Widgets
Widget name | Description | Link to youtube
------------|-------------|---------------
ToggleButtons | | [Link](https://www.youtube.com/watch?v=kVEguaQWGAY)
Switch | |

### Animation Widgets

#### Implicit Animations Widgets

[Reference](https://youtu.be/IVTjpW3W33s)

Widget name | Description | Link to youtube
------------|-------------|---------------
AnimatedAlign | element-description | 
AnimatedContainer | element-description | 
AnimatedDefaultTextStyl | element-description | 
AnimatedDefaultOpacity | element-description | 
AnimatedPhysicalModel | element-description | 
AnimatedPhysicalModel | element-description | 
AnimatedPositioned | AnimatedPositioned automatically transitions the child's position over a given duration whenever the given position changes| [Link](https://www.youtube.com/watch?v=hC3s2YdtWt8&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=45)
AnimatedPositionedDirectional |element-description |AnimatedThemeSize |element-description |

#### Other Animations Widgets
Widget name | Description | Link to youtube
------------|-------------|---------------
AnimatedBuilder| Add animation | [Link](https://www.youtube.com/watch?v=N-RiyZlv8v8&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=28)
AnimatedList| You can use it to animate your lists when inserting or removing items. |[Link](https://www.youtube.com/watch?v=ZtfItHwFlZ8&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=33)
AnimatedIcon | AnimatedIcon widget to drop an animated icon straight into your app | [Link](https://www.youtube.com/watch?v=pJcbh8pbvJs&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=38)
AnimatedSwitcher | AnimatedSwitcher widget allows you to switch between two or more widgets with an animation as you transition | [Link](https://www.youtube.com/watch?v=2W7POjFb88g&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=44)
AnimatedPadding | AnimatedPadding is a great way to provide smooth buffers and spaces between widgets and screen borders | [Link](https://www.youtube.com/watch?v=PY2m0fhGNz4&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=46)
AnimatedCrossFade | Cross fade is a cinematic term in which one thing gradually fades into another | [Link](https://www.youtube.com/watch?v=PGK2UUAyE54&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=60)



### Dialog Widgets

Widget name | Description | Link to youtube
------------|-------------|---------------
AlertDialog | to alert someone about something or maybe get their input? | [Link](https://www.youtube.com/watch?v=75CsnyRXf5I&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=59)

### Events Widgets
Widget name | Description | Link to youtube
------------|-------------|---------------
Dismissible |  The widget can be used to clear list items by swiping left or right | [Link](https://www.youtube.com/watch?v=iEMgjrfuc58&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=29)
Draggable | Draggable to move and drag your widgets around | [Link](https://www.youtube.com/watch?v=QzA4c4QHZCY&list=PLjxrf2q8roU23XGwz3Km7sQZFTdB996iG&index=32)




[Link to widgets ](https://medium.com/flutter-community/flutter-basic-widgets-349e24140453)

### Layout widget

[Very nice layout explained](https://medium.com/flutter-community/breaking-layouts-in-rows-and-columns-in-flutter-8ea1ce4c1316)

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
Column | [Link](https://medium.com/jlouage/flutter-row-column-cheat-sheet-78c38d242041)
Row | [Link](https://medium.com/jlouage/flutter-row-column-cheat-sheet-78c38d242041)
CircleAvatar | For profile page
FlatButton |
SingleChildScrollView |
ListView |
Expanded |
SizedBox(height: 30)


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

## Scroll widget

## Other
### Fonts
[Hebrew Fonts](https://fonts.google.com/?subset=hebrew)

### Icons
[Material Design Icons](https://material.io/resources/icons/?style=baseline)
[Material Design Icons](https://feathericons.com)

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




## Hotkeys

[Very useful for developing IDEA](https://medium.com/flutter-community/flutter-ide-shortcuts-for-faster-development-2ef45c51085b)

Shortcut | Description
------------|-----
`Ctrl+Shift I` | Get info about a widget without moving a to another file
`Ctrl + w` | Just click on the widget you want to extract and press Ctrl+W
 | The entire Widget is selected for you without your cursor moving an inch

### Boiler plate
Shortcut | Description
------------|-----
`stless` | stateless widget - boiler plate for stateless widget
`stful` | stateful widget - boiler plate for stateful widget


## Widget lifecycle 

### Stateless widget

### Stateful widget

We can tap into each of these stages in the lifecycle if we wanted different things to happen at various times. I have listed here three common hooks which gets called in the following order:

* **initState()** - Gets triggered when that state initally gets initialized (gets called only once)

```bash
@override
void initState(){
  super.initState();
  print('initState was called.');
}
```

* **build()** - which gets triggered when the widgets are actually built and will show up on screen. the build is the most freuqent used hook. gets called every single time that our widgets rebuilds.

* **deactivate()** -  which gets called when that statefull widget gets destroyed and for deallocate from memory.
```bash
@override
void deactivate(){
  super.deactivate();
  print('deactivate called');
}
```

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


## Exceptions

### Try and Catch block

Example below:

```bash
Widget build(BuildContext context){
  String myMargin = 'abc';
  double myMarginAsADouble;

  try {
    double myMarginAsADouble = double.parse(myMargin);
  } catch (e){
    print(e);
    myMarginAsADouble = 30;
  }  

  return Scaffold(
      body: Container(
        margin: EdgeInsets.all(myMarginAsADouble),
        color: Colors.red;
        ),
      );
}

```
### Throw an exception
In the try we will call a function,
if the function will fail the actual function will throw an exception which be caught by 
the catch block.

```bash
void somethingThatExpectsLessThan10(int n){
  if (n > 10){
    throw 'n is greater than 10, n should always be less than 10';
  }
}
```


## Emulator

```bash
flutter emulators --launch sim
```

**List all emulators:**

```bash
avdmanager list avd
```

[Great Reference](https://developer.android.com/studio/run/emulator-commandline)

### Permissions

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

```bash
onPressed:(){
  Navigator.pop(context);
}
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