# What

*Julia* and *Fortran* code to test their speed.

# Why

It can be useful for people who is starting with *Fortran*

# Results

## First test

This was my first test, as you can see, results are disappointing.
```
Round 1.0 Fight (obsolete)
--------------------------

FORTRAN
real	0m1,235s

JULIA
real	0m0,470s

```

## Second test

So I decided to compile my own `libblas.a`. First I downloaded from
[https://netlib.org](https://www.netlib.org/blas/) and easily compiled it. Then I moved to my
`/usr/local/lib` directory and these are the results. Much better but these are not the results I am
looking for.

```
Round 1.1 Fight
--------------

FORTRAN
real	0m0,663s
user	0m0,647s
sys     0m0,016s

JULIA
real	0m0,477s
user	0m0,694s
sys     0m0,298s
```

## Final test

After following the advises of [Ikedward](https://fortran-lang.discourse.group/u/lkedward) I
downloaded [OpenBlas](https://www.openblas.net/). It was really easy to compile. After that, I
tested both dynamic and static compilation. Finally I got these results:

```
Round 1.2. Fight!
-----------------

FORTRAN
real	0m0,102s
user	0m0,277s
sys     0m0,087s

JULIA
real	0m0,485s
user	0m0,663s
sys     0m0,329s
```
