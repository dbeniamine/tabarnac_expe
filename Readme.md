This repository contains the scripts used to run the experiments presented in
[TABARNAC: visualizing and resolving memory access issues on NUMA architectures](https://dl.acm.org/citation.cfm?id=2835239).
It also hosts the the filtered results and the analysis scripts required to redo the statistic analys.

# Experiments

## IS

**TODO**

## Ondes3D

**TODO**

## Overhead

This experiment aims at measuring Tabarnacs overhead, it has been executed on two machines: [Idfreeze](http://digitalis.inria.fr/index.php/Idfreeze) from [digitalis](http://digitalis.inria.fr/index.php/Idfreeze) and Turing, one of the machines of the [Informatica](http://www.inf.ufrgs.br/) team from the [UFRGS](http://www.ufrgs.br).
These machines are described in the paper and in the log files.

The full traces are available at Zenodo **TODO**.

The experiment trace is organized as follow:

    Overhead/
        Global_results/                                 # Scripts and traces summarizing each of the sub experiment
        perf_test_tabanarc_*                            # Partial traces (one set of run)
        perf_test_tabanarc_/exp.log                     # Log file
        perf_test_tabanarc_/perf_test_tabarnac.sh       # Script used to run the experiment
        perf_test_tabanarc_/Parse_and_plot.sh           # Script used to extract the filtered trace
        perf_test_tabanarc_/analysis.rmd                # Script used to do the statistical analysis
