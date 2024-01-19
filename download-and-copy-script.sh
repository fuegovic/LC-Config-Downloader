#!/bin/sh

# Set FILE_URL to a default value if it's not already set
FILE_URL="${FILE_URL:-https://raw.githubusercontent.com/danny-avila/LibreChat/main/librechat.example.yaml}"

# Use the environment variable to download the file to the shared volume
if ! curl -o "/shared/librechat.yaml" "$FILE_URL"; then
    echo "Error: Failed to download the file from $FILE_URL" >&2
    exit 1
fi

# Check if the file "librechat.yaml" exists in the "/shared" directory before attempting to copy it
if [ -f "/shared/librechat.yaml" ]; then
    # Copy the file to the /app
    if cp "/shared/librechat.yaml" "../librechat.yaml"; then
        echo "File copied successfully from $FILE_URL"
    else
        echo "Error: Failed to copy librechat.yaml to /app" >&2
        exit 1
    fi
else
    echo "Error: The file librechat.yaml does not exist in the shared directory" >&2
    exit 1
fi
