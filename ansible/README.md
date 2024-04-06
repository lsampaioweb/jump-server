# Setup the Ubuntu Desktop 22.04 as a jump server for my HomeLab using Ansible

The playbook can setup an Ubuntu Desktop 22.04.

1. Create the Virtual Machine (VM) on Proxmox.
```bash
  # General
  VM ID: 1000
  Name: jump-server

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
  01 - Update the list of packages.
    sudo apt update
    sudo apt upgrade -y

  02 - Install Git.
    sudo apt install -y git

  03 - Create a Git folder and go to it.
    mkdir git && cd git

  04 - Download the repository and all of its submodules.
    git clone --recurse-submodules https://github.com/lsampaioweb/jump-server.git

  05 - Run the bash script to install the required packages.
    cd jump-server
    ./install-requirements.sh

  06 - Change your git config
    # Encode your name and email, in order to avoid spammers, encode them in base64.
    echo "your-name" | base64
    echo "your-email@something.com" | base64

    # Add the base64 values here.
    nano ansible/roles/setup_user/vars/main.yml
    git_user_name: "change here"
    git_user_email: "change here"

  07 - Save your password in the secret manager.
    secret-tool store --label="local_user_password" password local_user_password
    # To retrieve the password from the secret manager. Ansible will do this, don't worry.
    # secret-tool lookup password "local_user_password"
    # If you get the error message: "secret-tool: Cannot create an item in a locked collection", you should open the Ubuntu Interface (not from the SSH terminal). This will "open/unseal/unlock" the secret manager.

  08 - Add the fingerprint to the known_host file.
    # Because this is the first time we connect to the server. Ansible will handle this on the future playbooks.
    ssh <user>@<ip>

  09 - Reboot the VM.
    sudo reboot

  10 - Execute the playbook.
    cd ~/git/jump-server/ansible
    ansible-playbook provision.yml

  11 - Delete the created and downloaded folders.
    rm -rf ~/git
```

# Roles you can execute:
1. [Setup](roles/setup-machine/README.md) the jump server with all the default applications and settings.

# License:

[MIT](LICENSE "MIT License")

# Created by:

1. Luciano Sampaio.
