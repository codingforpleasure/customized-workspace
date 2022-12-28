<!--ts-->
* [Tesseract](#tesseract)
   * [Compiling tesseract from source:](#compiling-tesseract-from-source)
      * [Additional libraries required](#additional-libraries-required)
      * [Building source](#building-source)
   * [Creating training data](#creating-training-data)
      * [Important libraries](#important-libraries)
      * [Tesseract configurations](#tesseract-configurations)
      * [Page segmentation modes](#page-segmentation-modes)
      * [OCR Engine mode](#ocr-engine-mode)
         * [Detect orientation and text (script)](#detect-orientation-and-text-script)
         * [Detect only digits](#detect-only-digits)
         * [Whitelisting characters](#whitelisting-characters)
         * [Blacklisting characters](#blacklisting-characters)
         * [Specify the language](#specify-the-language)
         * [Some tips with image processing (important)](#some-tips-with-image-processing-important)
   * [Installing tesseract NOT from source, from ubuntu repositories:](#installing-tesseract-not-from-source-from-ubuntu-repositories)
   * [Tesseract Dec-2022](#tesseract-dec-2022)
* [Reference](#reference)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Wed 28 Dec 2022 12:14:22 IST -->

<!--te-->

# Tesseract

[Documentation](https://github.com/tesseract-ocr/tessdoc)

[TrainingTesseract-4.00](https://github.com/tesseract-ocr/tessdoc/blob/master/TrainingTesseract-4.00.md)

[Reference on Medium](https://medium.com/@isurianuradha96/training-sinhala-language-with-tesseract-4-1-version-3cd96ce84b6a)

## Compiling tesseract from source:

### Additional libraries required

As mentioned [here](https://github.com/tesseract-ocr/tessdoc/blob/master/TrainingTesseract-4.00.md#additional-libraries-required), install the essential libraries:

```bash
sudo apt-get install libicu-dev libpango1.0-dev libcairo2-dev libtiff5-dev libpng-dev libtiff5-dev libwebp-dev libopenjp2-7-dev libgif-dev
```


### Building source 
After you have installed the additional libraries, run:

1. 
```bash
./autogen.sh
```

2. Now, afterwards you can run:

```bash
./configure
```
3. Now, afterwards you can run:
```bash
make
```
4. Now, afterwards you can run:
```bash
make training
```
5. Installing the actual training tools on your system:
????????? Not sure if lib located correctly

libtool: warning: '../../libtesseract.la' has not been installed in '/usr/local/lib'                                                                          [41/11129]
libtool: install: /usr/bin/install -c .libs/merge_unicharsets /usr/local/bin/merge_unicharsets
libtool: warning: '../../libtesseract.la' has not been installed in '/usr/local/lib'
libtool: install: /usr/bin/install -c .libs/set_unicharset_properties /usr/local/bin/set_unicharset_properties
libtool: warning: '../../libtesseract.la' has not been installed in '/usr/local/lib'
libtool: install: /usr/bin/install -c .libs/text2image /usr/local/bin/text2image
libtool: warning: '../../libtesseract.la' has not been installed in '/usr/local/lib'
libtool: install: /usr/bin/install -c .libs/unicharset_extractor /usr/local/bin/unicharset_extractor
libtool: warning: '../../libtesseract.la' has not been installed in '/usr/local/lib'
libtool: install: /usr/bin/install -c .libs/wordlist2dawg /usr/local/bin/wordlist2dawg
libtool: warning: '../../libtesseract.la' has not been installed in '/usr/local/lib'
libtool: install: /usr/bin/install -c .libs/ambiguous_words /usr/local/bin/ambiguous_words
libtool: warning: '../../libtesseract.la' has not been installed in '/usr/local/lib'
libtool: install: /usr/bin/install -c .libs/classifier_tester /usr/local/bin/classifier_tester
libtool: warning: '../../libtesseract.la' has not been installed in '/usr/local/lib

```bash
sudo make training-install
```

After this the training tools will be available in your system:

`tesstrain.sh`

and 

`tesstrain_utils.sh`


The rest training tools are:


Command | Description
------------|-----
combine_tessdata |
dawg2wordlist |
lstmeval |
lstmtraining |
merge_unicharsets |
set_unicharset_properties | 
text2image | 
unicharset_extractor | 
wordlist2dawg | 
ambiguous_words | 
classifier_tester | 
mftraining | 
shapeclustering | 
tesstrain_utils.sh | 
tesstrain.sh | 


6. Now install tesseract on your system
```bash
sudo make install
```


## Creating training data

I have cloned it:
[langdata_lstm](https://github.com/tesseract-ocr/langdata_lstm)



Simple script for generating the training data:

```bash
!#/bin/bash

rm -rf tain/*

tesstrain.sh --fonts_dir font \
			 --fontlist 'DejaVu Sans Mono' \
			 --lang eng \
			 --linedata_only \
			 --langdata_dir langdata_lstm \
			 --tessdata_dir tesseract/tessdata \
			 --save_box_tiff \
			 --maxpages 10 \
			 --output_dir train
```

Run the script, and Phase A to Phase E should be completed.



...

final step after building and fine-tunining it and combining it,
copy the file which consist the final model `eng.traineddata` you trained to : `/usr/local/share/tessdata/`


### 

https://github.com/tesseract-ocr/tessdoc/blob/master/TrainingTesseract-4.00.md#additional-libraries-required

### Important libraries

* Tesseract language packs should be located in the directory
```bash
 /usr/share/tesseract-ocr/<version>/tessdata
```

where <version> is the version number for your Tesseract install


* Download Tesseract’s language packs manually from GitHub 

```bash
https://github.com/tesseract-ocr/tessdata
```




So what are these Tesseract files?

* `eng.traineddata` - is the language pack for English.
* `osd.traineddata` - is a special data file related to orientation and scripts.
* `snum.traineddata` - is an internal serial number used by Tesseract.
* `pdf.ttf` -  is a True Type Format Font file to support pdf renderings.

* Set the `TESSDATA_PREFIX` environment variable to point to the directory containing the language packs.

[Link](https://www.pyimagesearch.com/2020/08/03/tesseract-ocr-for-non-english-languages/)


### Tesseract configurations

### Page segmentation modes

PSM = Page segmentation modes 

number | Description
------------|-----
0  |  Orientation and script detection (OSD) only.
1  |  Automatic page segmentation with OSD.
2  |  Automatic page segmentation, but no OSD, or OCR.
3  |  Fully automatic page segmentation, but no OSD. (Default)
4  |  Assume a single column of text of variable sizes.
5  |  Assume a single uniform block of vertically aligned text.
6  |  Assume a single uniform block of text.
7  |  Treat the image as a single text line.
8  |  Treat the image as a single word.
9  |  Treat the image as a single word in a circle.
10 |  Treat the image as a single character.
11  |  Sparse text. Find as much text as possible in no particular order.
12  |  Sparse text with OSD.
13  |  Raw line. Treat the image as a single text line, bypassing hacks that are Tesseract-specific.


### OCR Engine mode

OEM = OCR Engine mode

code | Description
------------|-----
0  |  Legacy engine only.
1  |  **Neural nets LSTM engine only.**
2  |  Legacy + LSTM engines.
3  |  Default, based on what is available.

#### Detect orientation and text (script)
```python
osd = pytesseract.image_to_osd(img)
angle = re.search('(?<=Rotate: )\d+', osd).group(0)
script = re.search('(?<=Script: )\d+', osd).group(0)
print("angle: ", angle)
print("script: ", script)
```
#### Detect only digits

```python
custom_config = r'--oem 3 --psm 6 outputbase digits'
print(pytesseract.image_to_string(img, config=custom_config))
```
#### Whitelisting characters

```python
custom_config = r'-c tessedit_char_whitelist=abcdefghijklmnopqrstuvwxyz --psm 6'
print(pytesseract.image_to_string(img, config=custom_config))
```

#### Blacklisting characters
```python
custom_config = r'-c tessedit_char_blacklist=0123456789 --psm 6'
pytesseract.image_to_string(img, config=custom_config)
```

#### Specify the language

To specify the language you need your OCR output in, use the -l LANG argument in the config where LANG is the 3 letter code for what language you want to use.

```python
custom_config = r'-l eng --psm 6'
pytesseract.image_to_string(img, config=custom_config)
```

for multiple languages just write:
```python
custom_config = r'-l heb+eng --psm 6'
pytesseract.image_to_string(img, config=custom_config)
```

#### Some tips with image processing (important)

When you open a file with `kolorpaint` which was exported in opencv after applying binary threshold. After you have edited the image you should pay attention:
**Export...**
and more over 
Pick filetype: **PNG** and make sure you have picked **Convert to Monochrome**.

Otherwise it will convert the image to grayscale, and therefore will mess the tesseract ocr.
``


## Installing tesseract NOT from source, from ubuntu repositories:
```bash
sudo apt-get install libtesseract4 tesseract-ocr tesseract-ocr-eng tesseract-ocr-osd
```


## Tesseract Dec-2022 

For training a model use the following scripts:

1. `generate_image.sh` will generate all syntetic data, the folder should be name by this convention: `<bla>-ground-truth`
2. 




# Reference 

[Instructions September 2022](https://www.youtube.com/watch?v=KE4xEzFGSU8)

[Comprehensive guide to ocr with tesseract](https://medium.com/nanonets/a-comprehensive-guide-to-ocr-with-tesseract-opencv-and-python-fd42f69e8ca8)