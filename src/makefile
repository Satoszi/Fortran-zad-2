all: build run

build:
	gfortran -o signals_sum signals_sum.f90 -Ldirectory -lfftw3
	gfortran -o furier_sinus furier_sinus.f90 -Ldirectory -lfftw3

run:
	./signals_sum
	./furier_sinus
