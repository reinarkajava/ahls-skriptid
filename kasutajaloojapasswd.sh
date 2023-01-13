#!/bin/bash
# Kasutajate loomise skript
fail=$1
passwd=$2
for kasutaja in $(cat $fail)
        do
		useradd $kasutaja -m -s /bin/bash
        done

for salasona in $(cat $passwd)
	do
		#useradd -m -p $passwd $kasutaja

		echo "$kasutaja:$salasona" | chpasswd
	done
