# Setup the machine with the default applications and settings

Run the command in the terminal:
```bash
  ansible-playbook setup-machine.yml -K (--ask-become-pass)
```

# Tasks:

## 1. Disable IPV6.
  1. Disable IPV6 by setting GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1".

## 2. Remove unnecessary packages.
  1. Remove unnecessary packages.

## 3. Install required packages.
  1. Install required packages.

## 4. Setup Brazilian timezone.
  1. Set the timezone to America/Maceio.

## 5. Setup Brazilian NTP Servers.
  1. Set Brazilian NTP servers.

## 6. Add favorite applications in the Dock.
  1. Add Google Chrome, VSCode and other applications.

## 7. Set the dark theme.
  1. Set the color-scheme to 'prefer-dark'.

# Created by: 

1. Luciano Sampaio.