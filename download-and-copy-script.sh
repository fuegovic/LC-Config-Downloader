#!/bin/sh

# Use the environment variable to download the file to the shared volume
curl -o /shared/librechat.yaml $FILE_URL

# Copy the file to the /app directory within the shared volume
cp /shared/librechat.yaml /app/