MOD=$(addsuffix .o,$(addprefix mod/,$(notdir $(basename $(wildcard src/mod_*)))))
SRC=$(notdir $(wildcard src/[0-9]*.f90))
TGT=$(addprefix bin/,$(basename $(SRC)))

.PHONY: exec

all: mod bin $(TGT) exec

# Source code
bin/%: src/%.f90 in/%.txt $(MOD)
	@expand -t4 $< | sponge $<
	ifx -o $@ -I mod mod/mod_utils.o $<

mod/mod_%.o: src/mod_%.f90
	ifx -c -o $(basename $<).o $<
	@mv $(notdir $(basename $<)).mod mod
	@mv $(basename $<).o mod



# Directories
mod:
	mkdir mod

bin:
	mkdir bin

# Utilities
exec: bin/main
	$<

up:
	git add .
	git commit
	git push origin main

clean:
	rm -f mod/* bin/*
