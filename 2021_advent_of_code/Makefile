FC = gfortran
SRC = $(wildcard src/*.f)
FILES_NO_EXT = $(notdir $(SRC))
TARGETS = $(addprefix bin/,$(FILES_NO_EXT:.f=))


# Arguments gfortran
#ARGS = -Wall -Wextra -std=f2018 -O3 -pedantic -fdec-math -ffree-form
ARGS = -std=f2018 -ffree-form
# Arguments ifort
#ARGS = -free


all: mod_utils bin/01 $(TARGETS)

bin/mod_utils.mod: src/mod_utils.f
	$(FC) $(ARGS) -c -o $@ $<
	mv mod_utils.mod bin

bin/01: bin/mod_utils.mod src/01.f
	$(FC) $(ARGS) -o $@ $<

run: clear_screen bin/01
	./bin/01

clear_screen:
	clear

clean:
	@rm -f bin/*
