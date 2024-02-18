#!/bin/awk -f
BEGIN{
	FS = " +"
	total = 0
	N_MESES = 22 # Parámetro que indica cuantos meses se han pagado
	}

NR >= 1 && NR <= N_MESES+1{
	total += $9
	printf "%2d %9.2f %9.2f\n", $3, $9, total
	}

END{
	print "--------"
	printf "%-12s %9.2f\n", "Valor", (total/2)+6000
	printf "Pagado en estos %d meses, dividido entre 2 y sumado los 6000", N_MESES
	}
