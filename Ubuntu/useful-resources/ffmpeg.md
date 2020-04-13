
<!--ts-->
   * [ffmpeg](#ffmpeg)
      * [Get information about a video file (fps, codec, duration)](#get-information-about-a-video-file-fps-codec-duration)
      * [Export a snapshot from a video clip in specific timestamp.](#export-a-snapshot-from-a-video-clip-in-specific-timestamp)
      * [Convert from webm to mp4](#convert-from-webm-to-mp4)

<!-- Added by: gil_diy, at: 2020-04-13T10:11+03:00 -->

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
