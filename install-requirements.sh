#!/bin/bash
set -e # Abort if there is an issue with any build.

# Usage:
#   ./install-requirements.sh

installAptPackage() {
  echo "Installing $1"
  
  sudo apt install -y $1
  
  echo -e
}

installPythonPackage() {
  echo "Installing $1"
  
  python3 -m pip install $1

  echo -e
}

installApplications() {
  echo "Installing Applications"
  
  sudo apt update
  installAptPackage qemu-guest-agent
  installAptPackage openssh-server
  installAptPackage python3-pip
  installAptPackage libsecret-tools
  installAptPackage sshpass

  installPythonPackage passlib
  installPythonPackage ansible

  echo -e "Finished\n"
}

installApplications
