#!/bin/sh

# Use the environment variable to download the file to the shared volume
curl -o /shared/librechat.yaml $FILE_URL

# Check if the file "librechat.yaml" exists in the "/shared" directory before attempting to copy it
if [ -f "/shared/librechat.yaml" ]; then
  # Copy the file to the /app
  cp /shared/librechat.yaml /app/librechat.yaml
  echo "File copied successfully"
else
  echo "Error: The file librechat.yaml does not exist in the shared directory"
fi
