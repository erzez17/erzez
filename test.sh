#! /bin/bash
url=$1

erez=$(curl -s "http://$url/isalive")
if [ "$erez" = "true" ]
then
	echo "true"
else
	echo  "false"
fi 

