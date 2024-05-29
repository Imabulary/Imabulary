#!/bin/sh

node dist/src/main.js

while true; do

  echo "Application crashed. Sleeping for 10 seconds..."

  sleep 10

done
