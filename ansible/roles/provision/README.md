# Provisioning Ubuntu Server 24.04

This Ansible playbook automates the provisioning of an **Ubuntu Server 24.04** with essential configurations, security policies, and software installations.

#
### 1. Run the Provisioning Playbook

Execute the following command in the terminal of the **target VM**:

```bash
ansible-playbook provision.yml
```

### 2. Tasks Performed

The provisioning playbook performs the following tasks:

### System Configuration
- Sets up **local storage** if volume groups (`vgs`) are defined.
- Signs the **Host OpenSSH keypair** using a Certificate Authority (CA).
- Checks if a **reboot is required** and reboots if necessary.

### Package Management
- Installs **Visual Studio Code (VSCode)**.
- Installs **Google Chrome**.
- Removes **unnecessary packages** and cleans up dependencies.

### Firewall (UFW) Configuration
- Configures **UFW rules** to:
  - Allow **TCP traffic on ports 8100-8200**.
  - Restrict access to **192.168.100.0/28** (Packer VLAN only).
    - This rule is required because when **Packer** runs, it creates an **HTTP service** that the VM being provisioned connects to.
    - The service is hosted on a **random port between 8100 and 8200**.

#
### Created by:

- **Luciano Sampaio**
