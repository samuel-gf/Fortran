# Reverse complement

Source: https://benchmarksgame-team.pages.debian.net/benchmarksgame/description/revcomp.html#revcomp

## Problem to be solved

We ask that contributed programs not only give the correct result, but also use the 
same algorithm to calculate that result.

Each program should:

- read line-by-line a redirected FASTA format file from stdin

	(grow the data, buffered-read by buffered-read; don't get the size and make a single allocation.)

- for each sequence:

	write the id, description, and the reverse-complement sequence in FASTA format to stdout 

Use these code complements:

code  meaning   complement
A    A                   T
C    C                   G
G    G                   C
T/U  T                   A
M    A or C              K
R    A or G              Y
W    A or T              W
S    C or G              S
Y    C or T              R
K    G or T              M
V    A or C or G         B
H    A or C or T         D
D    A or G or T         H
B    C or G or T         V
N    G or A or T or C    N


## Julia

Source: https://benchmarksgame-team.pages.debian.net/benchmarksgame/program/revcomp-julia-8.html

## Fortran

Source: https://benchmarksgame-team.pages.debian.net/benchmarksgame/program/revcomp-ifc-1.html
