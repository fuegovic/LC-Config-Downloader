# Use a lightweight base image
FROM alpine:latest

# Install cURL to perform the file download
RUN apk add --no-cache curl

# Copy the script into the container
COPY download-and-copy-script.sh /usr/local/bin/

# Set the script as executable
RUN chmod +x /usr/local/bin/download-and-copy-script.sh

# Execute the script when the container starts
CMD ["/usr/local/bin/download-and-copy-script.sh"]