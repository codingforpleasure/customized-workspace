
<!--ts-->
   * [ffmpeg](#ffmpeg)
      * [Export a snapshot from a video clip in specific timestamp.](#export-a-snapshot-from-a-video-clip-in-specific-timestamp)

<!-- Added by: gil_diy, at: 2020-03-25T00:12+02:00 -->

<!--te-->


# ffmpeg


## Export a snapshot from a video clip in specific timestamp.
ffmpeg -i <input_file> -ss 01:23:45 -vframes 1 output.jpg
