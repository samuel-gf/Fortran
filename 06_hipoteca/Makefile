FC=gfortran


# Arguments gfortran
#ARGS = -Wall -Wextra -std=f2018 -O3 -pedantic -fdec-math -ffree-form
ARGS = -std=f2018 -ffree-form

run: hipoteca

hipoteca: hipoteca.f90
	$(FC) $(ARGS) -o $@ $<

clean:
	rm -f hipoteca cuota_mes
