# Setup the Ubuntu Desktop 22.04 as a jump server for my HomeLab using Ansible

The playbook can setup an Ubuntu Desktop 22.04.

1. Run these commands in the terminal of the VM:
```bash
# 01 - Change your git config
# Encode your name and email, in order to avoid spammers, encode them in base64.
echo "your-name" | base64
echo "your-email@something.com" | base64

nano ansible/roles/setup_user/vars/main.yml
# Add your base64 values here.
git_user_name: "change here"
git_user_email: "change here"

# 02 - Save your password in the secret manager.
# The Ansible playbook will need this password in order to run as privileged user.
secret-tool store --label="local-user-password" password local-user-password
# To test if the command worked, run:
secret-tool lookup password "local-user-password"
# If you get the error message:
#   "secret-tool: Cannot create an item in a locked collection".
# Solution:
#   You should open the Ubuntu Interface (not from the SSH terminal). This will "open/unseal/unlock" the secret manager. This issue will soon be resolved by the Ansible Playbook.

# 03 - Execute the playbook.
cd ~/git/jump-server/ansible
ansible-playbook provision.yml

# 04 - Delete the created folders.
rm -rf ~/git/jump-server/
```

#
### Roles you can execute:
1. [Setup](roles/setup_user/README.md) the jump server with all the default applications and settings.

#
### Created by:

1. Luciano Sampaio.
