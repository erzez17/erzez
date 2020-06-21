#!/bin/bash

echo $1

func()
{
	for i in "$1"/*; 
	do	
		if [[ ! -d "$i" ]];
		then
			pwd
			echo "$i"
			sed -i 's/three/3/g' "$i"
			if grep -Fxq "six" "$i";
			then
				sed -i 's/six/6/g' "$i"
				shir=$(ls -l "$1" | awk '{print $1}')
				echo "$shir"
			fi
		else
			func "$i" 
		fi
	done
}

func $1
