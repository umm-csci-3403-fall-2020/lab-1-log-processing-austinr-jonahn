#!/usr/bin/env bash

# Extract username column from failed_login_data.txt, sort with command "sort", run sorted list though "uniq -c" to count, awk to "'username', count" > tempFile.txt, wrap_contents.sh with tempFile.txt

DIR="$1"

cd DIR || exit

awk failed_login_data.txt '{ print "$4" }' | \

sort | \

uniq -c | \

awk '{ print "data.addRow([\x27"$1"\x27,", $2 "]);" }' > tempFile.txt

#Need to hand tempFile.txt to wrap_contents.sh

./wrap_contents.sh tempFile.txt names namesFile.txt