FC = gfortran
SRC = $(wildcard *.f90)
TARGETS = $(addprefix bin/,$(SRC:.f90=))
ARGS=-fopenmp

parallel: bin/02 bin/02p
	./mide.sh 02

all: bin $(TARGETS)
	./mide.sh 01

bin/%: %.f90
	$(FC) $(ARGS) -o $@ $<

bin:
	mkdir -p bin

push:
	git push origin main

clean:
	rm -f bin/*
