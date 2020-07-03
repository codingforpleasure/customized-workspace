
<!--ts-->
   * [ffmpeg](#ffmpeg)
      * [Get information about a video file (fps, codec, duration)](#get-information-about-a-video-file-fps-codec-duration)
      * [Export a snapshot from a video clip in specific timestamp.](#export-a-snapshot-from-a-video-clip-in-specific-timestamp)
      * [Export MP4 from a list of images](#export-mp4-from-a-list-of-images)
      * [Rip a part a video and get all images out of it](#rip-a-part-a-video-and-get-all-images-out-of-it)
      * [Convert from webm to mp4](#convert-from-webm-to-mp4)
      * [Trim video file](#trim-video-file)
      * [Increase video speed](#increase-video-speed)
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
         * [Fade in](#fade-in)
         * [Fade out](#fade-out)
      * [Filters for Audio files](#filters-for-audio-files)
         * [Generate video with waveform](#generate-video-with-waveform)
      * [Documentation](#documentation)

<!-- Added by: gil_diy, at: 2020-06-23T17:55+03:00 -->

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

## Export MP4 from a list of images

 Symbol | meaning
------------|-----
 -i | input file
 -r | rate (i.e 30 fps)
 -ss | duration in seconds


```bash
ffmpeg -r 30 -i /path/image-%d.png -vcode mpeg4 -y ~/Desktop/output.mp4
```

[Reference](https://youtu.be/cqw4HgC3CIc)

## Rip a part a video and get all images out of it

```bash
ffmpeg -i play.mov -qscale:v 3 ~/frames/frame-%d.jpg -hide_banner
```


## Convert from webm to mp4
```bash

ffmpeg -i natash.webm -strict experimental To_my_Natasha.mp4
```

## Trim video file
```bash
ffmpeg -i source.mp4 -ss 00:00:05 -t 00:00:10 -async 1 -strict -2 cut_video.mp4
```

## Increase video speed

```bash
ffmpeg -i input.mp4 -filter:v "setpts=PTS/60" output.mp4
```
## Specifying Quality

### For AVI

```bash
ffmpeg -i <input name> -qscale <quality> <output name>
```

### For MP4

```bash
ffmpeg -i <input name> -crf <quality> <output name>
```


## To specify exact Bitrates

Symbol | meaning
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


### Fade in
```bash
ffmpeg -i input_video_file.mp4 -vf "fade=t=in:st=0:d=3" -c:a copy output_video_file.mp4
```
Symbol | Meaning
------------|-----
 st | Start timestamp
 d  | Duration

### Fade out

This will make the video start fading to black over 5 seconds at the 10 second mark.

```bash
ffmpeg -i video.mp4 -vf "fade=t=out:st=10:d=5" -c:a copy out.mp4
```


## Filters for Audio files

### Generate video with waveform

```bash
ffmpeg -i input.mp3 -filter_complex "mode=line" output.avi
```

[Reference](https://youtu.be/M58rc7cxl_s?list=PLJse9iV6Reqiy8wP0rXTgFQkMNutRMN0j&t=565) 

## Documentation

[ffmpeg official documentation](https://www.ffmpeg.org/ffmpeg.html)

[Useful commands](https://gist.github.com/martinruenz/537b6b2d3b1f818d500099dde0a38c5f)

[conversions between gif and video](https://engineering.giphy.com/how-to-make-gifs-with-ffmpeg/)