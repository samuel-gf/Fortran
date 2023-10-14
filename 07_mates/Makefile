FC = ifx
SRC = $(wildcard *.f90)
TARGETS = $(addprefix bin/,$(SRC:.f90=))
ARGS=-qopenmp

all: bin $(TARGETS)

bin/%: %.f90
	$(FC) $(ARGS) -o $@ $<

bin:
	mkdir -p bin

up:
	git add .
	git commit
	git push origin main

clean:
	rm -f bin/*
