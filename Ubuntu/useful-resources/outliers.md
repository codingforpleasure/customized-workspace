# Outliers

<!--ts-->
   * [Outliers](#outliers)
      * [IQR](#iqr)
      * [Upper and Lower Fences](#upper-and-lower-fences)
         * [Outer Fence](#outer-fence)
         * [Inner Fence](#inner-fence)

<!-- Added by: gil_diy, at: Tue 28 Dec 2021 11:49:22 IST -->

<!--te-->

## IQR


## Upper and Lower Fences

### Outer Fence

Q3 + 3IQR
Q1 - 3IQR

Values outside the outer fence are **strong outliers**

### Inner Fence

Q3 + 1.5IQR
Q1 - 1.5IQR

Values outside the inner fence (but inside the outer fence)
are **mild outliers**.

