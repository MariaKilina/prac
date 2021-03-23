.PHONY:	all test plot

all: clean test

clean:
	rm -rf *.txt *.err *.out
t1: task1.cpp
	g++ -o t1 -fopenmp task1.cpp
test:	t1
	mpisubmit.pl -t 1 ./t1 1 20 1 ex_time1.txt
	mpisubmit.pl -t 2 ./t1 2 20 1 ex_time1.txt
	mpisubmit.pl -t 4 ./t1 4 20 1 ex_time1.txt
	mpisubmit.pl -t 8 ./t1 8 20 1 ex_time1.txt
	
	mpisubmit.pl -t 1 ./t1 1 24 1 ex_time1.txt
	mpisubmit.pl -t 2 ./t1 2 24 1 ex_time1.txt
	mpisubmit.pl -t 4 ./t1 4 24 1 ex_time1.txt
	mpisubmit.pl -t 8 ./t1 8 24 1 ex_time1.txt
	
	mpisubmit.pl -t 1 ./t1 1 28 1 ex_time1.txt
	mpisubmit.pl -t 2 ./t1 2 28 1 ex_time1.txt
	mpisubmit.pl -t 4 ./t1 4 28 1 ex_time1.txt
	mpisubmit.pl -t 8 ./t1 8 28 1 ex_time1.txt
	
	mpisubmit.pl -t 1 ./t1 1 30 1 ex_time1.txt
	mpisubmit.pl -t 2 ./t1 2 30 1 ex_time1.txt
	mpisubmit.pl -t 4 ./t1 4 30 1 ex_time1.txt
	mpisubmit.pl -t 8 ./t1 8 30 1 ex_time1.txt
	
	mpisubmit.pl -t 1 ./t1 1 20 7 ex_time7.txt
	mpisubmit.pl -t 2 ./t1 2 20 7 ex_time7.txt
	mpisubmit.pl -t 4 ./t1 4 20 7 ex_time7.txt
	mpisubmit.pl -t 8 ./t1 8 20 7 ex_time7.txt
	
	mpisubmit.pl -t 1 ./t1 1 24 7 ex_time7.txt
	mpisubmit.pl -t 2 ./t1 2 24 7 ex_time7.txt
	mpisubmit.pl -t 4 ./t1 4 24 7 ex_time7.txt
	mpisubmit.pl -t 8 ./t1 8 24 7 ex_time7.txt
	
	mpisubmit.pl -t 1 ./t1 1 28 7 ex_time7.txt
	mpisubmit.pl -t 2 ./t1 2 28 7 ex_time7.txt
	mpisubmit.pl -t 4 ./t1 4 28 7 ex_time7.txt
	mpisubmit.pl -t 8 ./t1 8 28 7 ex_time7.txt
	
	mpisubmit.pl -t 1 ./t1 1 30 7 ex_time7.txt
	mpisubmit.pl -t 2 ./t1 2 30 7 ex_time7.txt
	mpisubmit.pl -t 4 ./t1 4 30 7 ex_time7.txt
	mpisubmit.pl -t 8 ./t1 8 30 7 ex_time7.txt
	
	mpisubmit.pl -t 1 ./t1 1 20 20 ex_timen.txt
	mpisubmit.pl -t 2 ./t1 2 20 20 ex_timen.txt
	mpisubmit.pl -t 4 ./t1 4 20 20 ex_timen.txt
	mpisubmit.pl -t 8 ./t1 8 20 20 ex_timen.txt
	
	mpisubmit.pl -t 1 ./t1 1 24 24 ex_timen.txt
	mpisubmit.pl -t 2 ./t1 2 24 24 ex_timen.txt
	mpisubmit.pl -t 4 ./t1 4 24 24 ex_timen.txt
	mpisubmit.pl -t 8 ./t1 8 24 24 ex_timen.txt
	
	mpisubmit.pl -t 1 ./t1 1 28 28 ex_timen.txt
	mpisubmit.pl -t 2 ./t1 2 28 28 ex_timen.txt
	mpisubmit.pl -t 4 ./t1 4 28 28 ex_timen.txt
	mpisubmit.pl -t 8 ./t1 8 28 28 ex_timen.txt
	
	mpisubmit.pl -t 1 ./t1 1 30 30 ex_timen.txt
	mpisubmit.pl -t 2 ./t1 2 30 30 ex_timen.txt
	mpisubmit.pl -t 4 ./t1 4 30 30 ex_timen.txt
	mpisubmit.pl -t 8 ./t1 8 30 30 ex_timen.txt
plot:
