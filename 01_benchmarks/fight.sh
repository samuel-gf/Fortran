#!/bin/bash
echo "Round 1.2. Fight!"
echo "-----------------"
echo
echo "FORTRAN"
(time ./01_blas) 2>&1
echo
echo "JULIA" 
(time julia 01_blas.jl) 2>&1
