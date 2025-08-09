# Jump Server

This project automates the creation and configuration of Jump Servers for the HomeLab environment.

#
### Overview

This repository provides Terraform and Ansible scripts to set up Jump Servers in your infrastructure. The setup process follows two approaches:

1. **Automated Approach (Recommended)**: If your Proxmox cluster is operational, use Terraform scripts to create and configure the VM automatically.
2. **Manual Approach**: If Proxmox is not ready, create the VM manually using the Proxmox GUI and then run the Ansible playbooks to configure it.

#
### Installation and Setup

Follow the steps below to prepare **your machine** and clone the repository.

### 1. Prepare the Environment

Open a terminal and execute the following steps:

1. Update package lists and upgrade installed packages
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```

1. Install Git
    ```bash
    sudo apt install -y git
    ```

1. Create a Git directory and navigate to it
    ```bash
    mkdir -p ~/git && cd ~/git
    ```

1. Clone the repository and initialize submodules
    ```bash
    git clone --recurse-submodules https://github.com/lsampaioweb/jump-server.git && cd jump-server
    ```

1. If the repository is already cloned, update submodules
    ```bash
    git submodule update --init --recursive
    ```

1. Run the installation script for required dependencies
    ```bash
    sudo ./install-requirements.sh
    ```

1. Reboot the VM to apply changes
    ```bash
    sudo reboot
    ```

#
### 2. Deploy the Jump Server

Choose one of the following methods:

- **[Terraform](terraform/README.md "Terraform")** (Recommended) – If Proxmox is ready, use Terraform to create and configure the VM automatically.
- **[Ansible](ansible/README.md "Ansible")** – If Proxmox is not ready, manually create a VM and then run the Ansible playbooks to configure it.

#
### License:

[MIT](LICENSE "MIT License")

#
### Created by:

1. Luciano Sampaio.
