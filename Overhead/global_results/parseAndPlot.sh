#!/bin/bash
#echo "Creating plots directories"
#for d in $(\ls -d *.scn)
#do
#    mkdir -vp $d/plots
#done
echo "Removing old csv files"
rm *.csv
echo "Generating dependencies"
DIRS=('perf_test_tabarnac_150722_2333' 'perf_test_tabarnac_150727_1121' \
    'perf_test_tabarnac_150425_1909')
for dir in ${DIRS[@]}
do
    echo $dir
    cd ../$dir
    ./parseAndPlot.sh
    cd -
done
echo "Creating result csv file"
./csv_extractor.sh
echo "creating plots"
Rscript -e 'require(knitr); knit2html("analyse.rmd")'


cp OverheadPaper.pdf /home/david/Work/Conf/IISWC15/tabarnac/img/tool-ovh.pdf
cp Overhead.pdf /home/david/Work/Seminaires/UFRGS_032015/img/tabarnac_overhead.pdf’
