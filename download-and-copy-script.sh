#!/bin/sh

curl -o /shared/librechat.yaml $FILE_URL

if [ -f "/shared/librechat.yaml" ]; then
  echo "File downloaded successfully to shared volume"
else
  echo "Error: The file librechat.yaml was not downloaded"
fi
