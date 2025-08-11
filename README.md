# Working Machine

This project automates the final configuration of Ubuntu Desktop `22.04` or `24.04` machines for development and administration tasks in the HomeLab environment.

### Overview

This project handles `user-specific` configurations such as Git settings, VS Code extensions, and other personal development environment setups. The setup process depends on how your machine was created:

1. **Proxmox VM (Recommended)**: If your machine was created using Terraform with Packer templates, it already has the base system configuration. This project handles only the final `user-specific` configurations.
1. **VirtualBox VM**: If your machine was created manually in VirtualBox, you need to run the prerequisite playbooks first to establish the base system configuration, then run this project for final setup.

### Quick Reference

#### Proxmox VM Workflow (Recommended)
1. Create VM using Terraform + Packer templates.
1. Run this project's configuration.

#### VirtualBox VM Workflow
1. Create VM manually in VirtualBox.
1. Run prerequisite projects **in this order**:
    - **[proxmox-ubuntu-server-raw](https://github.com/lsampaioweb/proxmox-ubuntu-server-raw)**
    - **[proxmox-ubuntu-desktop-raw](https://github.com/lsampaioweb/proxmox-ubuntu-desktop-raw)**
    - **[proxmox-ubuntu-desktop-standard](https://github.com/lsampaioweb/proxmox-ubuntu-desktop-standard)**
1. Run this project's configuration.

### Installation and Setup

### 1. Prepare the Environment

**For both VirtualBox and Proxmox VMs:**

Open a terminal and execute the following steps:

1. Update package lists and upgrade installed packages
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```

1. Install Git (if not already installed)
    ```bash
    sudo apt install -y git
    ```

1. Create a Git directory and navigate to it
    ```bash
    mkdir -p ~/git && cd ~/git
    ```

1. Clone the repository and initialize submodules
    ```bash
    git clone --recurse-submodules https://github.com/lsampaioweb/working-machine.git && cd working-machine
    ```

1. If the repository is already cloned, update submodules
    ```bash
    git submodule update --init --recursive
    ```

### 2. Deploy the Working Machine Configuration

**For both Proxmox VMs and VirtualBox:**

Return to this project directory and choose one of the following methods:

- **[Terraform](terraform/README.md "Terraform")** (Recommended for Proxmox) – Automated deployment if your Proxmox cluster is operational.
- **[Ansible](ansible/README.md "Ansible")** – Manual configuration for both VirtualBox VMs and Proxmox VMs where Terraform isn't suitable.

### License:

[MIT](LICENSE "MIT License")

### Created by:

1. Luciano Sampaio.
