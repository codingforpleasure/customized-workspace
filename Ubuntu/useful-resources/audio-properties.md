<!--ts-->
   * [Signal](#signal)
   * [The Fourier Transform](#the-fourier-transform)
* [What is Mel spectogram?](#what-is-mel-spectogram)
* [Mel-Frequency Cepstral Coefficients Explained Easily](#mel-frequency-cepstral-coefficients-explained-easily)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sat 01 Apr 2023 03:39:09 PM IDT -->

<!--te-->



[understanding-the-mel-spectrogram](https://medium.com/analytics-vidhya/understanding-the-mel-spectrogram-fca2afa2ce53)


## Signal


<p align="center">
  <img width="600" src="/home/gil_diy/customized-workspace/Ubuntu/useful-resources/images/audio/Signal.png" title="Look into the image">
</p>


## The Fourier Transform

* An audio signal is comprised of several single-frequency sound waves.

* When taking samples of the signal over time, we only capture the resulting amplitudes. 

* The Fourier transform is a mathematical formula that allows us to decompose a signal into it’s individual frequencies and the frequency’s amplitude. 

* In other words, it converts the signal from the time domain into the frequency domain. The result is called a spectrum.

<p align="center">
  <img width="400" src="/home/gil_diy/customized-workspace/Ubuntu/useful-resources/images/audio/fourier_transform.jpg" title="Look into the image">
</p>


* This is possible because every signal can be decomposed into a set of sine and cosine waves that add up to the original signal. 

* This is a remarkable theorem known as Fourier’s theorem.


<p align="center">
  <img width="400" src="/home/gil_diy/customized-workspace/Ubuntu/useful-resources/images/audio/Spectogram.png" title="Look into the image">
</p>


* These signals are known as non periodic signals. We need a way to represent the spectrum of these signals as they vary over time.
* You may be thinking, “hey, can’t we compute several spectrums by performing FFT on several windowed segments of the signal?” This is exactly what is done, and it is called the **short-time Fourier transform**

* The FFT is computed on overlapping windowed segments of the signal, and we get what is called the spectrogram.

* A good visual is in order:


<p align="center">
  <img width="400" src="/home/gil_diy/customized-workspace/Ubuntu/useful-resources/images/audio/short_time_Fourier_transform.jpg" title="Look into the image">
</p>


* You can think of a spectrogram as a bunch of FFTs stacked on top of each other. It is a way to visually represent a signal’s loudness, or amplitude, as it varies over time at different frequencies. 

* There are some additional details going on behind the scenes when computing the spectrogram


*  The y-axis is converted to a log scale, and the color dimension is converted to decibels (you can think of this as the log scale of the amplitude).



```python
import numpy as np
import matplotlib.pyplot as plt
import librosa

if __name__ == '__main__':
    y, sr = librosa.load(librosa.ex('trumpet'))
    D = librosa.stft(y)  # STFT (short-time Fourier transform) of y
    S_db = librosa.amplitude_to_db(np.abs(D), ref=np.max)

    fig, ax = plt.subplots()
    img = librosa.display.specshow(S_db, x_axis='time', y_axis='linear', ax=ax)
    ax.set(title='Now with labeled axes!')
    fig.colorbar(img, ax=ax, format="%+2.f dB")
    plt.show()
```


# What is Mel spectogram?




# Mel-Frequency Cepstral Coefficients Explained Easily