#!/bin/bash
#
# Purpose: Prepare a new Ubuntu Desktop workstation (22.04/24.04) to be configured by Ansible automation.
#
# Execution:
#   sudo ./install-requirements.sh
#
set -euo pipefail # Exit on error, undefined variables, and pipe failures

# Path to the provision files directory.
readonly PROVISION_FILES_PATH="ansible/roles/provision/files/"

# List of CA certificate files to install.
readonly CA_CERT_FILES=(
  "ca.lan.homelab.crt"
)

# List of Ansible Collection tarballs to download and install from Nexus.
readonly ANSIBLE_COLLECTION=(
  "community.general"
  "community.crypto"
  "community.hashi_vault"
  "ansible.posix"
)

#---------------------------------------------------------------------------------
# Function: Installs the CA certificates.
#---------------------------------------------------------------------------------
install_ca_certificates() {
  echo "--> 1/2: Installing CA certificates..."

  local cert_path="/usr/local/share/ca-certificates"
  mkdir -p "${cert_path}"

  for cert_file in "${CA_CERT_FILES[@]}"; do
    local source_file="${PROVISION_FILES_PATH}${cert_file}"
    local dest_file="${cert_path}/${cert_file}"

    echo "Copying ${source_file} to ${dest_file}"
    cp "${source_file}" "${dest_file}"

    # Set proper permissions
    chmod 644 "${dest_file}"
  done

  echo "Updating CA certificates..."
  update-ca-certificates

  echo "CA certificates installed successfully."
}

#---------------------------------------------------------------------------------
# Function: Installs essential packages and bootstraps a modern, system-wide pipx.
#---------------------------------------------------------------------------------
install_essential_packages() {
  echo "--> 2/2: Installing essential packages..."

  # Update package lists and upgrade system
  apt-get update -y
  apt-get upgrade -y
  apt-get install -y git

  echo "--> 2/2.1: Installing bootstrap version of pipx from apt..."
  apt-get install -y pipx

  echo "--> 2/2.2: Bootstrapping latest pipx version to /usr/local/bin..."
  # Use the apt-installed pipx to install the latest version of itself globally.
  PIPX_HOME="/opt/pipx" PIPX_BIN_DIR="/usr/local/bin" /usr/bin/pipx install pipx --force

  echo "--> 2/2.3: Removing bootstrap version of pipx..."
  apt-get purge --autoremove -y pipx

  echo "--> 2/2.4: Installing Ansible and Ansible-Lint with the new system-wide pipx..."
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

  install_ca_certificates
  install_essential_packages

  # Refresh the terminal.
  source ~/.bashrc

  echo
  echo "--- Preparation Finished Successfully! ---"
  echo "Note: You may need to restart your terminal or run 'source ~/.bashrc' to use new tools."
}

# --- Script Entry Point ---
main
