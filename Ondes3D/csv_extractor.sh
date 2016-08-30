#!/bin/bash
echo "Conf, Run, Time" > results.csv
for f in $(find . -name "*.log" | grep -v "exp.log")
do
    v=$(cat $f)
    echo "$f:$v" | sed -e \
        's/\.\/\(.*\)\/run-\(.*\)\/.*\.log:\([0-9]*\)/\1,\2,\3/' >> results.csv
done
