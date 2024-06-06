#!/bin/bash

# Define the input file and prefix for the output files
input_file="sites.csv"
output_prefix="sites/site_"

# Split the file into chunks of 100 lines each
split -l 200 $input_file "${output_prefix}_part_"

# Rename the files to have a numeric suffix
counter=1
for file in ${output_prefix}_part_*; do
    mv "$file" "${output_prefix}$(printf "%02d" $counter).csv"
    counter=$((counter + 1))
done

echo "File has been split into smaller files with 100 lines each."

