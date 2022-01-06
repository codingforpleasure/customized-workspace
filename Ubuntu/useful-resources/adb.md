<!--ts-->
   * [adb (Android Debug Bridge)](#adb-android-debug-bridge)
      * [List all devices attached](#list-all-devices-attached)
      * [Connect with shell](#connect-with-shell)
      * [Where the Images directory of camera is mounted?](#where-the-images-directory-of-camera-is-mounted)
      * [Copy from device to your local pc](#copy-from-device-to-your-local-pc)
      * [To copy a file or directory and its sub-directories to the device:](#to-copy-a-file-or-directory-and-its-sub-directories-to-the-device)
      * [Reference](#reference)

<!-- Added by: gil_diy, at: Thu 06 Jan 2022 17:59:46 IST -->

<!--te-->

# adb (Android Debug Bridge)


## List all devices attached

```bash
adb devices
```

## Connect with shell
```bash
adb shell
```

## Where the Images directory of camera is mounted?

On the smartphone:
```bash
internal_storage/DCIM/Camera/IMG_20220106_170542.jpg
```

mapped to in adb shell:

```bash
/storage/self/primary/DCIM/Camera
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
