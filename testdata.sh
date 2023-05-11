#!/bin/bash

for directory in data/db_sample/ ; do
    if [ -d "${directory}" ] ; then
        echo "$directory"
        parentdir="$(dirname "$directory")"
        for data_file in $directory/*; do
            docker exec -i mongo sh -c 'mongoimport --db "'$parentdir'" --collection "'$(basename $data_file .json)'" --drop' < $data_file
        done
    fi
done