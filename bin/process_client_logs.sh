#!/bin/bash

#Takes a directory as an argument

tar -xf "$1"

cd var/log || exit

cat * | awk '{printf "invalid user"} ; '

#This regex needs to take in alot more things, I'm not 100% on the printf but it was nice for testing






