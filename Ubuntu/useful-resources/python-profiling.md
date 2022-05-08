<!--ts-->
   * [Python profiling](#python-profiling)
      * [cProfile](#cprofile)
      * [LineProfiler](#lineprofiler)
      * [Generate profiling dump](#generate-profiling-dump)
      * [visualizing profiling](#visualizing-profiling)
         * [Installing snakeviz](#installing-snakeviz)
         * [View it after generating profiling dump](#view-it-after-generating-profiling-dump)

<!-- Added by: gil_diy, at: Sun 08 May 2022 07:55:50 IDT -->

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

## Generate profiling dump

```python
import cProfile

cProfile.run('re.compile("foo|bar")', 'restats')
```

## visualizing profiling

[Great package](https://jiffyclub.github.io/snakeviz/)

### Installing snakeviz

```bash
pip install snakeviz
```
### View it after generating profiling dump

```
snakeviz program.prof
```

[Reference](https://www.youtube.com/watch?v=MgBgMyYROTE)