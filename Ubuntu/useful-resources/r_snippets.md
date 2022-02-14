# R-snippets

<!--ts-->
   * [R-snippets](#r-snippets)
      * [Get index column and row column of True value in a datframe:](#get-index-column-and-row-column-of-true-value-in-a-datframe)
   * [Reference](#reference)

<!-- Added by: gil_diy, at: Mon 14 Feb 2022 22:48:02 IST -->

<!--te-->

## Get index column and row column of True value in a datframe:

```r
df <- data.frame(col1=c(FALSE,TRUE), col2=c(FALSE,FALSE))
rownames(df) <- c(11,22)
which(df==TRUE)
which(df==TRUE, arr.in= TRUE)
```


# Reference

[Link](http://www.science.smith.edu/~jcrouser/SDS293/labs/lab14-r.html)
