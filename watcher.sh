#!/bin/bash

# File to monitor (change this to the file you want to watch)
FILE=$1

if [ ! -e "$FILE" ]; then
  echo "File does not exist: $FILE"
  exit 1
fi

# first touch
touch $FILE

# Get initial stat info
prev_stat=$(stat "$FILE")

while true; do
  sleep 1
  curr_stat=$(stat "$FILE")
  if [ "$curr_stat" != "$prev_stat" ]; then
    echo "Change detected in $FILE"
    prev_stat=$curr_stat
  fi
done

