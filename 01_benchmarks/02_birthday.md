# The birthday paradox

## Introduction

There is a planet whose years have `n_days` days. In this planet there are `n_people` 
people, so, calculates in extent all possible cases. What is the probability that two people
were born on the same day?

As you may know, in probability theory, the birthday problem or birthday paradox 
concerns the probability that, in a set of n randomly chosen people, some 
pair of them will have the same birthday. [Wikipedia](https://en.wikipedia.org/wiki/Birthday_problem)

The probability problem has a well known solution but this algorithm gets all
possibilities where two or more people have been born the same day.

## The data structure

This is the vector `v`. Its size is equal to the number of people in the planet. 
Each item in the *vector* represents the day each person was born. So **an example**:


```
 Person:          1     2     3     4     5    ...  n_people
               ---------------------------------------------
 Vector:: v    |  1  |  4  |  1  |  7  |  6  | ... |   5   |
               ---------------------------------------------
                  ^     ^     ^     ^     ^     ^     ^
                               Day of birthday

 size(v) == n_people
 v(1) == Day of the year in which person 1 was born
 v(2) == Day of the year in which person 2 was born
 ...
 v(n) == Day of the year in which person 'n' was born

 The numbers in the vector are in the range `1...n_days`

```

## The process

It consists in testing all combinations in the vector `v` and test if there are two or more
people who were born the same day.

## My system

This is the information about my system:

- CPU Model: 6.78.3 "Intel(R) Core(TM) i3-6006U CPU @ 2.00GHz"
- Memory Size: 3 GB + 768 MB
- Ubuntu 20.04.1 LTS (Focal Fossa)
- Linux kernel 5.4.0-42-generic

## Results

Execution time using `$ time ` from command line:

### GNU Fortran

Compiled with *gnu gfortran 9.3.0* with the command:

`gfortran -O3 test.f90 -o test`

- Gnu Fortran recursive	0m 42s

### Intel Fortran

Compiled with *Intel Fortran 19.1.2.254* with the command:

`ifort -O3 test.f90 -o test`

- Intel Fortran recursive 2m 14s

### Julia

Executed with *Julia 1.4.1* with the command:

`julia -O3 test.jl`

- Julia recursive 1m 32s

There are some improvements received from the Julia
[discourse forum](https://discourse.julialang.org/t/the-birthday-paradox-help-to-be-faster-than-fortran/44809).
The new code is much faster than before, but it is still far from *Fortran*.

- Renamed function: add1_recursive() -> next_iteration()
- Vector `v` now is a static array
- No bounds checked inside loops of same_day() function
- No bounds checked inside loops of next_iteration() function
- Added a `goto` statement to take a shortcut
- Added `return nothing` at the end of next_iteration()
- Removed old progress system and added new @showprogress
- Removed parameter `n_people` in function same_day() to avoid mistakes
