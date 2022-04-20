<!--ts-->
   * [How to set opencv with flutter project??](#how-to-set-opencv-with-flutter-project)

<!-- Added by: gil_diy, at: Thu 10 Jun 2021 15:20:20 IDT -->

<!--te-->

# How to set opencv with flutter project??

**Step 1:** 

Download and extract the openCV sdk for android

**Step 2:** 

```bash
cp -R sdk/native/jni/include <project_root>
mkdir <project_root>/android/src/main/jniLibs
cp -R sdk/native/libs/* <project_root>/android/src/main/jniLibs
```

**Step 3:** 

Now we need to tell Gradle to build the app in the way that the C++ code we are going to write is accessible from the Dart context as a library. therefore we edit the file `<project_root>/android/build.gradle`

The most import part is within `externalNativeBuild` because it tells Gradle where the `CMakeLists` is located. This file has build instructions that link our code with OpenCV.

```bash
android {
    compileSdkVersion 28

    sourceSets {
        main.java.srcDirs += 'src/main/kotlin'
    }
    defaultConfig {
        minSdkVersion 16
    }
    lintOptions {
        disable 'InvalidPackage'
    }
    externalNativeBuild {
        cmake {
            path "CMakeLists.txt"
        }
    }
    defaultConfig {
        externalNativeBuild {
            cmake {
                cppFlags '-frtti -fexceptions -std=c++11'
                arguments "-DANDROID_STL=c++_shared"
            }
        }
    }
}
```

**Step 4:** 

Now we need to create the `<project_root>/android/CMakeLists.txt` we have just referenced.

We mainly link our sources with the OpenCV library here and make it a library that can be called from our Dart code.

```bash
cmake_minimum_required(VERSION 3.6.0)
include_directories(../include) # important
add_library(lib_opencv SHARED IMPORTED)
set_target_properties(lib_opencv PROPERTIES IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/src/main/jniLibs/${ANDROID_ABI}/libopencv_java4.so)
set(EDGE_DETECTION_DIR "../ios/Classes")
set(SOURCES
    ${EDGE_DETECTION_DIR}/native_edge_detection.cpp
    ${EDGE_DETECTION_DIR}/edge_detector.cpp
)
add_library(native_edge_detection SHARED ${SOURCES})
target_link_libraries(native_edge_detection lib_opencv)
```

You might stumble across set(EDGE_DETECTION_DIR "../ios/Classes") and ask yourself why the ios directory in the cmake file for the Android targets. We need to put our C/C++ sources there because we’ll be using CocoaPods (the packet manager of the iOS App ecosystem). CocoaPods can only reference source code from directories at the same level of the .podspec file or below. Looks a little bit hacky because the code base is used for both platforms but the Android build system is a little bit more tolerant in this regard and we can reference the sources within the ios folder from here. 