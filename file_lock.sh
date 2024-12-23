#!/bin/bash

folderPath="$1"

if ls "$folderPath" 1> /dev/null 2>&1; then
  if [ -f "$folderPath/file_lock" ]; then
    echo "File lock already exists in directory $folderPath"
    exit 1
  else
    echo "File lock is being created in directory $folderPath"
    touch "file_lock"
    echo "File lock created in directory $folderPath"
    exit 0
  fi
fi