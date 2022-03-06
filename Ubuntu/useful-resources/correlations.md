<!--ts-->
   * [Correlation](#correlation)
      * [Measure of association between two categorical features](#measure-of-association-between-two-categorical-features)

<!-- Added by: gil_diy, at: Sun 06 Mar 2022 17:53:35 IST -->

<!--te-->

# Correlation

## Measure of association between two categorical features


Using `Cramér's phi`, the properties are:

* Cramer’s V is symmetrical — it is insensitive to swapping x and y. which means:
 `cramer_phi(x,y) = cramer_phi(y,x)`


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