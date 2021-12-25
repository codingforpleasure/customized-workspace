# R-snippets

<!--ts-->
   * [R-snippets](#r-snippets)
      * [Get index column and row column of True value in a datframe:](#get-index-column-and-row-column-of-true-value-in-a-datframe)

<!-- Added by: gil_diy, at: Sat 25 Dec 2021 11:11:29 IST -->

<!--te-->

## Get index column and row column of True value in a datframe:

```r
df_data <- data.frame(col1=c(1,2), col2=c(5,6))
df <- data.frame(col1=c(FALSE,TRUE), col2=c(FALSE,FALSE))
rownames(df) <- c(11,22)
which(df==TRUE)
which(df==TRUE, arr.in= TRUE)
df_data[df==TRUE] <- NA
```
