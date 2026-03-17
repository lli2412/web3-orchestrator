# Deployment Instructions for VPS Setup

## Introduction
This document provides step-by-step instructions for deploying the web3-orchestrator on a Virtual Private Server (VPS). It covers the setup of JuiceSSH and systemd configuration to manage the service.

## Prerequisites
- A VPS with a Linux distribution (Ubuntu is recommended).
- Root or sudo access to the VPS.
- JuiceSSH installed on your local machine (for SSH access).

## Step 1: Connect to Your VPS Using JuiceSSH
1. Open JuiceSSH on your local device.
2. Tap on the '+' icon to create a new connection.
3. Enter your VPS's hostname or IP address.
4. Specify the username (usually `root` or a user with sudo privileges).
5. Tap 'Connect' and enter your password when prompted.

## Step 2: Update the System
Once connected to your VPS, run the following commands to ensure your system is up-to-date:
```bash
sudo apt update && sudo apt upgrade -y
```

## Step 3: Install Node.js
To run the web3-orchestrator, you will need Node.js. Install it using:
```bash
curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs
```

## Step 4: Clone the Repository
Clone the `web3-orchestrator` repository from GitHub:
```bash
git clone https://github.com/lli2412/web3-orchestrator.git
cd web3-orchestrator
```

## Step 5: Install Dependencies
Inside the cloned directory, run:
```bash
npm install
```

## Step 6: Set Up systemd Service
To run the application as a service, create a new systemd service file:
1. Create the service file:
   ```bash
   sudo nano /etc/systemd/system/web3-orchestrator.service
   ```
2. Add the following content:
   ```ini
   [Unit]
   Description=Web3 Orchestrator Service
   After=network.target

   [Service]
   ExecStart=/usr/bin/node /path/to/web3-orchestrator/index.js
   Restart=always
   User=your-username
   Group=your-group
   Environment=PATH=/usr/bin:/usr/local/bin
   Environment=NODE_ENV=production

   [Install]
   WantedBy=multi-user.target
   ```
   Replace `/path/to/web3-orchestrator/index.js` with the actual path to your `index.js` file.
3. Save and exit the editor.

## Step 7: Start and Enable the Service
Run the following commands to start the service and enable it on boot:
```bash
sudo systemctl start web3-orchestrator
sudo systemctl enable web3-orchestrator
```

## Step 8: Check the Status of the Service
To verify that the service is running correctly, use:
```bash
sudo systemctl status web3-orchestrator
```

## Conclusion
Your web3-orchestrator is now set up and running on your VPS. You can manage the service using standard systemd commands such as `start`, `stop`, `restart`, and `status`. If you encounter any issues, check the logs for any errors.
