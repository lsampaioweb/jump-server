# Provisioning Ubuntu Server 24.04

This Ansible playbook automates the provisioning of an **Ubuntu Server 24.04** with essential configurations, security policies, and software installations.

#
### 1. Run the Provisioning Playbook

Execute the following command in the terminal of the **target VM**:

Install required dependencies.
```bash
sudo ./install-requirements.sh
```

```bash
ansible-playbook provision.yml
```

### 2. Tasks Performed

The provisioning playbook performs the following tasks:

New:
- System Base Configuration:
  - Trusting CA certificates.
  - Configuring system timezone.
  - Configuring NTP server.
  - Setting up the disks.
  - Updating base system packages:
    - Installing global APT packages.
    - Adding SSL certificates to pipx environments.
    - Installing global PIPX packages.
- Network and Boot Configuration:
  - Enabling Grub boot menu.
  - Setting predictable network interface names.
  - Disabling IPv6 system-wide.
- Core Application Installation:
  - Installing Git dependencies.
  - Installing Google Chrome.
- Remote Access Services:
  - Installing XRDP.

Old (to remove):
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

[Go Back](../../README.md)

#
### Created by:

1. Luciano Sampaio.
