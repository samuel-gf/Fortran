FC = gfortran
SRC = $(wildcard *.f90)
TARGET = $(SRC:.f90=)
ARGS =-ffree-form -fimplicit-none 
OPEN_BLAS=-L/opt/OpenBLAS/lib

all: $(TARGET)

# Caso genérico
%: %.f90
	@$(FC) $(ARGS) -o $@ $<

clean:
	@rm -f $(TARGET)
	@rm -f *.mod *.o

