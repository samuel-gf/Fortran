FC = gfortran
SRC = $(wildcard *.f90)
TARGETS = $(addprefix app/,$(SRC:.f90=))
ARGS = -Wall -Wextra -std=f2018 -O3 -pedantic -fdec-math
PWD = $(shell pwd)
DIR_FLAGS = -I./mod -J./mod

all: app $(TARGETS)

mod/mod_dados.o: mod_dados.f90
	gfortran -c -O3 mod_dados.f90
	mv mod_dados.mod mod_dados.o mod

app:
	@mkdir app

app/%: mod/mod_dados.o %.f90
	$(FC) $(DIR_FLAGS) -c $(notdir $@).f90
	$(FC) $(DIR_FLAGS) ./mod/mod_dados.o $(notdir $@).o -o $(notdir $@)
	@mv $(notdir $@) app
	@rm $(notdir $@).o

clean:
	@rm -f app/*
	@rm -f *.o *.mod
