#!/bin/bash

sourceDir="$1"
filePatterns="$2"
targetDir="$3"

if [ ! -d "$sourceDir" ]; then
    echo "Source directory does not exist: $sourceDir"
    exit 1
fi

# Semi-colon seperated file patterns
IFS=';'
read -r -a patterns_array <<< "$filePatterns"
echo "$patterns_array"

# Zip files matching each pattern in the source folder into the target folder
for pattern in "${patterns_array[@]}"; do
    for file in $sourceDir/$pattern; do
        echo $file
        if [ -f "$file" ]; then
            filename=$(basename "$file")
            zip -j "$OUTPUT_DIR/${filename}.zip" "$file"

            # $? means exit status of previous command
            if [ $? -eq 0 ]; then
                echo "Zipped $file to $OUTPUT_DIR/${filename}.zip"
            else
                echo "Failed to zip $file"
            fi
        fi
    done
done

echo "Zipping completed. Files are stored in $targetDir."