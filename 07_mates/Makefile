FC = ifx
SRC=$(notdir $(wildcard src/[0-9]*.f90))
TGT=$(addprefix bin/,$(basename $(SRC)))
ARGS=-fopenmp -warn all

.PHONY: exec

all: bin out $(TGT)

bin/%: src/%.f90
	@mkdir -p $(dir $@)
	@expand -t4 $< | sponge $<
	$(FC) $(ARGS) -o $@ $<

bin:
	mkdir -p bin

out:
	mkdir -p out

up:
	git add .
	git commit
	git push origin main

clean:
	rm -f bin/*
