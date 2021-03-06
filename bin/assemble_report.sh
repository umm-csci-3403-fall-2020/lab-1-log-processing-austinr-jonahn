#!/usr/bin/env bash

#Combine country_dist.html hours_dist.html and username_dist.html to one file and pass it to wrap contents
DIR="$1"
curDir=$(pwd)
cd "$DIR" || exit

#Combining files
cat country_dist.html hours_dist.html username_dist.html > failed_login_summary.txt

cd "$curDir" || exit

./bin/wrap_contents.sh \
       "$DIR"/failed_login_summary.txt \
       html_components/summary_plots \
       "$DIR"/failed_login_summary.html

