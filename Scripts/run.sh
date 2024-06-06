#!/bin/bash

# Define the input CSV file
input_file=$1

# Loop through each line of the CSV file
while IFS= read -r line; do
    # Extract the first word (site) from the line
    site=$(echo $line | awk '{print $1}')

    rm -rf ../Data/*    
    # Run the multi-launch.sh script with the site and redirect output
    ./multi-launch.sh "$site" 15 1> output.txt 2>&1
    
    # Create a directory named logs/<site> if it doesn't exist
    mkdir -p "logs/$site"
    
    # Copy output.txt to the logs/<site> directory
    cp output.txt "logs/$site/"
    
    # Copy contents of ../Data/ to the logs/<site> directory
    cp -r ../Data/* "logs/$site/"
    
    # Optionally, print a message indicating the completion of processing for the site
    echo "Processed $site and copied files to logs/$site/"
    
done < "$input_file"

echo "All sites processed."

