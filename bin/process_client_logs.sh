#!/usr/bin/env bash
# A script to format files

##Constant##
DIR="$1"

##MAIN##
#Merging all of the files together
cd "$DIR" || exit
#Combining the directory into one temp file, Cookie Vang helped with this idea
cat *var/log/* > combinedTempFile.txt

# awk for failed login attempts that are actual user names in the lab


