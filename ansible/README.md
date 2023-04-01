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
  01 - Update the packages list.
    sudo apt update

  02 - Install Qemu Quest Agent.
    sudo apt install -y qemu-guest-agent

  03 - Install SSH.
    sudo apt update
    sudo apt install -y openssh-server

  04 - Install Pip.
    sudo apt install -y python3-pip

  05 - Install the Secret Manager.
    sudo apt install -y libsecret-tools

  06 - Install the sshpass to use password authentication on Ansible.
    sudo apt install -y sshpass    

  07 - Install Git.
    sudo apt install -y git
  
  08 - Create a Git folder and go to it.
    mkdir git && cd git

  09 - Download the repository.
    git clone --recurse-submodules https://github.com/lsampaioweb/jump-server.git

  10 - Install Ansible.
    python3 -m pip install ansible

  11 - Change your git config
    # Encode your name and email, in order to avoid spammers, encode them in base64.
    echo "your-name" | base64
    echo "your-email@something.com" | base64

    # Add the base64 values here.
    nano jump-server/ansible/roles/setup_user/vars/main.yml
    git_user_name: "change here"
    git_user_email: "change here"

  12 - Save your password in the secret manager.
    secret-tool store --label="local_user_password" password local_user_password
    # To retrieve the password from the secret manager. Ansible will do this, don't worry.
    # secret-tool lookup password "local_user_password"
    # If you get the error message: "secret-tool: Cannot create an item in a locked collection", you should open the Ubuntu Interface (not from the SSH terminal). This will "open/unseal/unlock" the secret manager.

  13 - Add the fingerprint to the known_host file.
    # Because this is the first time we connect to the server. Ansible will handle this on the future playbooks.
    ssh <user>@<ip>

  14 - Execute the playbook.
    cd ansible
    ansible-playbook provision.yml
```

# Roles you can execute:
1. [Setup](roles/setup-machine/README.md) the jump server with all the default applications and settings.

# License:

[MIT](LICENSE "MIT License")

# Created by: 

1. Luciano Sampaio.
