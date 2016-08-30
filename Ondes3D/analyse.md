Analysis of Tabarnac optimization on IS
=======================================



Experiment executed the 15/03/2015 on turing (UFRGS).

Setup
-----

**TODO**


Expectations
------------

**TODO**

Results
-------

###   Execution time


```r
baseline <- mean(data[data$Conf=="base",]$Time)
stat<-ddply(data,"Conf",summarise,
            N=length(Time),mean=mean(Time),sd=sd(Time),se=sd/sqrt(N),
                speedup=(1-mean/baseline)*100)
p  <- ggplot(stat,aes(x=Conf,y=mean, fill=Conf))
p  <-  p + geom_bar(stat="identity", position=position_dodge(.9) )
p  <-  p + geom_errorbar(aes(ymin=mean-se, ymax=mean+se),
                  width=.2,                    # Width of the error bars
                  position=position_dodge(.9))
p <- p + xlab("Execution type")
p <- p + ylab("Time (s)")
p <- p + ggtitle("Execution time of Streamcluster")
p <- p + guides(fill=guide_legend(title="Configuration"))
# BW theme
p <- p + theme_bw()
p <-  p + theme(panel.grid.minor = element_line(colour = "black", linetype="dashed", size = 0.1),
        panel.grid.major = element_line(colour = "black", size = 0.1),
        legend.position="bottom")
p <- p + scale_fill_grey()
#p <- p+ theme(legend.position="none")
show(p)
```

```
## Error in eval(expr, envir, enclos): could not find function "show"
```

```r
ggsave("figure/ExecutionTime.pdf", width=10, height=10)
```

Detailled Values:


```
## Error in eval(expr, envir, enclos): could not find function "show"
```

Paper image
-----------


```
## Error in eval(expr, envir, enclos): could not find function "show"
```

```
## Error in eval(expr, envir, enclos): could not find function "show"
```

```
## Saving 4.69 x 4.69 in image
```

Conclusions
-----------

**TODO**


