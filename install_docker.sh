#!/bin/bash

# Update the system
sudo apt-get update -y

# Install dependencies
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the package database with Docker packages
sudo apt-get update -y

# Install Docker
sudo apt-get install -y docker-ce

# Verify Docker installation
sudo systemctl status docker
