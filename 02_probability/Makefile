FC = gfortran
SRC = $(wildcard *.f90)
TARGETS = $(addprefix app/,$(SRC:.f90=))
ARGS = -Wall -Wextra -std=f2018 -O3 -pedantic -fdec-math
PWD = $(shell pwd)

all: app $(TARGETS)

mod_dados.o: mod_dados.f90
	gfortran -c -O3 mod_dados.f90

app:
	@mkdir app

app/%: mod_dados.o %.f90
	$(FC) -c $(notdir $@).f90
	$(FC) mod_dados.o $(notdir $@).o -o $(notdir $@)
	mv $(notdir $@).o app

clean:
	@rm -f app/*
	@rm -f *.o *.mod
