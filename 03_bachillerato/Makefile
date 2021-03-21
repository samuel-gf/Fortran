FC = gfortran
SRC = $(wildcard *.f90)
TARGET = $(addprefix app/,$(SRC:.f90=))
ARGS =-ffree-form -fimplicit-none -fbacktrace
OPEN_BLAS=-L/opt/OpenBLAS/lib

all: $(TARGET)

# Caso genérico
app/%: %.f90 
	$(FC) $(ARGS) -o $@ $<

clean:
	@rm -f $(TARGET)
	@rm -f *.mod *.o

