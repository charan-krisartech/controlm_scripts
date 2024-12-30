#!/bin/bash

sourceDir="$1"
filePattern="$2"
statFileName="$3"

if [ ! -d "$sourceDir" ]; then
    echo "Source directory does not exist: $sourceDir"
    exit 1
fi

echo "Creating stat file for file pattern $filePattern in $sourceDir"
stat --format=%n $sourceDir/$filePattern > $sourceDir/${statFileName}.stat

# $? means exit status of previous command
if [ $? -eq 0 ]; then
    echo "Files added to stat file"
else
    echo "Failed to add files to stat file"
fi

echo "Stat file created successfully!"