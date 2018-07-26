<!--ts-->
   * [Tips for Android UI](#tips-for-android-ui)
      * [Unit of measurments:](#unit-of-measurments)
      * [<strong>Fixed units of measurement</strong>](#fixed-units-of-measurement)
   * [Tips for Android Debugging and Diagnosing app crashes](#tips-for-android-debugging-and-diagnosing-app-crashes)
      * [Methods of resolving crashes:](#methods-of-resolving-crashes)
         * [Method #1:](#method-1)
         * [Method #2:](#method-2)

<!-- Added by: gil_diy, at: 2018-07-26T16:28+03:00 -->
<!--te-->

# Tips for Android UI

## Unit of measurments:
* dp = Device-Independent pixel&nbsp;

They are used to set position and size of containers and widgets
Ratio of dp-to-pixel changes with the screen density, all done by the android framework.

* sp = Scale-Independent Pixels
Similiar to dp but used to specify font sizes

Dimenstions can be hard-coded in XML layout.

## Fixed units of measurement
* px (pixel):regardless of device resolution or density&nbsp;

* pt (point): 1/72 of an inch&nbsp;

* mm (millimeter): based on physical size of screen&nbsp;

* in (inch): based pn physical size of screen&nbsp;

**Fixed units don't adjust to differet devices! so you should not use it**

# Tips for Android Debugging and Diagnosing app crashes
## Methods of resolving crashes:

### Method #1:

Request alternate ring buffer via:
`adb logcat -b crash`

- [x] main
- [x] system
- [x] radio
- [x] events
- [x] crash
- [x] all

Multiple -b parameters are allowed and results are interleaved.
The default is -b main -b system -b crash.

for clearing/flushing the log buffer enter use:
`adb logcat -c`


### Method #2:
Nicely written resource here:
https://developer.android.com/topic/performance/vitals/crash
