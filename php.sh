#!/bin/bash

#Skripti algus

#Skript paigaldab PHP teenuse 


#Kontrollitakse kas PHP on juba olemas

PHP=$(dpkg-query -W -f='${Status}' php>/dev/null | grep -c 'ok installed')
# Kui PHP ei ole olemas
if [ $PHP -eq 0 ]; then
	# Kui teenust pole, siis antakse sellest teada ja see paigaldatakse
	echo "PHP paigaldatakse"
	apt install php libapache2-mod-php php-mysql
	echo "PHP on installitud"
# Kui PHP on olemas kuvatakse teade ja PHP versioon
elif [ $PHP -eq 1 ]; then
	echo "PHP on juba installeeritud"
	which php


fi
#Skripti lõpp
