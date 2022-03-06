<!--ts-->
   * [Correlation](#correlation)
      * [Measure of association between two categorical features](#measure-of-association-between-two-categorical-features)
         * [Cramér's phi ()](#cram\xC3\xA9rs-phi-)
         * [Theil's U (Uncertainty coefficient)](#theils-u-uncertainty-coefficient)

<!-- Added by: gil_diy, at: Sun 06 Mar 2022 18:04:56 IST -->

<!--te-->

# Correlation

## Measure of association between two categorical features


### Cramér's phi ()

Using `Cramér's phi`, the properties are:

* Cramer’s V is symmetrical — it is insensitive to swapping x and y. which means:
 `cramer_phi(x,y)` is equivalent to: `cramer_phi(y,x)`

 * The value of the `Cramér's phi` is between 0 to 1, unlike perason and spearman correlation between -1 to 1.


```python
def cramers_v(x, y):
    confusion_matrix = pd.crosstab(x,y)
    chi2 = ss.chi2_contingency(confusion_matrix)[0]
    n = confusion_matrix.sum().sum()
    phi2 = chi2/n
    r,k = confusion_matrix.shape
    phi2corr = max(0, phi2-((k-1)*(r-1))/(n-1))
    rcorr = r-((r-1)**2)/(n-1)
    kcorr = k-((k-1)**2)/(n-1)
    return np.sqrt(phi2corr/min((kcorr-1),(rcorr-1)))
```


[Link](https://towardsdatascience.com/the-search-for-categorical-correlation-a1cf7f1888c9)


### Theil's U (Uncertainty coefficient)


* Is asymmetric 

* The Cramer’s V, the output value is on the range of [0,1]



```
Unlike Cramer’s V, it is asymmetric, meaning U(x,y)≠U(y,x) (while V(x,y)=V(y,x), where V is Cramer’s V)
```