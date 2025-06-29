# 🐳 Install Docker LTS on Ubuntu / VPS / Ubuntu WSL / 

A simple guide to install the **latest stable (LTS) version of Docker** on Ubuntu (22.04 / 20.04 / 18.04).

---

## ✅ Prerequisites

- Ubuntu-based system (tested on 22.04 / 20.04 / 18.04)
- A user with `sudo` privileges
- Internet connection

---

## 🚀 Step-by-Step Installation

### 1. Uninstall old versions (if any)

```bash
sudo apt remove docker docker-engine docker.io containerd runc
```

### 2. Update your system
```bash
sudo apt update
sudo apt upgrade -y
```

### 3. Install required packages
```bash
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```
### 4. Add Docker's official GPG key
```bash
sudo mkdir -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
```
### 5. Set up the Docker stable repository
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
### 6. Update package index again
```bash
sudo apt update
```

### 7. Install Docker Engine (LTS version)
```bash
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
### 8. Verify Docker is working
```bash
sudo docker version
sudo docker run hello-world
```

---

## 😎 (Recomended) Install Docker with 1 shell command
```bash
curl -fsSL https://raw.githubusercontent.com/prolinkmoon/Docker/main/install-docker.sh -o install-docker.sh && chmod +x install-docker.sh && ./install-docker.sh
```
> [!NOTE]
> This script will:
> - Removing old Docker versions
> - Install Docker Engine (LTS)
> - Install Docker Compose CLI plugin
> - Docker Compose standalone (new version from GitHub)
