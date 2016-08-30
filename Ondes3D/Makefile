#PAPI=/usr/local/lib/libpapi.so
#LIBS= $(MAI_HOME)/lib/libmai.a -fopenmp -lpthread -lm -lnuma
#CLDFLAGS = $(PAPI)
# the line below defines timers.  if not defined, will attempt to automatically
# detect available timers.  See cycle.h.
# should be set to -DHAVE_PAPI or -DHAVEGETTIMEOFDAY or unset.
#TIMER = -DHAVE_PAPI -DMISS

#MAI_HOME= /home/dupros/mai_v1.5
#/home/grenoble/fdupros/MAi
#/home/dupros/mai_v1.5
#CFLAGS=-I$(MAI_HOME)/include
#CLDFLAGS=$(MAI_HOME)/lib/libmai.a -lnuma -lm

CC=gcc -UPLACE -UMAI -UCYCLIC -DCLASSIC -O3 -fopenmp
CCD=gcc -DPLACE -UMAI -UCYCLIC -DCLASSIC -O3 -fopenmp
#CC=icc  -UPLACE -UMAI -UCYCLIC -DCLASSIC -O2 -openmp

naive-probe:	main.c util.c cycle.h run.h probe_heat.c cycle.h
	$(CC) $(CFLAGS) $(COPTFLAGS) $(TIMER) -UOUTPUT main.c util.c probe_heat.c  $(CLDFLAGS) -o probe
	$(CCD) $(CFLAGS) $(COPTFLAGS) $(TIMER) -UOUTPUT main.c util.c probe_heat.c  $(CLDFLAGS) -o probe-modif

clean:
	rm -f *.o probe	probe_naive
