#!/usr/bin/env bash

# Extract username column from failed_login_data.txt, sort with command "sort", run sorted list though "uniq -c" to count, awk to "'username', count" > tempFile.txt, wrap_contents.sh with tempFile.txt
DIR="$1"
curDir=$(pwd)
cd "$DIR" || exit

#Extracting data from failed_login_data and placing it in a temporary file in the main dir
cat ./*/failed_login_data.txt | awk '{print $5}'| sort > "$curDir"/temp.txt
#Combing tge temp file with an ip map file to get the desired output
join  "$curDir"/temp.txt "$curDir"/etc/country_IP_map.txt  | awk '{print $2}' | sort | uniq -c | awk '{ print "data.addRow([\x27"$2"\x27, "$1"]);" }' > tempFile.txt

#Need to hand tempFile.txt to wrap_contents.sh

cd "$curDir" || exit

./bin/wrap_contents.sh \
       "$DIR"/tempFile.txt \
       html_components/country_dist \
       "$DIR"/country_dist.html

rm temp.txt
