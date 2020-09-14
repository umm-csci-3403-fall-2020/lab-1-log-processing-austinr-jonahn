#!/usr/bin/env bash

#Go into log_files, extract contents on one of the tgz's into a /'name' folder in the top level where name is the name of the tgz
#mkdir scratch

CurDir=$(pwd)
scratch=$(mktemp -d)
for input in "$@" 
	do 
		#Get basename for file
		input2=$(basename "$input" .tgz)
         	mkdir  "$scratch"/"$input2"
		#Untar file
             	tar -xvf "$input" -C "$scratch"/"$input2"
		#Processing client logs
             	./bin/process_client_logs.sh "$scratch"/"$input2"
       	done
#Creating report
./bin/create_username_dist.sh "$scratch"
./bin/create_hours_dist.sh "$scratch"
./bin/create_country_dist.sh "$scratch"
./bin/assemble_report.sh "$scratch"
#moving report to main directory
mv "$scratch"/failed_login_summary.html "$CurDir"
#removing the scratch directory
rm -r "$scratch"

