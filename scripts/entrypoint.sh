#!/bin/bash

# GitHub Action Entrypoint Script for Steam Operations
# This script runs inside the Docker container

set -e

echo "Running Steam GitHub Action..."
echo "Action execution started at $(date)"

# Run Steam operations as steam user
su - steam -c "/scripts/steam_operations.sh"

# Add your action logic here
# Example commands:
# - Build game/mod files
# - Prepare workshop content
# - Upload to Steam Workshop
# - etc.

echo "Action execution completed at $(date)"