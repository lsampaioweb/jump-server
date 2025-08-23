#!/bin/bash
#
# Purpose: Prepare a new Ubuntu Desktop workstation (22.04/24.04) to be configured by Ansible automation.
#
# Execution:
#   sudo ./install-requirements.sh
#
set -euo pipefail # Exit on error, undefined variables, and pipe failures

#---------------------------------------------------------------------------------
# Function: Installs essential packages and bootstraps a modern, system-wide pipx.
#---------------------------------------------------------------------------------
install_essential_packages() {
  echo "Installing essential packages..."

  # Update package lists and upgrade system
  apt-get update -y
  apt-get upgrade -y
  apt-get install -y git

  echo "Installing bootstrap version of pipx from apt..."
  apt-get install -y pipx

  echo "Bootstrapping latest pipx version to /usr/local/bin..."
  # Use the apt-installed pipx to install the latest version of itself globally.
  PIPX_HOME="/opt/pipx" PIPX_BIN_DIR="/usr/local/bin" /usr/bin/pipx install pipx --force

  echo "Removing bootstrap version of pipx..."
  apt-get purge --autoremove -y pipx

  echo "Installing Ansible and Ansible-Lint with the new system-wide pipx..."
  /usr/local/bin/pipx install --global --include-deps ansible
  /usr/local/bin/pipx install --global ansible-lint

  apt-get autoremove -y --purge
  echo "--> System prerequisites and Ansible tools installed successfully."
}

#------------------------------------------------------------------------------
# Main Function: Orchestrates the script execution.
#------------------------------------------------------------------------------
main() {
  echo "--- Starting Workstation Preparation ---"

  install_essential_packages

  echo
  echo "--- Preparation Finished Successfully! ---"
  echo "Note: You may need to restart your terminal or run 'source ~/.bashrc' to use new tools."
}

# --- Script Entry Point ---
main
