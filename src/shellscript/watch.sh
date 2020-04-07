#!/bin/sh
if [ $# -ne 2 ]; then
  echo "At least two arguments needed.
  Param1: File to be watched
  Param2: Command to be executed when file modified
  ex.
    ./watch.sh foo 'bar foo'"
  exit 1
fi
echo "File: $1"
echo "Command: $2"
INTERVAL=1
last=`ls --full-time $1 | awk '{print $6"-"$7}'`
while true; do
  sleep $INTERVAL
  current=`ls --full-time $1 | awk '{print $6"-"$7}'`
  if [ $last != $current ] ; then
    echo ""
    echo "Updated: $current"
    last=$current
    eval $2
  fi
done

