#!/bin/bash

# deploy.sh - Deploy the web3-orchestrator as a systemd service

# Setup variables
SERVICE_NAME="web3-orchestrator.service"
SERVICE_PATH="/etc/systemd/system/$SERVICE_NAME"

# Copy the service file to systemd directory
sudo cp $SERVICE_NAME $SERVICE_PATH

# Reload systemd to recognize the new service
sudo systemctl daemon-reload

# Start the service
sudo systemctl start $SERVICE_NAME

# Enable the service to start on boot
sudo systemctl enable $SERVICE_NAME

# Output the status of the service
sudo systemctl status $SERVICE_NAME