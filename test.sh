#! /bin/bash
url=$1

erez=$(curl -s "http://$url/isalive")
if [ "$erez" = "true" ]
then
	echo "Test was successfull!!"
	exit 0
else
	echo  "Test Failed!!"
	exit 1
fi 

