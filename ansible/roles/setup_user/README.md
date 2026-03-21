# Configure User Settings on Ubuntu Server/Desktop 24.04

This playbook applies user-specific configurations on an **Ubuntu Server/Desktop 24.04**, including **GNOME settings, favorite applications, Git setup, and customizations**.

#
### 1. Run the User Setup Playbook

Execute the following command in the terminal of the **target machine**:

```bash
ansible-playbook setup_user.yml
```

```bash
ansible-playbook setup_user.yml -e "inventory_hosts=desktop"
```

### 2. Tasks Performed

### System Customization
- Creates a **function to unlock the secret manager** (GNOME Keyring).
- Sets up the **dark theme** as the system default.
- Adds **favorite applications to the Dock** and adjusts Dock settings.

### Software and Package Management
- Installs **Git** and configures global user name and email (prompted at runtime).
- Installs and manages **VSCode extensions** for development.
- Adds the **self-signed Certificate Authority (CA)** to Chrome’s trust store.

### Git Repository Management
- Ensures all required **Git directories exist**.
- Clones essential **Git repositories** for:
  - **Homelab infrastructure**
  - **Ansible playbooks**
  - **Packer templates**
  - **Terraform modules**
  - **Spring Boot projects**
  - **Docker images**
  - **Custom projects and services**

### Cleanup and Reboot
- Removes **unnecessary packages**.
- Checks if a **reboot is required** and reboots if necessary.

[Go Back](../../README.md)

#
### Created by:

1. Luciano Sampaio.
