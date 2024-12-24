#!/bin/bash

sourceFolderPath="$1"
filePattern="$2"
waitTime=${3:-10} # Default is 10 seconds

filePath="$sourceFolderPath/$filePattern"
file_flag=false

if ls "$filePath" 1> /dev/null 2>&1; then
    echo "File found at $currentTime."
    file_flag=true
fi

if file_flag; then
    echo "Checking for file size"

    # File size check
    do_flag=true
    while $do_flag || [ $currentSize -gt $previousSize ]; do
        do_flag=false

        previousSize=$(wc -c <"$filePath")
        sleep $waitTime;
        currentSize=$(wc -c <"$filePath")

        echo "File size is increasing. Current size at $currentTime is: $currentSize"
    done

    echo "File stopped increasing"
    exit 0
else
    echo "File not found"
    exit 1
fi