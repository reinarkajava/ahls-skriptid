#!/bin/bash
# Kasutajate loomise skript 
fail=$1
for kasutaja in $(cat $fail)
	do
		#Parameetriks lisatud failist loetakse kõik read ja neid kasutatakse kasutaja.sh skriptis parameetritena
		source ./kasutaja.sh $kasutaja
	done


