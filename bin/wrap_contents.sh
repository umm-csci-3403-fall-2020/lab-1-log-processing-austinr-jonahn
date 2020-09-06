#!/usr/bin/env bash
#Shell script to wrap the contents of files in the correct order
#This was copied and pasted from pre-lab-1-robi1467

#Variables
ToWrap=$1
Specify=$2
Result=$3

#MAIN
cat "$Specify"_header.html "$ToWrap" "$Specify"_footer.html > "$Result"
#To my understanding cat is combbining the files in the order that they are placed in a specific file
