Analysis of Tabarnac optimization on IS
=======================================



```
## Loading required package: methods
```
Experiment executed the 15/03/2015 on turing (UFRGS).

Setup
-----

Optimizations:

+ Dynamic: threads use OpenMP schedule(dynamic), default configuration for IS
+ Cyclic:  thread use a static schedule with a step of size 1
+ Tabarnac: cyclic configuration taking into account the Gaussian use of key_buff1
+ libnuma: tabarnac opti + mapping using libnuma


Execution type:

+ Affinity: on/ off,    GOMP_CPU_AFFINITY=0-63
+ balancing: on/off     kernel.numa_balancing
+ interleave: on/off    numactl -i all



Expectations
------------

best should be tabrnac aff on blancing off interleave off

Results
-------

###   Execution time


```
## Warning in data$Time/norm_vect: longer object length is not a multiple of
## shorter object length
```

```
## Error in `$<-.data.frame`(`*tmp*`, "slowdown", value = c(1, 50.8000499750125, : replacement has 36 rows, data has 35
```

```
## Error in eval(expr, envir, enclos): object 'slowdown' not found
```

```
## Error in ggplot(stat, aes(x = Bench, y = mean, fill = Type)): object 'stat' not found
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
```

```
## Error in eval(expr, envir, enclos): object 'p' not found
```

```
## Error in show(p): error in evaluating the argument 'object' in selecting a method for function 'show': Error: object 'p' not found
```

```
## Error in ggsave("figure/ExecutionTime.pdf", width = 4, height = 4): plot should be a ggplot2 plot
```

```
## Error in ggsave("tabarnac_ovh.png", width = 4, height = 4): plot should be a ggplot2 plot
```

Detailled Values:


```
## Error in show(stat): error in evaluating the argument 'object' in selecting a method for function 'show': Error: object 'stat' not found
```

Conclusions
-----------

**TODO**


```
## Warning in remove(p): object 'p' not found
```

```
## Warning in remove(stat): object 'stat' not found
```

```
## Warning in remove(speedup): object 'speedup' not found
```

```
## Warning in remove(stat1): object 'stat1' not found
```
