FROM ubuntu:22.04

# Install system dependencies for Steam
RUN dpkg --add-architecture i386 && \
    apt-get update && apt-get install -y \
    bash \
    curl \
    git \
    wget \
    ca-certificates \
    lib32gcc-s1 \
    lib32stdc++6 \
    libcurl4-gnutls-dev:i386 \
    libsdl2-2.0-0:i386 \
    && rm -rf /var/lib/apt/lists/*

# Create steam user and directories
RUN useradd -m steam && \
    mkdir -p /home/steam/steamcmd && \
    chown steam:steam /home/steam/steamcmd

# Switch to steam user and install SteamCMD
USER steam
WORKDIR /home/steam/steamcmd

RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz && \
    tar -xvzf steamcmd_linux.tar.gz && \
    rm steamcmd_linux.tar.gz

# Switch back to root for copying files and setting entrypoint
USER root

# Copy the scripts into the container
COPY scripts/ /scripts/
RUN chmod +x /scripts/entrypoint.sh /scripts/steam_operations.sh

# Set the entrypoint for the action
ENTRYPOINT ["/scripts/entrypoint.sh"]
