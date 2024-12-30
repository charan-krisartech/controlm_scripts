#!/bin/bash

sourceDir="$1"
targetDir="$2"

if [ ! -d "$sourceDir" ]; then
    echo "Source directory does not exist: $sourceDir"
    exit 1
fi

for zipfile in "$sourceDir"/*.zip; do
    if [ -f "$zipfile" ]; then
        if unzip -q "$zipfile" -d "$targetDir"; then
            echo "Unzipped $zipfile to $targetDir"
        else
            echo "Failed to unzip $zipfile"
        fi
    fi
done

echo "All .zip files are unzipped at $targetDir."