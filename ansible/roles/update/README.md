## Update Ubuntu Server/Desktop 24.04

This role updates all installed packages on an **Ubuntu Server/Desktop 24.04**, ensuring the system is up-to-date with the latest security patches and software versions.

#
### 1. Run the Update Playbook

Execute the following command in the terminal of the **target machine**:

```bash
ansible-playbook update.yml
```

```bash
ansible-playbook update.yml -e "inventory_hosts=desktop"
```

### 2. Tasks Performed

### Updating Packages
- Refreshes the **APT cache** before upgrading.
- Performs a **full upgrade** (`apt full-upgrade`), allowing package removals where needed to resolve dependencies.
- Runs `autoremove` and `autoclean` to free up disk space.
- Reboots the machine if required after the update.

[Go Back](../../README.md)

#
### Created by:

1. Luciano Sampaio.
