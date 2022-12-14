#!/bin/bash
#Webserveri paigaldus

sudo apt update
sleep 10
sudo apt upgrade
#Kui apache ei ole paigaldatud
apache2=$(dpkg-query -W -f='$(Status)' apache 2 2>/dev/null | grep -c "Installed")
if [ $apache2 -eq 0 ]; then
       echo "Apache2 paigaldatakse"
       sudo apt install apache2
       echo "Apache2 on paigaldatud"
       service apache2 status
       

#Kui apache on juba paigaldatud
elif [ $apache2 -eq 1 ]; then
       #Apache2 on olemas
       echo "Apache2 on juba paigaldatud"
#Apache käivitus ja staatuse näitamine
       service apache2 start
       service apache2 status
fi

