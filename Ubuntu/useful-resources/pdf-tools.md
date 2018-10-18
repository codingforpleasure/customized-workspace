<!--ts-->
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


Example of extracting group of pages from large pdf:

```bash
pdftk <input_file> cat <start_page-end_page> output <output_file>
```

