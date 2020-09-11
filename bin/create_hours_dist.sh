#!/usr/bin/env bash

# Extract username column from failed_login_data.txt, sort with command "sort", run sorted list though "uniq -c" to count, awk to "'username', count" > tempFile.txt, wrap_contents.sh with tempFile.txt
DIR="$1"
curDir=$(pwd)
cd "$DIR" || exit

awk '{ print $3 }' failed_login_data.txt | \

sort | \

uniq -c | \

awk '{ print "data.addRow([\x27"$2"\x27,", $1 "]);" }' > tempFile.txt

#Need to hand tempFile.txt to wrap_contents.sh

cd ..

"$curDir"/bin/wrap_contents.sh "$DIR"/tempFile.txt html_components/hours_dist.html "$DIR"/hoursFile.txt