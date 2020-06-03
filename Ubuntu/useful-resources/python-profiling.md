<!--ts-->
   * [Python profiling](#python-profiling)
      * [cProfile](#cprofile)
      * [LineProfiler](#lineprofiler)

<!-- Added by: gil_diy, at: 2020-06-03T21:31+03:00 -->

<!--te-->


# Python profiling

## cProfile

For finding out how many times the function was invoked.

```python
import cProfile

def my_func():
	print("Hello world")

cProfile.run('f()')
```

## LineProfiler

```
pip install line_profiler
```

```python
from line_profiler import LineProfile

def rock(rk):
	print(rk)

bla = "Hello world"
profile = LineProfiler(rock(rk))
print(profile.print_stats())

```

[Reference](https://www.youtube.com/watch?v=MgBgMyYROTE)