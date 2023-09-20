# librosa

- [librosa](#librosa)
  - [Downsmapling](#downsmapling)
  - [Trim](#trim)
  - [Get length in seconds](#get-length-in-seconds)
  - [Split Audio file](#split-audio-file)


## Downsmapling
```python
import librosa
import soundfile as sf

if __name__ == '__main__':
    y, sr = librosa.load('/home/gil/my_audio_files/english_filler_words.mp3', sr=48000)
    y_16k = librosa.resample(y, orig_sr=sr, target_sr=16000)
    sf.write('/home/gil/output/output.wav', y_16k, samplerate=16000)
```

## Trim
```python
y, sr = librosa.load(librosa.util.example_audio_file(),
                    duration=5.0)
librosa.output.write_wav('file_trim_5s.wav', y, sr)
```

## Get length in seconds
```python
duration_in_seconds = librosa.get_duration(path='/home/gil/music.wav')
print(f'Duration in seconds: {duration_in_seconds} seconds')
```

## Split Audio file

```python
    x, sr = librosa.load('/home/gil/downloads/words.wav')
    # print(x.shape, sr)
    sections = librosa.effects.split(x)
    dir_output = '/home/gil/downloads/collection_of_words'
    for idx, section in enumerate(sections):
        out_filename = f'audio_{idx}.wav'
        full_path = os.path.join(dir_output, out_filename)
        sf.write(full_path, x[section[0]:section[1]], sr)
```