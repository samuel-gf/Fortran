# Intro

After ~~fighting~~ happily testing some code I am not able to interpret these results, can you help me, please. This is the code https://github.com/profesors/Fortran/blob/master/00_toma_de_contacto/loop_speed.f90

# Cases
- Case 1: Loop optimization. Best results
```
do j = 1, __ROWS
  do i = 1, __COLUMNS
    a(i, j) = sqrt(real(i+j))
  end do
end d
```

- Case 2: Worst results
```
do i = 1, __COLUMNS
  do j = 1, __ROWS
    a(i, j) = compute(i, j)
  end do
end do
```

- Case 3: Medium results, but this should be the best results, why?
```
!$OMP DO
  do j = 1, __ROWS
    do i = 1, __COLUMNS
      a(i, j) = compute(i, j)
    end do
  end do
!$OMP END DO
```

# Compilation in Makefile
```
loop_speed: loop_speed.f90
	gfortran $@.f90 -cpp -fopenmp -O3 -o $@ 
```

# Results
```
Case 1:   6.0 nano seconds
Case 2:   4.0 nano seconds
Case 3:   5.0 nano seconds
Write to file squares.dat ... done.
STOP 0
```

# How many CPUs do I have?

Let's check it up
    $ lscpu | egrep 'Model name|Socket|Thread|NUMA|CPU\(s\)'

```
CPU(s):                              4
Lista de la(s) CPU(s) en línea:      0-3
«Socket(s)»                          1
Modo(s) NUMA:                        1
CPU(s) del nodo NUMA 0:              0-3
```


# The question

So, I can not understand the results, can you help me? please
