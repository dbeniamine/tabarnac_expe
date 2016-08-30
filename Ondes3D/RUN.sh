#make clean && make

export TIME="%e"

for nt in 4 8 16 32 64; do

	for s in $(seq 1 10); do
		echo $nt - $s ORACLE
		export OMP_NUM_THREADS=$nt
		export GOMP_CPU_AFFINITY=0,4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,1,5,9,13,17,21,25,29,33,37,41,45,49,53,57,61,2,6,10,14,18,22,26,30,34,38,42,46,50,54,58,62,3,7,11,15,19,23,27,31,35,39,43,47,51,55,59,63
		export GOMP_CPU_AFFINITY=0-63
		/usr/bin/time ./probe.x 502 502 502 4 2>>$nt.total.out 1>>$nt.parallel.out
	done

done
