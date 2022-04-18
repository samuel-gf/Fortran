FC=gfortran


# Arguments gfortran
#ARGS = -Wall -Wextra -std=f2018 -O3 -pedantic -fdec-math -ffree-form
ARGS = -std=f2018 -ffree-form

run: cuota_mes

hipoteca: hipoteca.f
	$(FC) $(ARGS) -o hipoteca hipoteca.f

cuota_mes: cuota_mes.f
	$(FC) $(ARGS) -o cuota_mes cuota_mes.f

clean:
	rm -f hipoteca cuota_mes
