#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt-get update

# Install dependencies
echo "Installing dependencies..."
sudo apt-get install -y build-essential git curl

# Check for node and npm installation
if ! [ -x "$(command -v node)" ]; then
  echo "Node.js is not installed. Installing..."
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  sudo apt-get install -y nodejs
fi

# Install project dependencies
if [ -f package.json ]; then
  echo "Installing project dependencies..."
  npm install
else
  echo "No package.json found. Skipping npm install."
fi

echo "Project setup is complete!"