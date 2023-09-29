# yt-dlp


## Get audio file

--audio-format FORMAT           Format to convert the audio to when -x is
                                used. (currently supported: best (default),
                                aac, alac, flac, m4a, mp3, opus, vorbis,
                                wav). You can specify multiple rules using
                                similar syntax as --remux-video

```python
yt-dlp https://youtu.be/kxf_bPMxvVY --extract-audio --audio-format wav
```


## Filter youtube before downloading given a constraint

```python
import yt_dlp

URLS = ['https://www.youtube.com/watch?v=BaW_jenozKc']
THRESHOLD = 5


def shorter_than_threshold(info, *, incomplete):
    """Download only videos longer than a minute (or with unknown duration)"""
    duration = info.get('duration')
    if duration and duration > THRESHOLD:
        # will not download the video and show the following message:
        return 'The video is too long'


if __name__ == '__main__':
    ydl_opts = {
        'match_filter': shorter_than_threshold,
    }

    with yt_dlp.YoutubeDL(ydl_opts) as ydl:
        error_code = ydl.download(URLS)
```