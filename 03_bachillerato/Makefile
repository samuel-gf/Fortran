FC = gfortran
SRC = $(wildcard *.f90)
TARGET = $(addprefix build/,$(SRC:.f90=))
ARGS =-ffree-form -fimplicit-none -fcheck -fbacktrace
OPEN_BLAS=-L/opt/OpenBLAS/lib

all: $(TARGET)

# Caso genérico
build/%: %.f90 
	$(FC) $(ARGS) -o $@ $<

clean:
	@rm -f $(TARGET)
	@rm -f *.mod *.o

