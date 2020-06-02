#! /bin/bash
url=$1

erez=$(curl -s "$url/isalive")
if [ "$erez" = "true" ]
then
	echo "true"
else
	echo  "false"
fi 

