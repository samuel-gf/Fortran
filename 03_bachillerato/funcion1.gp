#!/usr/bin/gnuplot -p
set datafile fortran
set title "Función 1"
set xlabel "x"
set ylabel "y"
set grid 
set style line 1 linewidth 2 linecolor rgb 'red'
plot "data/funcion1.dat" using 1:2 title 'f(x)=e^x' linestyle 1 with lines
