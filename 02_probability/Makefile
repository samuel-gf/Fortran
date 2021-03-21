FC = gfortran
CAF = caf
SRC = $(wildcard src/*.f90)
FILES_NO_EXT = $(notdir $(SRC))
TARGETS = $(addprefix app/,$(FILES_NO_EXT:.f90=))

# Modules
MOD_SRC = $(wildcard src/mod/*.f90)
MOD_TARGETS = $(addprefix app/mod/,$(notdir $(MOD_SRC:.f90=.mod)))

# Arguments
#ARGS = -Wall -Wextra -std=f2018 -O3 -pedantic -fdec-math -ffree-form -Imod
ARGS = -std=f2018 -ffree-form -Imod


all: dir_app $(TARGETS)

# Make target directory
dir_app:
	@mkdir -p app

# Module dados
mod/mod_dados.o: src/mod_dados.f90
	$(FC) -c $< -Jmod -o $@

# Caso genérico
app/%: src/%.f90 src/mod_dados.f90
	$(FC) $(ARGS) mod/mod_dados.o $< -o $@

clean:
	@rm -f $(TARGETS)
	@rm -f mod/*.mod mod/*.o
