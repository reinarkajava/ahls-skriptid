#!/bin/bash

#Kasutaja Loomise skript

#Skripti Algus


#kasutaja sisestab nime

#Paar teksti
echo "Luuakse kasutaja nimega $Kasutajanimi koos kataloogiga"
echo "Kasutaja tegemise ajal küsitakse salasõna, aga see eemaldatakse pärast kasutaja loomist automaatselt."
#Kasutaja luuakse, küsitakse muid parameeterid nagu password jne.
sleep 5
#$1 Näitab missugune kasutajanimi antakse loodavale kasutajale. $1 on esimene shelliskriptile edastatud käsurea argument $2 on teine ja nii edasi.
adduser $1
#Eelnevalt lisatud password eemaldatakse
passwd -d $1
