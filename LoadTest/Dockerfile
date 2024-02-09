# Start from Alpine Linux
FROM alpine:latest

# Add Hey
ADD https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 /usr/local/bin/hey
RUN chmod +x /usr/local/bin/hey

# Copy the load test script and make it executable
WORKDIR /app
COPY load-test.sh /app/load-test.sh
RUN chmod +x /app/load-test.sh

# Set the entry point to Hey
ENTRYPOINT ["/app/load-test.sh"]