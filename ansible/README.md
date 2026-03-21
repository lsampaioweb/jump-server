# Setup the Ubuntu Desktop 24.04 as a Jump Server for HomeLab using Ansible

The playbook automates the setup of an **Ubuntu Desktop 24.04** to function as a Jump Server.

All commands should be executed **inside the machine** (VM or laptop).

#
### 1. Install Requirements

Install `pipx`, `ansible`, and `ansible-lint` by running:

```bash
sudo ./ansible/install-requirements.sh
```

> **VirtualBox only** — after running the script above, also run the following prerequisite Packer-based projects **in order** before continuing:
> - **[proxmox-ubuntu-server-raw](https://github.com/lsampaioweb/proxmox-ubuntu-server-raw)**
> - **[proxmox-ubuntu-desktop-raw](https://github.com/lsampaioweb/proxmox-ubuntu-desktop-raw)**
> - **[proxmox-ubuntu-desktop-standard](https://github.com/lsampaioweb/proxmox-ubuntu-desktop-standard)**

#
### 2. Store Your Password in the Secret Manager

The Ansible playbook requires a stored password to run privileged tasks.

Save your password securely:

```bash
secret-tool store --label="user" password user
```

To verify that the password was stored correctly:

```bash
secret-tool lookup password "user"
```

If you encounter this error:

```bash
secret-tool: Cannot create an item in a locked collection.
```

### Solution:
Open the Ubuntu Desktop **GUI interface** (not SSH) to unlock the secret manager.
This issue will soon be handled automatically by the Ansible playbook.

#
### Roles You Can Execute

1. [Provision](roles/provision/README.md) - Installs packages and applies base system configuration.
1. [Update](roles/update/README.md) - Updates system packages and dependencies.
1. [Create User](roles/create_user/README.md) - Creates user accounts.
1. [Setup User](roles/setup_user/README.md) - Applies personal user settings and configurations.
1. [Restore](roles/restore/README.md) - Restores data from a backup (standalone, not part of site.yml).
1. [Backup](roles/backup/README.md) - Backs up user data (standalone, not part of site.yml).
1. [Destroy](roles/destroy/README.md) - Cleans up and removes the machine configuration.

#
### Cleanup (Optional)

If needed, remove the cloned repository:

```bash
rm -rf ~/git/jump-server/
```

[Go Back](../README.md)

#
### Created by:

1. Luciano Sampaio.
