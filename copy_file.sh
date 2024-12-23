#!/bin/bash

filePattern="$1"
sourceFolderPath="$2"
targetFolderPath="$3"

if [ -f "$sourceFolderPath/$filePattern" ]; then
  echo "Source file: $filePattern"
  echo "Source folder: $sourceFolderPath"
  echo "Target folder: $targetFolderPath"

  if [ -f "$targetFolderPath/$filePattern" ]; then
    echo "File with the same name exists in target location: $targetFolderPath/$filePattern"
    exit 1
  else
    mv "$sourceFolderPath/$filePattern" "$targetFolderPath"
    echo "File moved successfully!"
    exit 0
  fi

else
  echo "File doesn't exist"
  exit 1
fi
