FC = ifx
SRC = $(wildcard *.f90)
TARGETS = $(addprefix bin/,$(SRC:.f90=))
ARGS=-fopenmp -warn all

all: bin out $(TARGETS)

bin/%: %.f90
	$(FC) $(ARGS) -o $@ $<

bin:
	mkdir -p bin

out:
	mkdir -p out

up:
	git add .
	git commit
	git push origin main

clean:
	rm -f bin/*
