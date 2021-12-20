FC=gfortran
MODULE=obj/mod_utils.o mod_utils.mod
TARGETS=01a 01b


# Arguments gfortran
#ARGS = -Wall -Wextra -std=f2018 -O3 -pedantic -fdec-math -ffree-form
ARGS = -std=f2018 -ffree-form
# Arguments ifort
#ARGS = -free


all: $(addprefix bin/,$(TARGETS))

$(MODULE): src/mod_utils.f
	$(FC) $(ARGS) -c -o obj/mod_utils.o $<


# TARGET=01a, 01b, 02a, ...
bin/%: TARGET=$(notdir $@)
bin/%: src/%.f $(MODULE) 
	$(FC) $(ARGS) -c -o obj/$(TARGET).o $<
	$(FC) $(ARGS) -o bin/$(TARGET) obj/$(TARGET).o obj/mod_utils.o


run: clear_screen bin/01a
	./bin/01a

clear_screen:
	clear

clean:
	rm -f bin/* obj/*
	rm -f *.mod *.o
