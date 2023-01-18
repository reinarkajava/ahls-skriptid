#!/bin/bash
lahtekaust=$1
cd $lahtekaust
pwd

sihtkaust="/home_bop"

for filename in $(ls $lahtekaust); do
	if [ -f $filename ]; then
            result="$filename is a normal file, do not backup"
	    echo $result
	else
	    if [ -d $filename ]; then
	   	 result="$filename is a directory, do an backup"
	   	 echo $result
	    
	    kuupaev=$(date +"%d.%m.%Y")
	    echo "$lahtekaust$filename/"
	    tar -c -f $filename.$kuupaev.tar $filename/
	    gzip $filename.$kuupaev.tar
	    mv $filename.$kuupaev.tar.gz $sihtkaust

	    fi
    fi
done
