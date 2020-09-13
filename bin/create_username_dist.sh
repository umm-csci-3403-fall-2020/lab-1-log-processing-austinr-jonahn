#!/usr/bin/env bash
# This is a Shell Script to do some funky things with the usernames of failed login data
###Directories###
DIR=$1
CurDir=$(pwd) 

###Sorting and extracting data
cd "$DIR" || exit
cat ./*/failed_login_data.txt | awk ' {print $4} '| sort | uniq -c |\
	awk ' { print "data.addRow([\x27"$2"\x27, "$1"]);"}' > tempUserName.txt

# Using wrap contentssh to add footer and header to usernames
cd "$CurDir" || exit
./bin/wrap_contents.sh \
	"$DIR"/tempUserName.txt \
       	html_components/username_dist \
	"$DIR"/username_dist.html

# remove temp file
rm "$DIR"/tempUserName.txt
