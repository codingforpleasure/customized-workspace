
<!--ts-->
* [ffmpeg](#ffmpeg)
   * [Get information about a video file (fps, codec, duration)](#get-information-about-a-video-file-fps-codec-duration)
   * [Well known resolutions](#well-known-resolutions)
   * [Downsample 4k to 1080p](#downsample-4k-to-1080p)
   * [Downsample 4k to 2k](#downsample-4k-to-2k)
   * [Resize video](#resize-video)
   * [Stiching two videos one next to the other](#stiching-two-videos-one-next-to-the-other)
   * [Export all frames from a video clip](#export-all-frames-from-a-video-clip)
   * [Export a snapshot from a video clip in specific timestamp.](#export-a-snapshot-from-a-video-clip-in-specific-timestamp)
   * [Export a specific frame from a video clip given frame number](#export-a-specific-frame-from-a-video-clip-given-frame-number)
   * [Export MP4 from a list of images](#export-mp4-from-a-list-of-images)
   * [Rip a part a video and get all images out of it](#rip-a-part-a-video-and-get-all-images-out-of-it)
   * [Convert from webm to mp4](#convert-from-webm-to-mp4)
   * [Trim video file](#trim-video-file)
   * [Concatenate video files](#concatenate-video-files)
   * [Get information about video size](#get-information-about-video-size)
   * [Get all metadata about a video](#get-all-metadata-about-a-video)
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
      * [Flip video horizontally](#flip-video-horizontally)
      * [Flip video vertically](#flip-video-vertically)
      * [Fade in](#fade-in)
      * [Fade out](#fade-out)
      * [Convert to Raw YUV Video](#convert-to-raw-yuv-video)
      * [Convert from MKV to mp4](#convert-from-mkv-to-mp4)
   * [Filters for Audio files](#filters-for-audio-files)
      * [Extract audio file from video file (Pull audio track)](#extract-audio-file-from-video-file-pull-audio-track)
      * [Convert either m4a or mp3  to WAV file](#convert-either-m4a-or-mp3--to-wav-file)
      * [Generate video with waveform](#generate-video-with-waveform)
      * [Split an audio file into multiple files](#split-an-audio-file-into-multiple-files)
      * [Extend audio length](#extend-audio-length)
      * [Modify sample rate](#modify-sample-rate)
   * [Convert to gif](#convert-to-gif)
   * [Resizing animated gif's width/Height](#resizing-animated-gifs-widthheight)
   * [Make gif run once (no loops)](#make-gif-run-once-no-loops)
   * [Editing Gif](#editing-gif)
   * [Documentation](#documentation)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Thu 15 Dec 2022 10:55:01 IST -->

<!--te-->


# ffmpeg

## Get information about a video file (fps, codec, duration)

```bash
ffmpeg -i <input_file>
```

## Well known resolutions

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/ffmpeg/resolution.jpg" title="tool tip here">
</p>

 Resolution | Horizontal x Vertical pixels | Other names
------------|------------------------------|-----
 8K | 7,680x 4,320 | 8K UHD
 "Cinema" 4K | 4,096x(unspecified) | 4K
 UHD | 3,840x2,160  | 4K, Ultra HD, Ultra-High Definition
 2K | 2,048x[unspecified] | none
 WUXGA | 1,920x1,200 | Widescreen Ultra Extended Graphics Array
 1080p | 1,920x1,080 | Full HD,FHD, HD, High Definition
 720p | 1,280x720 | HD, High Definition


## Downsample 4k to 1080p 

```bash
ffmpeg -i orig.mp4 -vf scale=1920:1080 smaller.mp4 -c:v libx264 -crf 20 -preset slow
```

crf 20 uses the Constant Rate Factor quantiser (which paradoxially means variable bit rate, but constant quality) 
with a value of 20 (pretty good quality; lower is better quality / larger files, higher is crappier / smaller),

## Downsample 4k to 2k

```bash
ffmpeg -i 1.mov -vf scale=2048x1152:flags=lanczos output_2k.mp4
```

## Resize video

```bash
ffmpeg -i input.avi -vf scale=320:240 output.avi
```


## Stiching two videos one next to the other

```bash
ffmpeg \
  -i left_video.mp4 \
  -i right_video.mp4 \
  -filter_complex '[0:v]pad=iw*2:ih[int];[int][1:v]overlay=W/2:0[vid]' \
  -map '[vid]' \
  -c:v libx264 \
  -crf 23 \
  -preset veryfast \
  two_videos_output.mp4
```

## Export all frames from a video clip

```bash
fmpeg -i *.mp4 frame_%d.jpg
```

## Export a snapshot from a video clip in specific timestamp.
```bash
ffmpeg -i <input_file> -ss 01:23:45 -vframes 1 output.jpg
```

## Export a specific frame from a video clip given frame number

For example for frame number 35 (counting starts at 0), we will write:

```bash
ffmpeg -i <input_file> -vf "select=eq(n\,34)" -vframes 1 out.png
```

## Export MP4 from a list of images

 Symbol | meaning
------------|-----
 -i | input file
 -r | rate (i.e 30 fps)
 -ss | duration in seconds
 -to | end time stamp


```bash
ffmpeg -r 30 -i /path/image-%d.png -vcodec mpeg4 -y ~/Desktop/output.mp4
```

[Reference](https://youtu.be/cqw4HgC3CIc)

## Rip a part a video and get all images out of it

```bash
ffmpeg -i play.mov -qscale:v 3 ~/frames/frame-%d.jpg -hide_banner
```

-r - Set the frame rate. I.e the number of frames to be extracted into images per second. The default value is 25.


```bash
ffmpeg -i input.mp4 -r 1 -f image2 image-%2d.png
```

-f - Indicates the output format i.e image format in our case.


## Convert from webm to mp4
```bash

ffmpeg -i natash.webm -strict experimental To_my_Natasha.mp4
```

## Trim video file
```bash
ffmpeg -i source.mp4 -ss 00:00:05 -t 00:00:10 -async 1 -strict -2 cut_video.mp4
```

`-t = duration in seconds - the length of the video`
`-ss = cut from the specified timestamp`

## Concatenate video files

```bash
for f in *.mp4 ; do echo file \'$f\' >> fileList.txt;
```

and then run:

```bash
./ffmpeg -f concat -safe 0 -i fileList.txt -c copy mergedVideo.mp4
```


## Get information about video size

```bash
ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=s=x:p=0 input.mp4
```

## Get all metadata about a video

```bash
ffprobe -v quiet -print_format json -show_format -show_streams ~/Movies/big_buck_bunny_720p_5mb.mp4
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

[Link](https://www.linuxuprising.com/2020/01/ffmpeg-how-to-crop-videos-with-examples.html)

[video link](https://youtu.be/MPV7JXTWPWI?t=589)

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


### Flip video horizontally

```bash
 ffmpeg -i INPUT.mp4 -vf hflip -c:a copy OUTPUT.mp4
```

### Flip video vertically

```bash
 ffmpeg -i INPUT.mp4 -vf vflip -c:a copy OUTPUT.mp4
```

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


### Convert to Raw YUV Video

```bash
ffmpeg -i input_720x480p.avi -c:v rawvideo -pixel_format yuv420p output_720x480p.yuv
```

```bash
ffmpeg -i ~/Desktop/sample_video.mp4 -ss 00:00:20 -t 10 -s 720x480 -pix_fmt yuv420p video1.yuv
```

[Link](https://ottverse.com/ffmpeg-convert-avi-mp4-to-yuv-raw-playback-yuv-ffplay/)


### Convert from MKV to mp4

```bash
ffmpeg -i my_video.mkv -codec copy my_video.mp4
```

multiple files:

```bash
for f in *.mkv; do ffmpeg -i "$f" -c copy "${f%.mkv}.mp4"; done
```


## Filters for Audio files

### Extract audio file from video file (Pull audio track)

Get info about audio track embedded in the video file:

```bash
ffprobe <video_file.mp4>
```


```bash
ffmpeg -i <video_file.mp4> -vn -acodec copy soundtrack.m4a
```

### Convert either m4a or mp3  to WAV file

output WAV file containing signed 16-bit PCM samples. Your command is outputting raw PCM, not WAV.


```bash
ffmpeg -i input.mp4 output.wav
```

You can add -c:a pcm_s16le, but it's the default encoder for WAV so it can be omitted.

### Generate video with waveform

```bash
ffmpeg -i input.mp3 -filter_complex "mode=line" output.avi
```

[Reference](https://youtu.be/M58rc7cxl_s?list=PLJse9iV6Reqiy8wP0rXTgFQkMNutRMN0j&t=565) 


### Split an audio file into multiple files

```bash
ffmpeg -i somefile.mp3 -f segment -segment_time 3 -c copy out%03d.mp3
```

`-segment_time` is the amount of time you want per each file

### Extend audio length

Padding the end of the audio file, the extended part should be slient.

For example extending with 2 seconds
```bash
ffmpeg -i in.wav -af "apad=pad_dur=5" out.wav
```

### Modify sample rate 

16KHz - smaple rate

```bash
ffmpeg -i 111.mp3 -acodec pcm_s16le -ac 1 -ar 16000 out.wav
```

`-ac 1 for audio channel`


Python code:

```python
in_filename = os.path.join(dir_input, file_input)

out, _ = (ffmpeg
          .input(in_filename)
          .output(os.path.join(dir_input, 'output_new.wav'), acodec='pcm_s16le', ac=1, ar='16k')
          .run(capture_stdout=True, capture_stderr=True)
          )
```

## Convert to gif

```bash
ffmpeg  -i StickAround.mp4 -f gif StickAround.gif
```

## Resizing animated gif's width/Height

Resize animated file to 50%.

```bash
convert image_animation_1.gif -coalesce coalesce.gif
convert coalesce.gif -resize 50% output.gif
```

## Make gif run once (no loops)

```bash
ffmpeg -i input.gif -loop -1 output.gif
```

* `-1` no loop (plays once)
* `0` infinite loop (default)
* `1` loop once (plays 2 times)
* `2` loop twice (plays 3 times)


## Editing Gif

Use **Gifcurry**

Cropping gif screen (horizontal, Vertical) with gui

```bash
https://github.com/lettier/gifcurry
```



## Documentation

[ffmpeg official documentation](https://www.ffmpeg.org/ffmpeg.html)

[Useful commands](https://gist.github.com/martinruenz/537b6b2d3b1f818d500099dde0a38c5f)

[20+ FFmpeg Commands For Beginners](https://ostechnix.com/20-ffmpeg-commands-beginners/)

[conversions between gif and video](https://engineering.giphy.com/how-to-make-gifs-with-ffmpeg/)


[Impressive examples Python with ffmpeg](https://github.com/kkroening/ffmpeg-python/tree/master/examples)

[Impressive repo for video slideshows from images and videos](https://github.com/tanersener/ffmpeg-video-slideshow-scripts)