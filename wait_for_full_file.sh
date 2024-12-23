#!/bin/bash
filePath="$1"

if ls "$filePath" 1> /dev/null 2>&1; then
  previousSize=$(wc -c <"$filePath")
  currentTime=$(date -u +%T)
  echo "File found at $currentTime. Size: $previousSize"

  sleep 10;
  currentSize=$(wc -c <"$filePath")
else
  exit 1
fi

# File size check
while [ $currentSize -gt $previousSize ]; do
#  currentDate=$(date)
  currentTime=$(date -u +%T)

  echo "File size is increasing. Current size at $currentTime is: $currentSize"

  previousSize=$currentSize
  sleep 10;
  currentSize=$(wc -c <"$filePath")
done

echo "File stopped increasing"
exit 0


#  if ls "$filePath"; 1> /dev/null 2>&1; then
#    actualSize=$(wc -c <"$filePath")
#
#    if [ "$actualSize" -eq "$initialSize" ]; then
#      echo "File stopped increasing"
#      break
#
#    elif [ "$actualSize" -eq "$currentSize" ]; then
#      echo "File stopped increasing"
#      break
#
#    else
#      currentSize=$(wc -c <"$filePath")
#    fi
#
#  fi
