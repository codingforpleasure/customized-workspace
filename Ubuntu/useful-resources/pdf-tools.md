<!--ts-->
* [Useful pdf tools for linux on the go](#useful-pdf-tools-for-linux-on-the-go)
   * [Extracting group of pages from large pdf into pdf:](#extracting-group-of-pages-from-large-pdf-into-pdf)
   * [PDF concatenate files (Join PDF files)](#pdf-concatenate-files-join-pdf-files)
   * [Extract specific pages from PDF as jpg](#extract-specific-pages-from-pdf-as-jpg)
   * [For rotating clockwise:](#for-rotating-clockwise)
   * [For rotating anti-clockwise:](#for-rotating-anti-clockwise)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Mon 15 May 2023 07:03:30 AM IDT -->

<!--te-->

# Useful pdf tools for linux on the go

Description | Tool's names
------------------------------------|-----
Rotate the pages of PDF files | pdf180, pdf270, pdfflip
generate a PostScript page list of a PDF document | pdf2dsc, pdftops
PDF output from TeX | pdftex
Font analyzer | pdffonts
PDF image extractor | pdfimages
PDF document information extractor  | pdfinfo
Join together pages from multiple PDF files | pdftk, pdfjoin, pdfunite
PDF to text converter | pdftotext
Extract source file or stream from PDF file | pdftosrc
PDF page extractor | pdftk, pdfseparate
extract image from pdf | pdftohtml



## Extracting group of pages from large pdf into pdf:

```bash
pdftk <input_file> cat <start_page-end_page> output <output_file>
```

## PDF concatenate files (Join PDF files)
```bash
pdfunite ~/Desktop/file1.pdf ~/Desktop/syllabusfile2.pdf  output.pdf 
```

## Extract specific pages from PDF as jpg

```bash
pdfimages 1.pdf -f 1 -l 1 -j 1.jpg
```

```
-f <int>       : first page to convert
-l <int>       : last page to convert
-j             : write JPEG images as JPEG files
```

## For rotating clockwise:

```bash
pdftk input.pdf cat 1-endeast output output.pdf
````

## For rotating anti-clockwise:

```bash
pdftk input.pdf cat 1-endwest output output.pdf
```