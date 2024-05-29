#!/bin/bash

while true; do

  node dist/src/main.js

  if [ $? -eq 0 ]; then

    echo "Application exited successfully."

    exit 0

  else

    echo "Application crashed. Restarting in 10 seconds..."

    sleep 60

  fi

done
