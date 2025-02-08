## Destroy Ubuntu Server 24.04

This playbook removes the user data, applications and cleans up related configurations.

#
### 1. Run the Destroy Playbook

Execute the following command in the terminal of the **target VM**:

```bash
ansible-playbook destroy.yml
```

### 2. Tasks Performed

### System Cleanup
- Removes **user data, applications, and configurations**.
- Cleans up **temporary files and logs**.

#
### Created by:

1. Luciano Sampaio.
