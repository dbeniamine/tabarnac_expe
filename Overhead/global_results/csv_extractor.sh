#!/bin/bash
echo "Machine,Bench,Slowdown,se" > results.csv
regex='"[0-9]*","\([^,]*\)",\([^,]*\),\([^,]*\)'
sub='\1,\2,\3/'
sed -e '1d' -e "s/$regex/Idfreeze (AMD),$sub" \
    ../perf_test_tabarnac_150722_2333/slowdown_factor.csv >> results.csv
sed -e '1d' -e "s/$regex/Turing (Intel),$sub" \
    ../perf_test_tabarnac_150727_1121/slowdown_factor.csv >> results.csv
sed -e '1d' -e "s/$regex/Turing (Intel),$sub" \
    ../perf_test_tabarnac_150425_1909/slowdown_factor.csv >> results.csv


