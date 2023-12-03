MOD=$(addsuffix .o,$(addprefix ../mod/,$(basename $(wildcard mod_*))))
SRC=$(wildcard [0-9]*.f90)
TGT=$(addprefix ../bin/,$(basename $(SRC)))

.PHONY: exec

all: ../mod ../bin $(MOD) $(TGT) exec

../bin/%: %.f90
	@expand -t4 $< | sponge $<
	ifx -o $@ -I ../mod ../mod/mod_utils.o $<

../mod/mod_%.o: mod_%.f90
	ifx -c -o $(basename $<).o $<
	@mv $(basename $<).mod ../mod
	@mv $(basename $<).o ../mod

../mod:
	mkdir ../mod

../bin:
	mkdir ../bin

exec:
	@../bin/01a

clean:
	rm -f ../mod/* ../bin/*
