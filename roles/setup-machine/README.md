# Setup the machine with the default applications and settings

Run the command in the terminal:
```bash
  ansible-playbook setup-machine.yml -K (--ask-become-pass)
```

# Tasks:

## 1. Remove unnecessary and install required packages.
  1. Remove unnecessary packages.
  1. Install required packages.

## 2. Setup Brazilian timezone.
  1. Set the timezone to America/Maceio.

## 3. Setup Brazilian NTP Servers.
  1. Set Brazilian NTP servers.

# Created by: 

1. Luciano Sampaio.