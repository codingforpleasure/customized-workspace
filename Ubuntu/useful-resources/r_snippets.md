# R-snippets

<!--ts-->
* [R-snippets](#r-snippets)
   * [Get index column and row column of True value in a datframe:](#get-index-column-and-row-column-of-true-value-in-a-datframe)
   * [Where packages are installed?](#where-packages-are-installed)
   * [Remove Package](#remove-package)
   * [Install Package](#install-package)
* [Reference](#reference)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Fri 04 Nov 2022 12:18:59 IST -->

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
# Reference

[Link](http://www.science.smith.edu/~jcrouser/SDS293/labs/lab14-r.html)
