# Create a User on Ubuntu Server 24.04

This playbook creates a **local user account** on an **Ubuntu Server 24.04** with optional **sudo privileges**.

#
### 1. Run the User Creation Playbook

Execute the following command in the terminal of the **target VM**:

```bash
ansible-playbook create_user.yml
```

```bash
ansible-playbook create_user.yml -e "inventory_hosts=desktop"
```

### 2. Tasks Performed

### Creating a User Account
- Creates a **local user account** with a **hashed password**.
- Assigns **sudo privileges** if enabled.
- Configures **password-less sudo** for the user when `sudo_privilege: true`.

[Go Back](../../README.md)

#
### Created by:

1. Luciano Sampaio.
