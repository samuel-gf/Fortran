FC = gfortran
CAF = caf
SRC = $(wildcard *.f90)
TARGET = $(SRC:.f90=)
ARGS = -ffree-form -fimplicit-none -O3 -L/opt/OpenBLAS/lib -fbacktrace

all: $(TARGET)

# Module
mod/factorial.mod: mod/factorial.f90
	$(FC) -c $<
	@mv factorial.mod factorial.o mod

# Use the module
usa_modulo: usa_modulo.f90 mod/factorial.o
	$(FC) $< -I./mod mod/factorial.o -o $@


parallel: parallel.f90 Makefile
# Test it with -Ofast
	$(FC) $@.f90 -fopenmp -O3 -o $@

loop_speed: loop_speed.f90
	$(FC) $@.f90 -cpp -fopenmp -O3 -o $@ 

random_generator: random_generator.f90
	$(FC) $@.f90 -cpp -fopenmp -O3 -o $@ 

julia: julia.f90
	$(FC) $@.f90 $(ARGS) -lopenblas -lpthread -o $@

open_blas: open_blas.f90
	$(FC) $@.f90 $(ARGS) -lopenblas -lpthread -o $@

coarrays: coarrays.f90
	$(CAF) $@.f90 -o $@
#$(FC) $@.f90 -fcoarray=lib -lcaf_openmpi -o $@
#Alternative library $(FC) $@.f90 -fcoarray=lib -lcaf_mpich -o $@
#To run the program: cafrun -np 4 ./$@

pi_sum: pi_sum.f90
	$(CAF) $@.f90 -o $@
#To run the program: cafrun -np 4 ./$@

# Generic case
%: %.f90
	$(FC) $(ARGS) -o $@ $<

clean:
	@rm -f $(TARGET)
	@rm -f *.mod *.o

