# Outliers

<!--ts-->
   * [Outliers](#outliers)
      * [IQR (Interquatile Range)](#iqr-interquatile-range)
      * [Upper and Lower Fences](#upper-and-lower-fences)
         * [Outer Fence](#outer-fence)
         * [Inner Fence](#inner-fence)

<!-- Added by: gil_diy, at: Tue 28 Dec 2021 11:54:17 IST -->

<!--te-->

## IQR (Interquatile Range)

Difference between third and first quartiles
The **IQR covers the middle 50 percents of the distribution**.

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

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/IQR_Boxplot_vs_PDF.png" title="tool tip here">
</p>