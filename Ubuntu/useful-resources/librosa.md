# librosa

## Downsmapling
```python
import librosa
import soundfile as sf

if __name__ == '__main__':
    y, sr = librosa.load('/home/gil/my_audio_files/english_filler_words.mp3', sr=48000)
    y_16k = librosa.resample(y, orig_sr=sr, target_sr=16000)
    sf.write('/home/gil/output/output.wav', y_16k, samplerate=16000)
```