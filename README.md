# Setup the Ubuntu Desktop 22.04 as a jump server for my HomeLab using Ansible

The playbook can setup an Ubuntu Desktop 22.04.

1. Create the Virtual Machine (VM) on Proxmox.
```bash
  # General
  VM ID: 1000
  # [DUD] - Development|Ubuntu|Desktop
  Name: DUD-Jump-Server

  # OS
  Storage: local
  ISO image: ubuntu-22.04.1-desktop-amd64.iso

  # System
  Qemu Agent: Cheched

  # Disks
  Storage: local-lvm
  Disk size (GiB): 32
  Discard: checked
  SSD Simulation: checked
  IO thread: checked

  # CPU
  Cores: 4

  # Memory
  Memory (MiB) 6144
  Minimum memory (MiB) 2048

  # Network
  Bridge: vmbr0
  Firewall: unchecked
```

2. Add some additional settings.
```bash
  # Hardware
  Display: Standard VGA, memory=32

  # Options
  Hotplug: Disk, Network
```

3. Run these commands in the terminal of the VM:
```bash
  01 - Install SSH.
  sudo apt install openssh-server

  02 - Install Pip.
  sudo apt install python3-pip

  03 - Install Git.
  sudo apt install git
  
  04 - Create a Git folder and go to it.
   mkdir git && cd git

  05 - Download the repository.
  git clone --recurse-submodules https://github.com/lsampaioweb/homelab-datacenter.git

  06 - Install Ansible.
  sudo -i
  python3 -m pip install ansible

  07 - Execute the playbook.
  cd 01-Jump-Server
  ansible-playbook site.yml -K #(--ask-become-pass)
```

# Roles you can execute:
1. [Setup](roles/setup-machine/README.md) the jump server with all the default applications and settings.

# License:

[MIT](LICENSE "MIT License")

# Created by: 

1. Luciano Sampaio.
