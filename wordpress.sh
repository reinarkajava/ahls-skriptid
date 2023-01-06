#!/bin/bash -e
clear
#Küsime andmebaasi ja kasutajanime koos salasõnaga
echo "Andmebaasi Nimi: "
read -e dbname
echo "Andmebaasi Kasutaja: "
read -e dbuser
echo "Andmebaasi Salasõna: "
read -s dbpass
echo "Install? (y/n)"
read -e run
if [ "$run" == n ] ; then
exit
#Valitakse kas programm jooksutada või mitte
else
echo "Wordpress installitakse"
# wordpress laetakse alla
curl -O https://wordpress.org/latest.tar.gz
# wordpress paigaldatakse
tar -zxvf latest.tar.gz
#asukoht vahetatakse
cd wordpress
#copy file to parent dir
cp -rf . ..
cd ..
rm -R wordpress
#WP conf luuakse
cp wp-config-sample.php wp-config.php
#Andmebaasi muudatused
perl -pi -e "s/database_name_here/$dbname/g" wp-config.php
perl -pi -e "s/username_here/$dbuser/g" wp-config.php
perl -pi -e "s/password_here/$dbpass/g" wp-config.php

perl -i -pe'
  BEGIN {
    @chars = ("a" .. "z", "A" .. "Z", 0 .. 9);
    push @chars, split //, "!@#$%^&*()-_ []{}<>~\`+=,.;:/?|";
    sub salt { join "", map $chars[ rand @chars ], 1 .. 64 }
  }
  s/put your unique phrase here/salt()/ge
' wp-config.php

mkdir wp-content/uploads
chmod 775 wp-content/uploads
echo "Wordpress on paigaldatud"
fi
