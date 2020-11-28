FC = gfortran
SRC = $(wildcard *.f90)
TARGETS = $(addprefix build/,$(SRC:.f90=))
ARGS = -Wall -Wextra -std=f2018 -O3 -pedantic -fdec-math
PWD = $(shell pwd)

all: build $(TARGETS)

build:
	@mkdir build

build/%: %.f90
	$(FC) $(notdir $@).f90 -I./build -o $@

clean:
	@rm -f build/*
