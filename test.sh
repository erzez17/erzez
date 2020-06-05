#! /bin/bash
url=$1

erez=$(curl -s "http://$url/isalive")
if [ "$erez" = "true" ]
then
	echo "true"
	exit 0
else
	echo  "false"
	exit 1
fi 

