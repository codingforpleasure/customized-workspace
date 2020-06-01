
<!--ts-->
   * [ffmpeg](#ffmpeg)
      * [Get information about a video file (fps, codec, duration)](#get-information-about-a-video-file-fps-codec-duration)
      * [Export a snapshot from a video clip in specific timestamp.](#export-a-snapshot-from-a-video-clip-in-specific-timestamp)
      * [Convert from webm to mp4](#convert-from-webm-to-mp4)
      * [Specifying Quality](#specifying-quality)
         * [For AVI](#for-avi)
         * [For MP4](#for-mp4)
      * [To specify exact Bitrates](#to-specify-exact-bitrates)
         * [For AUDIO bitrate](#for-audio-bitrate)
         * [For VIDEO bitrate](#for-video-bitrate)
         * [Specify both audio and video bitrates](#specify-both-audio-and-video-bitrates)
      * [Selected filters](#selected-filters)
         * [Audio Volume](#audio-volume)
         * [Channel remapping](#channel-remapping)
         * [Crop video](#crop-video)
         * [Scaling with arithmetic &amp; variables:](#scaling-with-arithmetic--variables)
         * [Proportional scaling](#proportional-scaling)
         * [Rotation](#rotation)

<!-- Added by: gil_diy, at: 2020-06-01T18:30+03:00 -->

<!--te-->


# ffmpeg

## Get information about a video file (fps, codec, duration)

```bash
ffmpeg -i <input_file>
```


## Export a snapshot from a video clip in specific timestamp.
```bash
ffmpeg -i <input_file> -ss 01:23:45 -vframes 1 output.jpg
```


## Convert from webm to mp4
```bash

ffmpeg -i natash.webm -strict experimental To_my_Natasha.mp4
```

## Specifying Quality

### For AVI

```bash
ffmpeg -i <input name> -q <quality> <output name>
```

### For MP4

```bash
ffmpeg -i <input name> -crf <quality> <output name>
```


## To specify exact Bitrates

 symbol | meaning
------------|-----
-b | bitrate
v | video
a | audio


### For AUDIO bitrate

```bash
ffmpeg -i <input name> -b:a <bitrate> <output name>
```	

i.e:

```bash
ffmpeg -i inFile.mp3 -b:a 320k outfile.mp3
```

### For VIDEO bitrate

```bash
ffmpeg -i inFile.avi -b:v 1000k outfile.mp4
```


### Specify both audio and video bitrates

```bash
ffmpeg -i inFile.avi -b:v 1000k -b:a 128k outFile.mp4
```


## Selected filters

### Audio Volume

```bash
ffmpeg -i in.mp4 -filter:a "volume=2" out.mp4
```

The `volume=2` means the output will be higher by multiplying by 2 the volume.

### Channel remapping

### Crop video

```bash
ffmpeg -i in.mp4 -filter:v "crop=w=<width>:h=<height>:x=<x top left corner>:y=<y top left corner>" out.mp4
```

[Link](https://youtu.be/MPV7JXTWPWI?t=589)

### Scaling with arithmetic & variables:
```bash
ffmpeg -i inFile -filter:v "scale=2/3*in_w:h=2/3*in_h" outfile
```

### Proportional scaling 

```bash
ffmpeg -i inFile:v -filter:v  "scale=w=852:h=-1" outfile
```

### Rotation

```bash
ffmpeg -i inFile:v -filter:v  "rotate=45*PI/180" outfile
```

* Angle of rotation, clockwise (with conversion to radians)