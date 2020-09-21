FC = gfortran
TARGETS = 01_blas 02_birthday 02_birthday_intel 03_reverse_complement_intel 03_reverse_complement_gcc
DIR_LIB = /usr/local/lib
ARGS = -Wall -Wextra -std=f2018 -O3 -pedantic -L$(DIR_LIB)
PWD = $(shell pwd)

#all: $(TARGETS) fight
all: $(TARGETS)

# Compile Fortan executabel
01_blas: 01_blas.f90
	$(FC) $@.f90 $(ARGS) -lopenblas -pthread -o $@

02_birthday: 02_birthday.f90
	$(FC) $@.f90 $(ARGS) -fopenmp -pthread -o $@

03_my_reverse_complement: 03_my_reverse_complement.f90
	$(FC) $@.f90 -O3 -o $@
	@#$(FC) $@.f90 -O3 -o $@_gcc
	@#ifort $@.f90 -O3 -o $@_intel

# Reset
clean:
	rm -f $(TARGETS)
	rm -f 03_my_reverse_complement 03_reverse_complement 03_my_reverse_complement_gcc

