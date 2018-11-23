#! /bin/bash

tput setaf 2
for line in {1..10}
do
	for column in {1..80}
	do
		echo -n "#"
	done
	echo " "
done


