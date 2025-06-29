#!/bin/bash

set -e

echo "🔄 Updating system..."
sudo apt update && sudo apt upgrade -y

echo "🧹 Removing old Docker versions..."
sudo apt remove -y docker docker-engine docker.io containerd runc || true

echo "📦 Installing dependencies..."
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "🔑 Adding Docker GPG key..."
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "📄 Adding Docker repository..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 Updating package index..."
sudo apt update

echo "🐳 Installing Docker Engine (LTS)..."
sudo apt install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

echo "✅ Docker installation completed!"

echo "🔎 Verifying Docker version:"
docker --version

echo "🚀 Running test container (hello-world)..."
sudo docker run hello-world

echo ""
echo "👤 To run Docker without sudo, run the following command and relogin:"
echo "    sudo usermod -aG docker \$USER && newgrp docker"
