## Update Ubuntu Server 24.04

This playbook updates all installed packages on an **Ubuntu Server 24.04**, ensuring the system is up-to-date with the latest security patches and software versions.

#
### 1. Run the Update Playbook

Execute the following command in the terminal of the **target VM**:

```bash
ansible-playbook update.yml
```

```bash
ansible-playbook update.yml -e "inventory_hosts=desktop"
```

### 2. Tasks Performed

### Updating Packages
- Updates all installed packages while keeping the system stable.
- Refreshes the **APT cache** before upgrading packages.
- Uses **safe upgrade mode** to prevent unnecessary package removals.

[Go Back](../../README.md)

#
### Created by:

1. Luciano Sampaio.
