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

  pipx install --include-deps $1

  echo -e
}

installApplications() {
  echo "Installing Applications"

  sudo apt update
  installAptPackage libsecret-tools
  installAptPackage sshpass
  installAptPackage pipx
  installAptPackage python3-passlib

  pipx ensurepath
  installPythonPackage ansible
  installPythonPackage ansible-lint

  echo -e "Finished\n"
}

installApplications
