# Moviepy

## Load a video 

```python
from moviepy.editor import *
c = VideoClip('/home/gil/Desktop/my_clip.mp4')
```


## Take part of a video
```python
c = VideoClip('/home/gil/Desktop/my_clip.mp4').subclip(10,20)
```

## Export a mp4 file

```python
from moviepy.editor import *
c = VideoClip('/home/gil/Desktop/my_clip.mp4'.subclip(10,20)

c.write_videofile(filename='output.mp4') # Exporting here
```

## Put some text on a clip

```python
text = TextClip("This is may text example", fontsize = 10, color = 'red').set_position(('left','top')).set_duration(10)

final = CompositeVideoClip((c,text))
```

## Stiching two clips one next to the other

```python
c = VideoFileClip('/home/gil/PycharmProjects/whisperX_exploration/videos/Oddly_Satisfying_Video.mp4')
video_clip1 = c.subclip(t_start=0, t_end=10)
video_clip2 = c.subclip(t_start=10, t_end=20)

d = clips_array([[video_clip1, video_clip2]])
d.write_videofile(filename='output.mp4')
```