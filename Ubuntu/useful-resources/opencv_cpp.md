<!--ts-->
   * [color](#color)
         * [Bounding recangle](#bounding-recangle)
         * [Find contours](#find-contours)
         * [sort Contours by area](#sort-contours-by-area)
         * [Create black img](#create-black-img)
         * [Dialation](#dialation)
         * [Adaptive threshold](#adaptive-threshold)
         * [All white](#all-white)

<!-- Added by: gil_diy, at: Wed 16 Jun 2021 11:57:07 IDT -->

<!--te-->


# color 
```cpp
Scalar color = Scalar(255, 0, 0);
```

### Bounding recangle
```cpp
Rect actual_piano_rect;
actual_piano_rect = boundingRect(actual_piano_cnt);
```

### Find contours

```cpp
findContours(out, contours, hierarchy, RETR_EXTERNAL, CHAIN_APPROX_NONE);
```

### sort Contours by area
```cpp
    sort(contours.begin(), contours.end(), [](const vector<Point> &c1, const vector<Point> &c2) {
        return contourArea(c1, false) > contourArea(c2, false);
    });
```

### Create black img

```cpp
mask = Mat::zeros(img_gray.size(), img_gray.type());
or 
out1 = cv::Mat::zeros(frame.size(), CV_8U);
```

### Dialation 

```cpp
kernel_size = 5;
// TODO: CV_32F Not sure
kernel = Mat::ones(kernel_size, kernel_size, CV_32F);
// TODO: CV_32F Not sure Point(-1,-1)
dilate(thr_img, dilation, kernel, Point(-1, -1), 2);
```

### Adaptive threshold
```cpp
adaptiveThreshold(img_gray, thr_img, 255, ADAPTIVE_THRESH_MEAN_C, THRESH_BINARY_INV, 63, 2);
```

### All white

```cpp
Mat all_white(img_gray.size(), CV_8UC1, Scalar(255));
