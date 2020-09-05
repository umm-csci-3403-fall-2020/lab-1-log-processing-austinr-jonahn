#!/usr/bin/env bash
# A script to format files

##Constant##
DIR="$1"

##MAIN##
#Merging all of the files together
cd "$DIR" || exit
#In the middle of this is where the filtering can be done with awk, just not sure how to do it...
cat var/log/* > failed_login_data.txt

