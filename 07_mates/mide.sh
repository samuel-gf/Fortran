#!/bin/bash
MAX=5000
echo "PROCESO PARALELO" 
time ./bin/$1p $MAX 1>/dev/null

echo " "
echo "PROCESO NO PARALELO"
time ./bin/$1 $MAX 1>/dev/null
