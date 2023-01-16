#!/bin/bash
DATE=$(date +%d-%m-%Y)
BACKUP_DIR="/home_bcp"

#To create a new directory in the backup directory location


#To backup user's home directory

for user in `more /root/ahls/kasutajad.txt`
	do
		tar -zcvpf $BACKUP_DIR/$user-$DATE.tar.gz /home/$user
	done
