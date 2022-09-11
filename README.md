# Setup the Ubuntu Desktop 22.04 as a jump server for my HomeLab using Ansible

The playbook can setup an Ubuntu Desktop 22.04.

Run the command in the terminal:
```bash
  01 - Install SSH.
  sudo apt install openssh-server

  02 - Install Pip.
  sudo apt install python3-pip

  03 - Install Git.
  sudo apt install git
  
  04 - Create a Git folder and go to it.
   mkdir Git && cd Git

  05 - Download the repository.
  git clone https://github.com/lsampaioweb/jump-server.git

  06 - Install Ansible.
  sudo -i
  python3 -m pip install ansible

  07 - Execute the playbook.
  ansible-playbook site.yml -K (--ask-become-pass)
```

# Roles you can execute:
1. [Setup](roles/setup-machine/README.md) the jump server with all the default applications and settings.

# License:

[MIT](LICENSE "MIT License")

# Created by: 

1. Luciano Sampaio.
