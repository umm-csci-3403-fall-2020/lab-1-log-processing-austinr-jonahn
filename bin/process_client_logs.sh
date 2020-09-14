#!/usr/bin/env bash
# A script to format files thats takes a directory as a parameter

##Constant##
DIR="$1"
curDir=$(pwd)
##MAIN##
#Merging all of the files together
cd "$DIR" || exit
#This section was figured out with the help of cookie and robert with the tool the posted in slack
#Throwing the organised items straight into thenew file
#Invalid user
cat var/log/* | awk -F "[: ]+" '/Failed password for invalid user/{print $1, $2, $3, $(NF-5), $(NF-3)}' > failed_login_data.txt
#valid user
cat var/log/* | awk -F "[: ]+" '/Failed password for/{print $1, $2, $3, $(NF-5), $(NF-3)}' > failed_login_data.txt
cd "$curDir" || exit
#End of script
#Also fun fact lots of time could have been saved if i spelt password correctly
