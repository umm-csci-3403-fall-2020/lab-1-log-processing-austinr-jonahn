#!/usr/bin/env bash

# Extract data from failed_login_data.txt, sort with command "sort", run sorted list though "uniq -c" to count, count" > tempHours.txt, wrap_contents.sh with tempHours.txt
DIR="$1"
curDir=$(pwd)

###Extracting and sorting
cd "$DIR" || exit
cat .*/failed_login_data.txt | awk ' {print $3} ' | sort |\
       	uniq -c | awk ' { print "data.addRow([\x27"$2"\x27, "$1"]);"}' > tempHours.txt

### Using wrap contentssh to add footer and header to usernames
cd "$curDir" || exit
./bin/wrap_contents.sh \
        "$DIR"/tempHours.txt \
       	html_components/hours_dist \
		hours_dist.html

### Remove Files                                                            
#tempHours.txt
