FC = gfortran
SRC = $(wildcard *.f90)
TARGETS = $(addprefix bin/,$(SRC:.f90=))


all: bin $(TARGETS)

bin/%: %.f90
	$(FC) $(ARGS) -o $@ $<


bin:
	mkdir -p bin

clean:
	rm -f bin/*
