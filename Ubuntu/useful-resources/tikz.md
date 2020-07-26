<!--ts-->
   * [Tikz](#tikz)
      * [Generate latetx with python](#generate-latetx-with-python)
      * [Generate latex into svg](#generate-latex-into-svg)
      * [Generate tikz in python using tikzplotlib](#generate-tikz-in-python-using-tikzplotlib)
      * [Generate tikz from inkscape using an extention](#generate-tikz-from-inkscape-using-an-extention)
      * [Well written official manual for tikz (written in 2020)](#well-written-official-manual-for-tikz-written-in-2020)
         * [Tikz](#tikz-1)
      * [Useful resources](#useful-resources)

<!-- Added by: gil_diy, at: 2020-07-27T02:07+03:00 -->

<!--te-->

# Tikz


## Generate latetx with python

[Link](https://jeltef.github.io/PyLaTeX/current/examples/matplotlib_ex.html)

## Generate latex into svg

First generate `latex` to `pdf`:

```bash
pdflatex example2.tex 
```
next convert `pdf` to into `svg`

```bash
pdf2svg example2.pdf example2.svg
```

**Pay attention**: the circles are actually **paths**.
Not so good

[Reference](https://tex.stackexchange.com/questions/51757/how-can-i-use-tikz-to-make-standalone-svg-graphics)

## Generate tikz in python using tikzplotlib

[Link](https://github.com/nschloe/tikzplotlib)


## Generate tikz from inkscape using an extention

[Link](https://github.com/kjellmf/svg2tikz)

How to install inkscape extenion:

[Link](https://www.youtube.com/watch?v=7M09gTMb3G4)


## Well written official manual for tikz (written in 2020)

[Link](https://pgf-tikz.github.io/pgf/pgfmanual.pdf)


### Tikz

## Useful resources

[Complete collection of my TikZ figures](https://github.com/PetarV-/TikZ)

[beautiful Tikz figures without clunky Tikz code ](https://github.com/negrinho/sane_tikz)

[tikz by example](https://github.com/ridlo/tikz_by_example)

[Link](https://texample.net/tikz/examples/all/)

[Link](https://github.com/walmes/Tikz)

[Link](https://github.com/hackl/tikz-network)