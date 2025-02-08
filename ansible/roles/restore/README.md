## Restore Data on Ubuntu Server 24.04

This playbook restores **files, directories, databases, or system configurations** from the most recent backup on an **Ubuntu Server 24.04**.

#
### 1. Run the Restore Playbook

Execute the following command in the terminal of the **target VM**:

```bash
ansible-playbook restore.yml
```

### 2. Tasks Performed

### Restoring Data
- Recovers **files and directories** from the latest backup.
- Restores **databases** if applicable.
- Applies **system configurations** needed for proper functionality.

#
### Created by:

1. Luciano Sampaio.
