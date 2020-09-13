#!/usr/bin/env bash

DIR="1"
curDir=$(pwd)
cd "$DIR" || exit

cat country_dist.html hours_dist.html username_dist.html >assemble_tempFile.txt

cd "$curDir" || exit

./bin/wrap_contents.sh \
       "$DIR"/assemble_tempFile.txt \
       html_components/summary_plots \
       "$DIR"/failed_login_summary.html

rm "$DIR"/assemble_tempFile.txt