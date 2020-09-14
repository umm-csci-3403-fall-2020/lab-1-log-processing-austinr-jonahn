#!/usr/bin/env bash

#Go into log_files, extract contents on one of the tgz's into a /'name' folder in the top level where name is the name of the tgz
#mkdir scratch

CurDir=$(pwd)

for input; do input2=${input%_secure.tgz}
             mkdir -p scratch/"$input2"
             tar -xzf log_files/"$input" -C scratch/"$input2"
             ./bin/process_client_logs.sh scratch/"$input2"; done

./bin/create_username_dist.sh scratch

./bin/create_country_dist.sh scratch

./bin/create_hours_dist.sh scratch

./bin/assemble_report.sh scratch

mv scratch/failed_login_summary.html "$CurDir"

rm scratch/assemble_tempFile.txt
rm scratch/tempFile.txt
rm scratch/tempHours.txt
rm scratch/tempUserName.txt

