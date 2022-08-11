# Setup the Ubuntu Desktop 22.04 as a jump server for my HomeLab using Ansible

Run the command in the terminal:
```bash
  ansible-playbook site.yml -K (--ask-become-pass)
```

The playbook can setup an Ubuntu Desktop 22.04.

Run the command in the terminal:
```bash
  01 - Install SSH.
  sudo apt install openssh-server

  02 - Install Pip.
  sudo apt install python3-pip

  03 - Install Git.
  sudo apt install git

  04 - Download the repository.
  git clone https://github.com/lsampaioweb/jump-server-ubuntu.git

  05 - Install Ansible.
  sudo -i
  python3 -m pip install ansible

  06 - Execute the playbook.
  ansible-playbook site.yml -K
```

# Roles you can execute:
1. [Setup](roles/setup-machine/README.md) the jump server with all the default applications and settings.

# License:

[MIT](LICENSE "MIT License")

# Created by: 

1. Luciano Sampaio.
