# Working Machine

This project automates the final configuration of Ubuntu Desktop/Server `24.04` machines for development and administration tasks in the HomeLab environment.

### Overview

This project handles `user-specific` configurations such as Git settings, VS Code extensions, and other personal development environment setups. The setup process depends on how your machine was created:

1. **Proxmox VM (Recommended)**:

    If your machine was created using Terraform with Packer templates, it already has the base system configuration. This project handles only the final `user-specific` configurations.

1. **New Bare Machine (Fresh Install)**:

    If this is a fresh machine without a Packer base image, you need to bootstrap Ansible and the base configuration first, then run this project for the final setup.

### Installation and Setup

### 1. Prepare the Environment (For all machine types)

Open a terminal and execute the following steps:

1. Update package lists and upgrade installed packages.
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```

1. Install Git
    ```bash
    sudo apt install -y git
    ```

1. Create a Git directory and navigate to it.
    ```bash
    mkdir -p ~/git && cd ~/git
    ```

1. Clone the repository and initialize submodules.
    ```bash
    git clone --recurse-submodules https://github.com/lsampaioweb/jump-server.git && cd jump-server
    ```

1. If the repository is already cloned, update submodules.
    ```bash
    git submodule update --init --recursive
    ```

### 2. Only for New Bare Machines (Fresh Install)

If the machine was **not** created from a Packer template (e.g. a laptop, a fresh VirtualBox VM, or a bare Proxmox VM), follow the setup steps in **[ansible/README.md](ansible/README.md)** to bootstrap Ansible and the base configuration before continuing.

### 3. Deploy the Working Machine Configuration

Return to this project directory and choose one of the following methods:

- **[Terraform](terraform/README.md "Terraform")** (Recommended for Proxmox) – Automated deployment if your Proxmox cluster is operational.
- **[Ansible](ansible/README.md "Ansible")** – Direct configuration for laptops, VirtualBox VMs, or any machine without Terraform.

#
### License:

[MIT](LICENSE "MIT License")

### Created by:

1. Luciano Sampaio.
