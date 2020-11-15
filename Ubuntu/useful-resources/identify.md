<!--ts-->
   * [Identify](#identify)
      * [Filter images by size:](#filter-images-by-size)
      * [Useful info](#useful-info)

<!-- Added by: gil_diy, at: Sun Nov 15 17:36:31 IST 2020 -->

<!--te-->

# Identify


## Filter images by size:


```bash
find . -iname "*.jpg" -type f -exec identify -format '%w %h %i\n' '{}' \; | awk '$1>300 && $2>300'
```

Output will be:
```bash
412 305 ./output_2k_frame00001300.jpg
411 306 ./output_2k_frame00001301.jpg
423 312 ./output_2k_frame00001304.jpg
407 304 ./output_2k_frame00001299.jpg
```

## Useful info

[Link](https://imagemagick.org/script/identify.php)