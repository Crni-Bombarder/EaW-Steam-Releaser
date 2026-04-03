#!/bin/bash

# GitHub Action Entrypoint Script
# This script runs inside the Docker container

set -e

echo "Running GitHub Action..."
echo "Action execution started at $(date)"

# Example: You can receive inputs from action.yml as environment variables
if [ -z "$INPUT_MESSAGE" ]; then
    INPUT_MESSAGE="Hello from Docker GitHub Action!"
fi

echo "$INPUT_MESSAGE"

# Add your action logic here
# Example commands:
# - Build steps
# - Tests
# - Deployments
# - etc.

echo "Action execution completed at $(date)"
