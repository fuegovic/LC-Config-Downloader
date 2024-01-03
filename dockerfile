# Use a lightweight base image
FROM alpine:latest
    
# Install cURL to perform the file download
RUN apk add --no-cache curl

ARG FILE_URL
ARG TARGET_CONTAINER

# Download the file from the specified URL during the build
RUN curl -o /path/in/container/file.ext $FILE_URL

# Copy the file to the specified container directory
# Here, you'll need to replace "LibreChat" with the actual container ID or name of the receiving container
CMD ["sh", "-c", "docker cp /path/in/container/file.ext $(docker-compose ps -q $TARGET_CONTAINER):/app"]