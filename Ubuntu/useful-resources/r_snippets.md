# R-snippets

<!--ts-->
* [R-snippets](#r-snippets)
   * [Get index column and row column of True value in a datframe:](#get-index-column-and-row-column-of-true-value-in-a-datframe)
   * [Where packages are installed?](#where-packages-are-installed)
   * [Remove Package](#remove-package)
   * [Install Package](#install-package)
   * [Edit package on the fly](#edit-package-on-the-fly)
* [Reference](#reference)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Sun 06 Nov 2022 01:36:39 IST -->

<!--te-->

## Get index column and row column of True value in a datframe:

```r
df <- data.frame(col1=c(FALSE,TRUE), col2=c(FALSE,FALSE))
rownames(df) <- c(11,22)
which(df==TRUE)
which(df==TRUE, arr.in= TRUE)
```


## Where packages are installed?

```r
.libPaths()
```
## Remove Package

```r
remove.packages("rayshader")
```

## Install Package

```r
remotes::install_github("tylermorganwall/rayshader")
```

## Edit package on the fly


1. Type trace("semiMarkov", edit=TRUE)
2. In the text editor that that launches, edit the line of interest.
3. Save the modified file.
4. Close the text editor
5. Back in R, use the modified function.

[Reference](https://stackoverflow.com/a/34800688/1305700)


# Reference

[Link](http://www.science.smith.edu/~jcrouser/SDS293/labs/lab14-r.html)
