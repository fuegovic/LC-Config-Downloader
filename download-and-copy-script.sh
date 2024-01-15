#!/bin/sh
# Assign a default value to FILE_URL if it is unset or null
FILE_URL=$ {FILE_URL:-https://raw.githubusercontent.com/danny-avila/LibreChat/main/librechat.example.yaml}
curl -o /shared/librechat.yaml $FILE_URL
if [ -f "/shared/librechat.yaml" ]; then
  echo "File downloaded successfully to shared volume"
else
  echo "Error: The file librechat.yaml was not downloaded"
fi
