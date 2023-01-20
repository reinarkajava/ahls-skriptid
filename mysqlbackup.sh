#!/bin/bash
# What to backup.
backup_files=$1
#SQL Backup
lahtekaust="/home_bcp/"

mkdir $lahtekaust/sql
USER="root"
PASSWORD="qwerty"

#ExcludeDatabases="Database|information_schema|performance_schema|mysql"
databases=`mysql -u $USER -p$PASSWORD -e "SHOW DATABASES;" | tr -d "| "`
db=$2
echo "Creating a dump file for: $db"
mysqldump -u $USER -p$PASSWORD --databases $db > $lahtekaust/sql/`date +%Y%m%d`.$db.sql




for filename in $(ls $lahtekaust); do
        result=
        if [ -f $filename ]; then
                result="$filename is a regular file"
                echo $result
        #Käsud arhiivimiseks
        else
           if [ -d $filename ]; then
		result="$filename is a directory, backingup"
		echo $result
           	kuupaev=`date +%d.%m.%Y`
           	echo $kuupaev
           	tar -c -f $filename.$kuupaev.tar $filename/
           	gzip $filename.$kuupaev.tar
           	mv $filename.$kuupaev.tar.gz $sihtkaust
          fi
        fi
done
