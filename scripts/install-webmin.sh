#!/bin/bash

set -e

echo "[+] Updating package index..."
sudo apt update

echo "[+] Installing dependencies..."
sudo apt install -y \
  perl \
  libnet-ssleay-perl \
  openssl \
  libauthen-pam-perl \
  libpam-runtime \
  libio-pty-perl \
  apt-show-versions \
  python3

echo "[+] Downloading latest Webmin .deb package..."
wget -O /tmp/webmin.deb https://www.webmin.com/download/deb/webmin-current.deb

echo "[+] Installing Webmin..."
sudo dpkg -i /tmp/webmin.deb || true  # Allow failure if dependencies are missing

echo "[+] Fixing missing dependencies..."
sudo apt --fix-broken install
