#!/bin/bash

#Kontrollime kas phpmyadmin on juba olemas
PMA=$(dpkg-query -W -f='$(Status)' phpmyadmin 2>/dev/null | grep -c 'ok installed')
# Kui PMA puudub
if [ $PMA -eq 0 ]; then
	#phpmyadmin puudub ning see paigaldatakse
	echo "phpmyadmin paigaldatakse"
	apt install phpmyadmin
	echo "phpmyadmin on olemas"
# Kui PMA on olemas
elif [ $PMA -eq 1 ]; then
	# siis teenus on olemas
	echo "phpmyadmin on olemas"
# tingimus loppeb
fi
#skript on labi
