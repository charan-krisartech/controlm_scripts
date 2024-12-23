#!/bin/bash
filePath="$1"
targetFolderPath="$2"

if ls "$filePath" 1> /dev/null 2>&1; then
  echo "Source file: $filePath"
  echo "Target folder: $targetFolderPath"

  mv "$filePath" "$targetFolderPath"

  echo "File moved successfully!"
  exit 0
else
  echo "File doesn't exist"
  exit 1
fi
