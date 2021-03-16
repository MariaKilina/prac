.PHONY:	all test plot

all: clean test

clean:
	rm -rf *.txt
t1: task1.cpp
	g++ -o t1 -fopenmp task1.cpp
test:	t1
	mpisubmit.pl -t 1 ./t1 1 20 7
	mpisubmit.pl -t 2 ./t1 2 20 7
	mpisubmit.pl -t 4 ./t1 4 20 7
	mpisubmit.pl -t 8 ./t1 8 20 7
	
	mpisubmit.pl -t 1 ./t1 1 24 7
	mpisubmit.pl -t 2 ./t1 2 24 7
	mpisubmit.pl -t 4 ./t1 4 24 7
	mpisubmit.pl -t 8 ./t1 8 24 7
	
	mpisubmit.pl -t 1 ./t1 1 28 7
	mpisubmit.pl -t 2 ./t1 2 28 7
	mpisubmit.pl -t 4 ./t1 4 28 7
	mpisubmit.pl -t 8 ./t1 8 28 7
	
	mpisubmit.pl -t 1 ./t1 1 36 7
	mpisubmit.pl -t 2 ./t1 2 36 7
	mpisubmit.pl -t 4 ./t1 4 36 7
	mpisubmit.pl -t 8 ./t1 8 36 7
plot:
