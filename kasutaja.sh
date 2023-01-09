#!/bin/bash

#Kasutaja Loomise skript

#Skripti Algus


#kasutaja sisestab nime
echo "Sisesta Kasutajanimi: "
read Kasutajanimi

#Paar teksti
echo "Luuakse kasutaja nimega $Kasutajanimi koos kataloogiga"
echo "Kasutaja tegemise ajal küsitakse salasõna, aga see eemaldatakse pärast kasutaja loomist automaatselt."
#Kasutaja luuakse, küsitakse muid parameeterid nagu password jne.
sleep 5
adduser $Kasutajanimi
#Eelnevalt lisatud password eemaldatakse
passwd -d $Kasutajanimi
