#!/bin/bash

# Steam Operations Script
# This script contains SteamCMD operations that run as the steam user

set -e

cd /home/steam/steamcmd

# Example SteamCMD operations
echo 'Initializing SteamCMD...'

# Login with provided credentials or anonymously
if [ -n "$INPUT_STEAM_USERNAME" ] && [ -n "$INPUT_STEAM_PASSWORD" ]; then
    echo "Logging in with provided credentials..."
    ./steamcmd.sh +login "$INPUT_STEAM_USERNAME" "$INPUT_STEAM_PASSWORD" +quit
else
    echo "Performing anonymous login..."
    ./steamcmd.sh +login anonymous +quit
fi

# Example: Download/update game files if needed
if [ -n "$INPUT_APP_ID" ]; then
    echo "Updating app $INPUT_APP_ID..."
    ./steamcmd.sh +login anonymous +app_update $INPUT_APP_ID validate +quit
fi

echo 'SteamCMD operations completed'