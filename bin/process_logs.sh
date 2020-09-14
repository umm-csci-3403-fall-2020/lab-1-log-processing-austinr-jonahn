#!/usr/bin/env bash

#Go into log_files, extract contents on one of the tgz's into a /'name' folder in the top level where name is the name of the tgz
#mkdir scratch

for input; do input2=${input%_secure.tgz}
             mkdir -p scratch/"$input2"
             tar -xzvf log_files/"$input" -C scratch/"$input2"
             ./bin/process_client_logs.sh scratch/"$input2"; done

./bin/create_username_dist.sh 

./bin/create_country_dist.sh

./bin/assemble_report.sh
