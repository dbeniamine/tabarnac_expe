#!/bin/bash
START_TIME=$(date +%y%m%d_%H%M%S)
CMDLINE="$0 $@"
EXP_NAME=$(basename $0 .sh)
OUTPUT="exp.log"
OWNER=david
RUN=15
CONFIGS=('base' 'tabarnac' )
export PATH=$PATH:/opt/pin
NAS="/home/dbeniamine/NPB3.3-OMP/"
#PINPATH="/home/david/install/bin/"
#export PATH=$PINPATH:$PATH
TABARNACPATH="/home/dbeniamine/tabarnac"
declare -A TARGET
TARGET=([base]="" [tabarnac]="$TABARNACPATH/tabarnac -r -- ")
#report error if needed
function testAndExitOnError
{
    err=$?
    if [ $err -ne 0 ]
    then
        echo "ERROR $err : $1"
        exit $err
    fi
}
function dumpInfos
{

    #Echo start time
    echo "Expe started at $START_TIME"
    #Echo args
    echo "#### Cmd line args : ###"
    echo "$CMDLINE"
    echo "EXP_NAME $EXP_NAME"
    echo "OUTPUT $OUTPUT"
    echo "RUN $RUN"
    echo "########################"
    # DUMP environement important stuff
    echo "#### Hostname: #########"
    hostname
    echo "#### Path:     #########"
    echo "$PATH"
    echo "########################"
    echo "##### git log: #########"
    git log | head
    echo "########################"
    echo "#### git diff: #########"
    git diff
    echo "########################"
    lstopo --of txt
    cat /proc/cpuinfo
    echo "########################"


    #DUMPING scripts
    cp -v $0 $EXP_DIR/
    cp -v ./*.sh $EXP_DIR/
    cp -v *.pl $EXP_DIR/
    cp -v *.rmd  $EXP_DIR/
    cp -v Makefile  $EXP_DIR/
}
#if [ $(whoami) != "root" ]
#then
#    echo "This script must be run as root"
#    exit 1
#fi
#lockmachine "exp in progress"
#testAndExitOnError "can't lock machine"
#parsing args
while getopts "ho:e:r:" opt
do
    case $opt in
        h)
            usage
            exit 0
            ;;
        e)
            EXP_NAME=$OPTARG
            ;;
        o)
            OUTPUT=$OPTARG
            ;;
        r)
            RUN=$OPTARG
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done
#post init
EXP_DIR="$EXP_NAME"_$(date +%y%m%d_%H%M)
mkdir $EXP_DIR
OUTPUT="$EXP_DIR/$OUTPUT"

#Continue but change the OUTPUT
exec > >(tee $OUTPUT) 2>&1
dumpInfos

#Do the first compilation
cd $NAS
make clean
make suite
rm bin/*.x
cd -


for run in $(seq 1 $RUN)
do
    echo "RUN : $run"
    #Actual exp
    for bench in $(\ls $NAS/bin)
    do
        echo "$bench"
        LOGDIR="$EXP_DIR/$bench/run-$run"
        mkdir -p $LOGDIR
        #Actual experiment
        for conf in ${CONFIGS[@]}
        do
            set -x
            ${TARGET[$conf]} $NAS/bin/$bench > $LOGDIR/$conf.log 2> $LOGDIR/$conf.err
            set +x
            testAndExitOnError "run number $run"
        done
        rm -rf ADC.*
    done
done

#cd $EXP_DIR/
#./parseAndPlot.sh
#cd -
#Echo thermal throttle info
echo "thermal_throttle infos :"
cat /sys/devices/system/cpu/cpu0/thermal_throttle/*
END_TIME=$(date +%y%m%d_%H%M%S)
echo "Expe ended at $END_TIME"
#chown -R $OWNER:$OWNER $EXP_DIR
#unlockmachine

