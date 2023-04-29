

<!-- TOC -->

- [KQL Advance](#kql-advance)
    - [Coalesce](#coalesce)
    - [Sliding window Counts - sliding_window_counts](#sliding-window-counts---sliding_window_counts)
    - [active_users_count](#active_users_count)
    - [active_users_count with zeros](#active_users_count-with-zeros)
    - [Activity Count metrics](#activity-count-metrics)
    - [Activity Count metrics with Zero](#activity-count-metrics-with-zero)
    - [Activity Metrics](#activity-metrics)
- [Geographic analaysis](#geographic-analaysis)
    - [Nearby Events Circle](#nearby-events-circle)
    - [Nearby Events Line](#nearby-events-line)
    - [Geofencing Polygon](#geofencing-polygon)
    - [Clustering](#clustering)
        - [Cells](#cells)
        - [Geohash](#geohash)
    - [Geospatial Joins](#geospatial-joins)
    - [Performing Diagnostic and Root Cause analysis](#performing-diagnostic-and-root-cause-analysis)
- [Time Series](#time-series)
    - [make-series](#make-series)
    - [Creation and Core Functions](#creation-and-core-functions)
    - [Anomaly Detection and forecasting](#anomaly-detection-and-forecasting)
    - [Seasonabilty Detection](#seasonabilty-detection)
    - [series_subtract](#series_subtract)
    - [Decomposition series_decompose](#decomposition-series_decompose)
    - [Finding Anomaly series_decompose_anomalies](#finding-anomaly-series_decompose_anomalies)
    - [Forecast series_decompose_forecast](#forecast-series_decompose_forecast)
    - [Scalibilty](#scalibilty)

<!-- /TOC -->
# KQL Advance


##  Coalesce
We use the evaluate function to indicate we are calling a plugin.

Evaluates a list of expressions and returns the first non-null (or non-empty for string) expression.

```kql
print result=coalesce(tolong("5"), tolong("ghjgj"), 33)
```

**The output will be:** 5

```kql
print result=coalesce(tolong("The story"), tolong("ghjgj"), 33)
```

**The output will be:** 33


##  Sliding window Counts - `sliding_window_counts()`

Here is an example,
the **window size is three**,
We count the number of **unique** people in the window (Column **Dcount**), and the number of rows in each day (column **Count**).
The final column is **dcount**, short for distinct count. It counts based on the number of unique values in the ID column, in this case the UserId.

Here we want to group the counts by day therefore we use the vairable bin (=1d).

```kql
let T = datatable(UserId:string, Timestamp:datetime)
[
  // Bin 1: 06-01
  'Bob',      datetime(2020-06-01), 
  'David',    datetime(2020-06-01), 
  'David',    datetime(2020-06-01), 
  'John',     datetime(2020-06-01), 
  'Bob',      datetime(2020-06-01), 
  // Bin 2: 06-02
  'Ananda',   datetime(2020-06-02), 
  'Atul',     datetime(2020-06-02), 
  'John',     datetime(2020-06-02), 
  // Bin 3: 06-03
  'Ananda',   datetime(2020-06-03), 
  'Atul',     datetime(2020-06-03), 
  'Atul',     datetime(2020-06-03), 
  'John',     datetime(2020-06-03), 
  'Bob',      datetime(2020-06-03), 
  // Bin 4: 06-04
  'Betsy',    datetime(2020-06-04), 
  // Bin 5: 06-05
  'Bob',      datetime(2020-06-05), 
];
let start = datetime(2020-06-01);
let end = datetime(2020-06-07); 
let lookbackWindow = 3d;  
let bin = 1d;
T | evaluate sliding_window_counts(UserId, Timestamp, start, end, lookbackWindow, bin)
```

**The output is:**

<p align="center">
  <img src="images\sliding_window_counts.png" width="1000">
</p>

##  active_users_count

```KQL
let T =  datatable(User:string, Timestamp:datetime)
[
    // Pre-start date
    "Bob",      datetime(2020-05-29),
    "Bob",      datetime(2020-05-30),
    // Bin 1: 6-01
    "Bob",      datetime(2020-06-01),
    "Jim",      datetime(2020-06-02),
    // Bin 2: 6-08
    "Bob",      datetime(2020-06-08),
    "Bob",      datetime(2020-06-09),
    "Jim",      datetime(2020-06-10),
    "Bob",      datetime(2020-06-11),
    "Jim",      datetime(2020-06-14),
    // Bin 3: 6-15
    "Bob",      datetime(2020-06-21),
    "Jim",      datetime(2020-06-21),
    // Bin 4: 6-22
    "Jim",      datetime(2020-06-22),
    "Bob",      datetime(2020-06-22),
    "Jim",      datetime(2020-06-23),
    "Bob",      datetime(2020-06-24),
    // Bin 5: 6-29
    "Bob",      datetime(2020-06-24)
];
```

setting the parameters:

```kql
let Start = datetime(2020-06-01);
let End = datetime(2020-06-30);
let Period = 1d;
let LookbackWindow = 5d; # window size
let ActivePeriods = 3;  # threshold
let Bin = 7d;
```

The final aggregation function:

```kql
T | evaluate active_users_count(User, Timestamp, Start, End, LookbackWindow, Period, ActivePeriods, Bin)
```

**Output:**

<p align="center">
  <img src="images\active_users_count_no_zeros.png" width="1000">
</p>


##  active_users_count with zeros

```kql
T | evaluate active_users_count(User, Timestamp, Start, End, LookbackWindow, Period, ActivePeriods, Bin)
| join kind=rightouter (print Timestamp = range (Start, End, Bin)
| mv-expand Timestamp to typeof(datetime)) on Timestamp
| project Timestamp=coalesce(Timestamp, Timestamp1), dcount=coalesce(dcount, 0)
```

##  Activity Count metrics

```kql
let T = datatable(UserId:string, Timestamp:datetime)
[
  // June 1
  'Bob',   datetime(2020-06-01),
  'John',  datetime(2020-06-01),
  // June 2
  'Cindy', datetime(2020-06-02),
  'John',  datetime(2020-06-02),
  'Ted',   datetime(2020-06-02),
  // June 3
  'Bob',   datetime(2020-06-03),
  'John',  datetime(2020-06-03),
  'Todd',  datetime(2020-06-03),
  'Todd',  datetime(2020-06-03),
  'Sam',   datetime(2020-06-03),
  // June 5
  'Sam',   datetime(2020-06-05),
];
```
Next, we setup a few basic variables.

```python
let start=datetime(2020-06-01);
let end=datetime(2020-06-05);
let window=1d;
```

As with previous demos, `start` and `end` are used to mark the date range we want to analyze.

The `window` variable is how we want to bin, or group our results. Here we are using a single day, but other values such as weeks, months, minutes, hours, and more are valid.

In the final line of the query we call the `activity_counts_metrics` plugin.

```python
T | evaluate activity_counts_metrics(UserId, Timestamp, start, end, window)
```


##  Activity Count metrics with Zero

The same


##  Activity Metrics 

Terminology:

**Chrun rate**

**Retention Rate**


# Geographic analaysis

##  Nearby Events Circle


// Get a list of places that are within a geograpihc circle
```KQL

let T = datatable(longitude:real, latitude:real, place:string)
[
    real(-122.317404), 47.609119, 'Seattle',                   // In circle 
    real(-123.497688), 47.458098, 'Olympic National Forest',   // In exterior of circle  
    real(-122.201741), 47.677084, 'Kirkland',                  // In circle
    real(-122.443663), 47.247092, 'Tacoma',                    // In exterior of circle
    real(-122.121975), 47.671345, 'Redmond',                   // In circle
];
// Radius for the circle in meters, 18000 meteres = 18km
let radius = 18000; 
// Long and Lat for the center of our circle
let centerLong = -122.317404;
let centerLat = 47.609119;

// Generate a list of places inside the circle
T | where geo_point_in_circle(longitude, latitude, centerLong, centerLat, radius)
  | project place
```


##  Nearby Events Line

Show nearby storm events based on a geographic line

```KQL


let distanceFromLine = 500;  // 500 meters
let geoLine = dynamic( { "type":"LineString"
                       , "coordinates":[ [-81.76849365234375,24.56211235799689]
                                       , [-81.507568359375,24.669482313373848]
                                       , [-81.34002685546875,24.649513490158643]
                                       , [-81.04339599609375,24.731864277701714]
                                       , [-80.771484375,24.856534339310674]
                                       , [-80.53253173828124,24.991036982463747]
                                       , [-80.39794921875,25.147770882723563]
                                       ]
                       }
                     );
StormEvents
  | where isnotempty( BeginLat ) and isnotempty( BeginLon )
  | project BeginLon, BeginLat, EventType
  | where geo_distance_point_to_line( BeginLon, BeginLat, geoLine ) < distanceFromLine 
  | render scatterchart with (kind = map)
```

We would like to take only the places whiich are less 500 meters from the line.

<p align="center">
  <img src="images\nearby_event_line.jpg" width="1000">
</p>

##  Geofencing (Polygon)

Here we are creating a polygon, and afterwards we would like to retrieve 
all storms events who occured in the polygon boundries.

```KQL
let polygon = dynamic( { "type":"Polygon"
                       , "coordinates":[ [ [-81.06880187988281,24.75306702526595]
                                         , [-81.12510681152344,24.728122241065808]
                                         , [-81.13609313964844,24.691319554166277]
                                         , [-81.09901428222656,24.671978191593258]
                                         , [-81.03858947753905,24.70005337937338]
                                         , [-80.97129821777344,24.718766657061526]
                                         , [-80.92391967773438,24.74558411549905]
                                         , [-80.86624145507812,24.775513050757333]
                                         , [-80.93215942382812,24.79483832122786]
                                         , [-81.06880187988281,24.75306702526595]
                                         ]
                                       ]
                       }
                     );
StormEvents
  | where isnotempty( BeginLat ) and isnotempty( BeginLon )
  | project BeginLon, BeginLat, EventType
  | where geo_point_in_polygon(BeginLon, BeginLat, polygon)
  | render scatterchart with (kind = map)
```

<p align="center">
  <img src="images\geofencing.jpg" width="1000">
</p>

##  Clustering

###  Cells

The S2 library defines a framework for decomposing the unit sphere into a hierarchy of cells. Each cell is a quadrilateral bounded by four geodesics. The top level of the hierarchy is obtained by projecting the six faces of a cube onto the unit sphere, and lower levels are obtained by subdividing each cell into four children recursively. For example, the following image shows two of the six face cells, one of which has been subdivided several times.

```KQL
let california = dynamic( { "type":"Polygon"
                       , "coordinates":[ [ [-123.233256,42.006186]
                                         , [-122.378853,42.011663]
                                         , [-121.037003,41.995232]
                                         , [-120.001861,41.995232]
                                         , [-119.996384,40.264519]
                                         , [-120.001861,38.999346]
                                         , [-118.71478,38.101128]
                                         , [-117.798899,37.21934]
                                         , [-116.540435,36.501861]
                                         , [-115.85034,35.970598]
                                         , [-114.635569,35.00118]
                                         , [-114.635569,34.87521]
                                         ]
                                       ]
                       }
                     );                   
let s2level=7;
StormEvents
| project BeginLon, BeginLat, EventType
| where geo_point_in_polygon(BeginLon, BeginLat, california)
| summarize eventCount = count() by  EventType
           , hash= geo_point_to_s2cell(BeginLon,BeginLat,s2cell) 
| project geo_s2cell_to_central_point(hash),EventType,eventCount           
| render piechart with (kind = map)
```

<p align="center">
  <img src="images\clustering.jpg" width="1000">
</p>

###  Geohash

Geohash encodes a geographic location into a short string of letters and digits.  It is a hierarchical spatial data structure which subdivides space into buckets of grid shape, which is one of the many applications of what is known as a Z-order curve, and generally space-filling curves.
Geohashes offer properties like arbitrary precision and the possibility of gradually removing characters from the end of the code to reduce its size (and gradually lose precision). Geohashing guarantees that the longer a shared prefix between two geohashes is, the spatially closer they are together. The reverse of this is not guaranteed, as two points can be very close but have a short or no shared prefix.

```KQL
let california = dynamic( { "type":"Polygon"
                       , "coordinates":[ [ [-123.233256,42.006186]
                                         , [-122.378853,42.011663]
                                         , [-121.037003,41.995232]
                                         , [-120.001861,41.995232]
                                         , [-119.996384,40.264519]
                                         , [-120.001861,38.999346]
                                         , [-118.71478,38.101128]
                                         , [-117.798899,37.21934]
                                         , [-116.540435,36.501861]
                                         , [-115.85034,35.970598]
                                         , [-114.635569,35.00118]
                                         , [-114.635569,34.87521]
                                         ]
                                       ]
                       }
                     );                   
let accuracy=3;
StormEvents
| project BeginLon, BeginLat, EventType
| where geo_point_in_polygon(BeginLon, BeginLat, california)
| summarize eventCount = count() by  EventType
           , hash= geo_point_to_geohash(BeginLon,BeginLat,accuracy) 
| project geo_geohash_to_central_point(hash),EventType,eventCount           
| render piechart with (kind = map)
```

##  Geospatial Joins

This query pattern is oftentimes used in various mobility solutions (geospatial telemetry and static reference data), geospatial risk analysis and agriculture optimization using weather data. It is based on the three-dimensional S2 geometry and the functions geo_polygon_to_s2cells and geo_point_in_polygon. By use of this functionality a geospatial join consists of a coarse-grained join using the S2 cell coverage and the exact validation using the geo_point_in_polygon function.

```
let join_level = 4; 
US_States 
| project State = features.properties.NAME, polygon = features.geometry 
| extend covering = geo_polygon_to_s2cells(polygon, join_level) 
| mv-expand covering to typeof(string) 
| join kind = inner hint.strategy = broadcast 
( 
  StormEvents 
  | project BeginLon, BeginLat , DamageProperty 
  | extend covering = geo_point_to_s2cell(BeginLon, BeginLat, join_level) 
) on covering 
| where geo_point_in_polygon(BeginLon, BeginLat, polygon) 
| summarize CountOfEvents=count(), DamageInDollar=sum(DamageProperty) by tostring(State) 
| top 3 by DamageInDollar desc
```



##  Performing Diagnostic and Root Cause analysis

```KQL
//  Build a time series of exception over the week in 10m bins
let min_t = toscalar(demo_clustering1 | summarize min(PreciseTimeStamp));  
let max_t = toscalar(demo_clustering1 | summarize max(PreciseTimeStamp));  
demo_clustering1
  | make-series NumberOfExceptions=count() 
             on PreciseTimeStamp 
           from min_t to max_t step 10m
  | render timechart 
      with ( title="Service exceptions over a week, 10 minutes resolution" ) 
```

<p align="center">
  <img src="images\time_line_spikes.jpg" width="1000">
</p>


# Time Series 

##  make-series

The `make-series` operator is a foundational component to time series analysis. We will build upon it, adding additional time series functions in the next demo.

```
let min_t = toscalar(demo_make_series1 | summarize min(TimeStamp));
let max_t = toscalar(demo_make_series1 | summarize max(TimeStamp));
demo_make_series1
  | make-series NumberOfEvents=count() default=0
             on TimeStamp
           from min_t to max_t step 1h
             by OsVer
  | render timechart
```
<p align="center">
  <img src="images\Make Series.jpg" width="1000">
</p>

We have aggregated for each hour the number of rows per each OS Version.

##  Creation and Core Functions

we have the filter. Technically, this contains the coefficients of the filter, but you can think of it as defining the shape of the block for the moving average. If we wanted to create a moving average of five values, we could define the filter as [1,1,1,1,1]. We can also utilize the repeat operator, here we repeat the number 1 five times, which produces the same result.
The third parameter indicates whether we want to normalize our results. Normalization ensures the sum of the coefficients is 1, so we neither amplify nor attenuate the original signal. In our example it will transform the vector of coefficients from [1, 1, 1, 1, 1] to [0.2, 0.2, 0.2, 0.2, 0.2]. Note that if there are any negative coefficients we cannot normalize and this value must be set to false. It is an optional parameter, so if omitted it will default to true, unless there are negative values in the filter, in which case it will default to false.
The last parameter indicates whether we want to do a centered average or not, with false being the default. It will be easier to explain this using an example.
Let's say the first five values in NumberOfEvents is 10, 20, 30, 40, and 50. If we use a centered average, it will take the current value and center it in the middle of our [1,1,1,1,1] filter. Because there are no values before 10, since it's first, our average would be calculated as 0, 0, 10, 20, 30, resulting in a moving average of 12. On the next pass through the data, the next value of 20 takes the center spot, and our values become 0, 10, 20, 30, 40 resulting in a moving average of 20.
Let's contrast this with a backwards looking average. In it, values roll into the last position first, thus the first time the average is based on 0, 0, 0, 0, 10, resulting in 2. When the next sample is processed, we have 0, 0, 0, 10, 20, resulting in 6.
```
let min_t = toscalar(demo_make_series1 | summarize min(TimeStamp));
let max_t = toscalar(demo_make_series1 | summarize max(TimeStamp));
demo_make_series1
  | make-series NumberOfEvents=count() default=0
             on TimeStamp
           from min_t to max_t step 1h
             by OsVer
  | extend ma_num=series_fir(NumberOfEvents, repeat(1, 5), true, true)
  | render timechart
```
<p align="center">
  <img src="images\Series FIR.jpg" width="1000">
</p>


##  Anomaly Detection and forecasting

Rather than charting the data, we can use this query to retrieve only the slope and r-square values of the two regression functions:

```
demo_series2
  | extend series_fit_2lines(y), series_fit_line(y)
  | project series_fit_line_y_slope
          , series_fit_line_y_rsquare
          , series_fit_2lines_y_left_slope
          , series_fit_2lines_y_right_slope
          , series_fit_2lines_y_rsquare
```
| series_fit_line_y_slope | series_fit_line_y_rsquare | series_fit_2lines_y_left_slope | series_fit_2lines_y_right_slope | series_fit_2lines_y_rsquare |
| ----- | ----- | ----- | ----- | ----- |
| 0.879936864393257 | 0.874944924804405 | 0.0100560431915836 | 1.00181379415772 | 0.997072277363839 |


##  Seasonabilty Detection

series_periods_detect(x, min_period, max_period, num_periods)

Arguments
x: **Dynamic array scalar expression that is an array of numeric values**, typically the resulting output of make-series or make_list operators.

**min_period:** A real number specifying the minimal period to search for.

**max_period:** A real number specifying the maximal period to search for.

**num_periods:** A long number specifying the maximum required number of periods. This number will be the length of the output dynamic arrays.

```KQL
// Show the sample data
demo_series3
  | render timechart 
```

<p align="center">
  <img src="images\seasons.jpg" width="1000">
</p>


```KQL
// Detect the periods
demo_series3
    //Use series_periods_detect to detect the periods in the time series
    // Note, 8d/2h=96 bins (aka periods)
  | project (periods, scores) = series_periods_detect(num, 0., 8d/2h, 2)  
    // As the above comes out in a json style array convert to a normal data table
  | mv-expand periods, scores
    // Calculate the number of days per period
  | extend days=2h*todouble(periods)/1d
  ```

<p align="center">
  <img src="images\seasons_period.jpg" width="200">
</p>  

The scores is the confident level.


##  series_subtract

For getting some help regarding the function `pack_array` see **KQL Basic** cheatsheet.

```KQL
range x from 1 to 3 step 1
| extend y = x * 2
| extend z = y * 2
| project s1 = pack_array(x,y,z), s2 = pack_array(z, y, x)
| extend s1_subtract_s2 = series_subtract(s1, s2)
```


<p align="center">
  <img src="images\series_subtract.jpg" width="350">
</p>  

**Attention:** similar function just does the opposite is called: `series_add`


##  Decomposition (`series_decompose`)

Applies a decomposition on a series. Takes an expression containing a series (dynamic numerical array) as input and decomposes it to:
1. Baseline
2. Seasonal
3. Trend
4. Residual components


```KQL
let ts=range t from 1 to 24*7*5 step 1 
| extend Timestamp = datetime(2018-03-01 05:00) + 1h * t 
| extend y = 2*rand() + iff((t/24)%7>=5, 5.0, 15.0) - (((t%24)/10)*((t%24)/10)) + t/72.0 // generate a series with weekly seasonality and ongoing trend
| extend y=iff(t==150 or t==200 or t==780, y-8.0, y) // add some dip outliers
| extend y=iff(t==300 or t==400 or t==600, y+8.0, y) // add some spike outliers
| summarize Timestamp=make_list(Timestamp, 10000),y=make_list(y, 10000);
ts 
| extend series_decompose(y, -1, 'linefit')
| render timechart  
```
The third argument is set here to: `linefit` which means Linear Regression.


##  Finding Anomaly (`series_decompose_anomalies`)

The function returns:
1. Anomalies
2. Score
3. Baseline
   
```KQL
let ts=range t from 1 to 24*7*5 step 1 
| extend Timestamp = datetime(2018-03-01 05:00) + 1h * t 
| extend y = 2*rand() + iff((t/24)%7>=5, 5.0, 15.0) - (((t%24)/10)*((t%24)/10)) + t/72.0 // generate a series with weekly seasonality and ongoing trend
| extend y=iff(t==150 or t==200 or t==780, y-8.0, y) // add some dip outliers
| extend y=iff(t==300 or t==400 or t==600, y+8.0, y) // add some spike outliers
| summarize Timestamp=make_list(Timestamp, 10000),y=make_list(y, 10000);
ts 
| extend (anomalies,score,baseline) = series_decompose_anomalies(y, 1.5, -1, 'linefit')
| render anomalychart 
with (anomalycolumns=anomalies, title="Mory the King!!")
```


<p align="center">
  <img src="images\anomaly.jpg" width="550">
</p>  

##  Forecast (`series_decompose_forecast`)

```KQL
let min_t = datetime(2017-01-05);
let max_t = datetime(2017-02-03 22:00);
let dt = 2h;
let horizon=7d; 
demo_make_series2
  | make-series Traffic=avg(num)
             on TimeStamp
           from min_t to max_t+horizon step dt
             by sid
    // select a single time series for a cleaner visualization
  | where sid == 'TS1'
  | extend forecast = series_decompose_forecast(Traffic, toint(horizon/dt))
  | render timechart
      with (title='Web app. traffic of a month, forecasting the next week by Time Series Decomposition')
```

<p align="center">
  <img src="images\forecast.jpg" width="550">
</p>  


##  Scalibilty

```KQL
let min_t = datetime(2017-01-05);
let max_t = datetime(2017-02-03 22:00);
let dt = 2h;
let horizon=7d;
demo_make_series2
  | make-series Traffic=avg(num) 
             on TimeStamp 
           from min_t to max_t+horizon step dt 
           by sid
    // add artificial offset for easy visualization of multiple time series
  | extend offset=case(sid=='TS3', 4000000, sid=='TS2', 2000000, 0)   
  | extend Traffic=series_add(Traffic, offset)
  | extend forecast = series_decompose_forecast(Traffic, toint(horizon/dt))
  | render timechart 
      with (title='Web app. traffic of a month, forecasting the next week for 3 time series')  
```

<p align="center">
  <img src="images\multiple_forecasting.jpg" width="550">
</p>  



