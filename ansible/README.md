# Setup the Ubuntu Desktop 24.04 as a Jump Server for HomeLab using Ansible

The playbook automates the setup of an **Ubuntu Desktop 24.04** to function as a Jump Server.

All commands should be executed **inside the VM**.

#
### 1. Configure Git User

To avoid exposing your personal information, encode your **name** and **email** in Base64 before adding them to the playbook configuration.

```bash
echo "your-name" | base64
echo "your-email@something.com" | base64
```

Edit the Ansible variables file:

```bash
nano ansible/roles/setup_user/vars/main.yml
```

Add your encoded values:

```bash
git_user_name: "change here"
git_user_email: "change here"
```

### 2. Store Your Password in the Secret Manager

The Ansible playbook requires a stored password to run privileged tasks.

Save your password securely:

```bash
secret-tool store --label="local-user-password" password local-user-password
```

To verify that the password was stored correctly:

```bash
secret-tool lookup password "local-user-password"
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

1. [Provision](roles/provision/README.md) - Creates the Virtual Machine (VM).
1. [Update](roles/update/README.md) - Updates system packages and dependencies.
1. [Create User](roles/create_user/README.md) - Creates user accounts.
1. [Setup User](roles/setup_user/README.md) - Applies additional user settings and configurations.
1. [Restore](roles/restore/README.md) - Restores system configurations from a backup.
1. [Destroy](roles/destroy/README.md) - Destroys the Virtual Machine.

#
### Cleanup (Optional)

If needed, remove the cloned repository:

```bash
rm -rf ~/git/jump-server/
```

#
### Created by:

- **Luciano Sampaio**
