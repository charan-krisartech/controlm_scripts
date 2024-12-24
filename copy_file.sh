#!/bin/bash

sourceFolderPath="$1"
filePattern="$2"
targetFolderPath="$3"

sourceFilePath="$sourceFolderPath/$filePattern"
targetFilePath="$targetFolderPath/$filePattern"

if [ -f "$sourceFilePath" ]; then
  echo "Source file: $filePattern"
  echo "Source folder: $sourceFolderPath"
  echo "Target folder: $targetFolderPath"

  if [ -f "$targetFilePath" ]; then
    echo "File with the same name exists in target location: $targetFilePath"
    exit 1
  else
    mv "$sourceFilePath" "$targetFolderPath"
    echo "File moved successfully!"
    exit 0
  fi

else
  echo "File doesn't exist"
  exit 1
fi
