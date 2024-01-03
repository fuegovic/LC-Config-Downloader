#!/bin/sh

# Use the environment variable to download the file
curl -o /path/in/container/file.ext $FILE_URL

# Copy the file to the specified container directory
# Replace "LibreChat" with the actual container ID or name of the receiving container
docker cp /path/in/container/file.ext $(docker-compose ps -q $TARGET_CONTAINER):/app