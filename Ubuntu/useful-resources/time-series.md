<!--ts-->
   * [Time-Series](#time-series)
      * [Converting to Time-Stamp](#converting-to-time-stamp)
      * [Slicing date-time type](#slicing-date-time-type)
      * [Rolling Window Statistics](#rolling-window-statistics)
      * [Expanding Window Statistics](#expanding-window-statistics)
      * [Exponentially Weighted Moving Average (EWMA)](#exponentially-weighted-moving-average-ewma)
      * [Statsmodels](#statsmodels)
      * [Useful packages for time series](#useful-packages-for-time-series)

<!-- Added by: gil_diy, at: Sun 06 Feb 2022 18:44:06 IST -->

<!--te-->

 Time-Series

# Time-Series

## Converting to Time-Stamp

```python
df['Date'] = pd.to_datetime(df['Date'], format='%d/%M/%Y')
```

## Slicing date-time type

Approach #1:

```python
df['2012-1':'2012-1-2 00:00:00', 'Date']
```


Approach #2:

```python
df['Date'].truncate(before='2013-11-01', after='2013-11-02')
```


## Rolling Window Statistics

```python
load_val = ts_data['load']
shifted = load_val.shift(1)

window = shifted.rolling(window=6)

new_dataframe = concat([window.min, window.mean(), window.max(), load_val], axis=1)
new_dataframe.columns = ['min','mean','max', 'load']

print(new_dataframe.head(10))
```

## Expanding Window Statistics

Expanding window are features that include all previous data. 

```python
load_val = ts_data['load']
window = load_val.expanding()

new_dataframe = concat([window.min(), window.mean(), window.max(), load_val.shift(-1)], axis=1)
new_dataframe.columns = ['min','mean','max', 'load+1']

print(new_dataframe.head(10))
```


## Exponentially Weighted Moving Average (EWMA)



## Statsmodels

```python
from statsmodels.tsa.ar_model import AutoReg, ar_select_order

for t in range(test_ts.shape[0]):
   model = AutoReg(ts_data_load, 1)
   model_fit = model.fit()
   yhat = model_fit.predict
   predictions.append(yhat)
   obs = list(test_ts.iloc[t])
   # move the training window
   history.append(obs[0])
   history.pop(0)
   print(test_ts.index[t])
   print(t+1, ': predicted =', yhat, 'expected =', obs)
```

[Reference](https://machinelearningmastery.com/autoregression-models-time-series-forecasting-python/)



## Useful packages for time series

[Merlion](https://github.com/salesforce/Merlion)