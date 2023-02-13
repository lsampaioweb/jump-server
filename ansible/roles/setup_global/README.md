# Setup Ubuntu Server 22.04

Run the command in the terminal:
```bash
  ansible-playbook provision.yml
```

# Tasks:

## 1. Disable IPV6.
  1. Set GRUB_CMDLINE_LINUX="ipv6.disable=1".

## 2. Setup Brazilian timezone.
  1. Set the timezone to America/Maceio.

## 3. Setup Brazilian NTP Servers.
  1. 0.br.pool.ntp.org.
  2. 1.br.pool.ntp.org.
  3. ...

# Created by: 

1. Luciano Sampaio.
