FC=gfortran


# Arguments gfortran
#ARGS = -Wall -Wextra -std=f2018 -O3 -pedantic -fdec-math -ffree-form
ARGS = -std=f2018 -ffree-form

run: hipoteca

hipoteca: hipoteca.f
	$(FC) $(ARGS) -o hipoteca hipoteca.f

clean:
	rm -f hipoteca
