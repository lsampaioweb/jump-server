# Provisioning Ubuntu Server/Desktop 24.04

This Ansible playbook automates the provisioning of an **Ubuntu Server/Desktop 24.04** with essential configurations, security policies, and software installations.

#
### 1. Run the Provisioning Playbook

Execute the following command in the terminal of the **target VM**:

```bash
ansible-playbook provision.yml -e "inventory_hosts=desktop"
ansible-playbook provision.yml -e "inventory_hosts=desktop" -e "password_id=user"
```

### 2. Tasks Performed

The provisioning playbook performs the following tasks (tagged `personal_config`):

- **Disk Setup** *(only when `vgs` is defined)*:
  - Extends volume groups and creates logical volumes on new disks.
- **VS Code Repository Setup**:
  - Downloads and installs the Microsoft GPG signing key to `/usr/share/keyrings/`.
  - Configures the VS Code APT repository at `/etc/apt/sources.list.d/vscode.sources`.
- **APT Packages**:
  - Refreshes the package cache and performs a full system upgrade.
  - Installs `apt-transport-https` (required by the VS Code repository).
  - Installs `code` (Visual Studio Code).
  - Installs `default-jdk`.
  - Installs `python3-psutil` (required by `community.general.dconf`).
  - Installs **libnss3-tools** (`certutil`) required for Chrome's certificate database.
  - Removes unused dependencies and cleans the package cache.
- **pipx Tools** *(user-wide via `~/.local/bin`)*:
  - Installs `ansible` with dependencies.
  - Installs `ansible-lint` with dependencies.
  - Injects `jmespath`, `hvac`, `certifi`, and `passlib` into the Ansible pipx environment.
- **Ansible Galaxy Collections**:
  - `community.general`
  - `community.hashi_vault`
  - `community.crypto`
  - `fortinet.fortios`

[Go Back](../../README.md)

#
### Created by:

1. Luciano Sampaio.
