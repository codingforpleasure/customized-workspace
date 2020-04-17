<!--ts-->
   * [Tesseract](#tesseract)
      * [Compiling tesseract from source:](#compiling-tesseract-from-source)
         * [Additional libraries required](#additional-libraries-required)
         * [Building source](#building-source)
      * [Creating training data](#creating-training-data)
      * [Installing tesseract NOT from source, from ubuntu repositories:](#installing-tesseract-not-from-source-from-ubuntu-repositories)

<!-- Added by: gil_diy, at: 2020-04-17T22:41+03:00 -->

<!--te-->

# Tesseract

[Documentation](https://github.com/tesseract-ocr/tessdoc)

[TrainingTesseract-4.00](https://github.com/tesseract-ocr/tessdoc/blob/master/TrainingTesseract-4.00.md)


## Compiling tesseract from source:

### Additional libraries required

As mentioned [here](https://github.com/tesseract-ocr/tessdoc/blob/master/TrainingTesseract-4.00.md#additional-libraries-required), install the essential libraries:

```bash
sudo apt-get install libicu-dev libpango1.0-dev libcairo2-dev
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



## Creating training data

I have cloned it:
[langdata_lstm](https://github.com/tesseract-ocr/langdata_lstm)



Simple script for generating the training data:

```bash
!#/bin/bash

rm -rf tain/*

tesstrain.sh --fonts_dir font \
			 --fonlist 'DejaVu Sans Mono Book' \
			 --lang eng \
			 --linedata_only \
			 --langdata_dir langdata_lstm \
			 --tessdata_dir tesseract/tessdata \
			 --save_box_tiff \
			 --maxpages 10 \
			 --output_dir train
```


## Installing tesseract NOT from source, from ubuntu repositories:
```bash
sudo apt-get install libtesseract4 tesseract-ocr tesseract-ocr-eng tesseract-ocr-osd
```