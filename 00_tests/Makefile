FC = gfortran
CAF = caf
SRC = $(wildcard src/*.f90)
FILES_NO_EXT = $(notdir $(SRC))
TARGETS = $(addprefix app/,$(FILES_NO_EXT:.f90=))
MOD_SRC = $(wildcard src/mod/*.f90)
MOD_TARGETS = $(addprefix app/mod/,$(notdir $(MOD_SRC:.f90=.mod)))
ARGS = -ffree-form -fimplicit-none -O3 -L/opt/OpenBLAS/lib -fbacktrace

all: $(TARGETS)


app/parallel: src/parallel.f90
# Test it with -Ofast
	$(FC) -fopenmp -O3 -o $@ $<

app/loop_speed: src/loop_speed.f90
	$(FC) -cpp -fopenmp -O3 -o $@ $<

app/random_generator: src/random_generator.f90
	$(FC) -cpp -fopenmp -O3 -o $@ $<

app/open_blas: src/open_blas.f90
	$(FC) $< $(ARGS) -lopenblas -lpthread -o $@

app/coarrays: src/coarrays.f90
	$(CAF) $< -o $@
#$(FC) $@.f90 -fcoarray=lib -lcaf_openmpi -o $@
#ifort -free -coarray $@.f -o $@
#Alternative library $(FC) $@.f90 -fcoarray=lib -lcaf_mpich -o $@
#To run the program: cafrun -np 4 ./$@

app/pi_sum: src/pi_sum.f90
	$(CAF) $< -o $@
#To run the program: cafrun -np 4 ./$@

# Generic case
app/%: src/%.f90
	$(FC) $(ARGS) -o $@ $<

clean:
	@rm -f $(TARGETS)
	@rm -f app/mod/*.mod app/mod/*.o

