# Setup the machine with the default applications and settings

Run the command in the terminal:
```bash
  ansible-playbook setup-machine.yml -K #(--ask-become-pass)
```

# Tasks:

## 1. Disable IPV6.
  1. Set GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1".

## 2. Setup Brazilian timezone.
  1. Set the timezone to America/Maceio.

## 3. Setup Brazilian NTP Servers.
  1. 0.br.pool.ntp.org 
  2. 1.br.pool.ntp.org
  3. ...

## 4. Install required packages.
  1. qemu-guest-agent
  2. git
  3. ...

## 5. Remove unnecessary packages.

## 6. Add favorite applications in the Dock.
  1. Google Chrome.
  2. VSCode.
  3. ...

## 7. Set the dark theme.
  1. Set the color-scheme to 'prefer-dark'.

# Created by: 

1. Luciano Sampaio.