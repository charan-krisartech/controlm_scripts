#!/bin/bash

folderPath="$1"

if ls "$folderPath" 1> /dev/null 2>&1; then
  if [ -f "$folderPath/file_lock" ]; then
    echo "File lock exists in directory $folderPath"
    echo "Removing file lock"
    rm --force "$folderPath/file_lock"
    echo "File lock removed in directory $folderPath"
    exit 0
  else
    echo "File lock doesn't exist in directory $folderPath"
    exit 1
  fi
fi