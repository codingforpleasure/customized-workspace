<!--ts-->
   * [adb (Android Debug Bridge)](#adb-android-debug-bridge)
      * [List all devices attached](#list-all-devices-attached)
      * [Where the Images directory of camera is mounted?](#where-the-images-directory-of-camera-is-mounted)
      * [Connect with shell](#connect-with-shell)
      * [Copy from device to your local pc](#copy-from-device-to-your-local-pc)
      * [To copy a file or directory and its sub-directories to the device:](#to-copy-a-file-or-directory-and-its-sub-directories-to-the-device)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: Thu 06 Jan 2022 17:57:40 IST -->

<!--te-->

# adb (Android Debug Bridge)


## List all devices attached

```bash
adb devices
```

## Where the Images directory of camera is mounted?



```bash
/storage/self/primary/DCIM/Camera
```

## Connect with shell
```bash
adb shell
```

## Copy from device to your local pc

```bash
adb pull sdcard/log.txt /home/mmurphy/Desktop
```

## To copy a file or directory and its sub-directories to the device:
```bash
adb push local remote
```



## Reference
[ADB reference](https://developer.android.com/studio/command-line/adb)
