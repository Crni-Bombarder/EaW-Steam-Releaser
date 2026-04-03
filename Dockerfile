FROM ubuntu:22.04

# Install any dependencies needed for your action
RUN apt-get update && apt-get install -y \
    bash \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy the entrypoint script into the container
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint for the action
ENTRYPOINT ["/entrypoint.sh"]
