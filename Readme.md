This repository contains the scripts used to run the experiments presented in
[TABARNAC: visualizing and resolving memory access issues on NUMA architectures](https://dl.acm.org/citation.cfm?id=2835239).
It also hosts the the filtered results and the analysis scripts required to redo the statistic analys.

# Experiments

## IS

This experiment aims at evualating the different version of IS.
The directory contains the full raw traces.

The experiment trace is organized as follow:

    IS/
        exp.log                     # Log file
        perf_test.sh                # Script used to run the experiment
        parseAndPlot.sh             # Script used to extract the filtered trace
        analysis.rmd                # Script used to do the statistical analysis
        results.csv                 # Filtered results
        affinity-*/                 # Raw traces with/out affinity
            interleave-*/           # Runs With/out interleave
                balancing-*/        # Runs With/out NUMA balancing



## Ondes3D

This experiment aims at evualating the different version of Ondes3D.
The directory contains the full raw traces.

The experiment trace is organized as follow:

    Ondes3D/
        exp.log                     # Log file
        perf_test.sh                # Script used to run the experiment
        parseAndPlot.sh             # Script used to extract the filtered trace
        analysis.rmd                # Script used to do the statistical analysis
        results.csv                 # Filtered results
        interleave/                 # Raw traces for interleave policy
        balancing/                  # Raw traces for NUMA balancing
        base/                       # Raw traces for base
        tabarnac/                   # Raw traces for modified version

## Overhead

This experiment aims at measuring Tabarnacs overhead, it has been executed on two machines: [Idfreeze](http://digitalis.inria.fr/index.php/Idfreeze) from [digitalis](http://digitalis.inria.fr/index.php/Idfreeze) and Turing, one of the machines of the [Informatica](http://www.inf.ufrgs.br/) team from the [UFRGS](http://www.ufrgs.br).
These machines are described in the paper and in the log files.

The full traces are available at Zenodo
<a href="http://dx.doi.org/10.5281/zenodo.61154"><img src="https://zenodo.org/badge/doi/10.5281/zenodo.61154.svg" alt="10.5281/zenodo.61154"></a>.



The experiment trace is organized as follow:

    Overhead/
        Global_results/                                 # Scripts and traces summarizing each of the sub experiment
        perf_test_tabarnac_*/                           # Partial traces (one set of run)
        perf_test_tabarnac_*/exp.log                    # Log file
        perf_test_tabarnac_*/perf_test_tabarnac.sh      # Script used to run the experiment
        perf_test_tabarnac_*/parseAndPlot.sh            # Script used to extract the filtered trace
        perf_test_tabarnac_*/analysis.rmd               # Script used to do the statistical analysis
        perf_test_tabarnac_*/results.csv                # Filtered results
