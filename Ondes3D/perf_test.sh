#!/bin/bash
START_TIME=$(date +%y%m%d_%H%M%S)
CMDLINE="$0 $@"
EXP_NAME=$(basename $0 .sh)
OUTPUT="exp.log"
OWNER=dbeniamine
RUN=30
EXEC=./bin/is.D
#Interleave
declare -A INTERLEAVECMD
INTERLEAVECMD=([on]="numactl -i all" [off]='')
declare -A PRECMD
PRECMD=([balancing]='sysctl kernel.numa_balancing=1' \
    [interleave]='sysctl kernel.numa_balancing=0' \
    [tabarnac]='sysctl kernel.numa_balancing=0' \
    [base]='sysctl kernel.numa_balancing=0')
CONFIGS=('base' 'balancing' 'interleave' 'tabarnac')
ARGS="502 502 502 4"
declare -A TARGET
TARGET=([base]="./probe" \
    [balancing]="./probe" \
    [interleave]="numactl -i all ./probe" \
    [tabarnac]="./probe-modif")

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
if [ $(whoami) != "root" ]
then
    echo "This script must be run as root"
    exit 1
fi
lockmachine "exp in progress"
testAndExitOnError "can't lock machine"
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

#Remove me
#function res()
#{
#    num=$(printf "%d\n" 0x$(echo "$1" | md5sum | cut -c 1-4))
#    echo "$num"
#}


for run in $(seq 1 $RUN)
do
    echo "RUN : $run"
    #Actual exp
    #Actual experiment
    for conf in ${CONFIGS[@]}
    do
        LOGDIR="$EXP_DIR/$conf/run-$run/"
        mkdir -p $LOGDIR
        ${PRECMD[$conf]}
        ${TARGET[$conf]} $ARGS > $LOGDIR/$conf.log 2> $LOGDIR/$conf.err
        #res $conf> $LOGDIR/$conf.log 2> $LOGDIR/$conf.err
        testAndExitOnError "run number $run"
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
chown -R $OWNER:$OWNER $EXP_DIR
unlockmachine
