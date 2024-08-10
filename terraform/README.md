# Jump Server
Project with Terraform and Ansible scripts to create an Ubuntu VM on Proxmox from a cloned template to be a jump server.

This project uses my Terraform Module. It has some commands that should be executed.

Run these commands on the computer that is running Terraform:
```bash
  01 - Initialize the project
    cd terraform/
    terraform init

  02 - Run Terraform to create the VM. This bash is just a helper.
    ./tf.sh plan home
    ./tf.sh apply home -auto-approve
    ./tf.sh apply homelab
    ./tf.sh destory home
```

#
### Created by:

1. Luciano Sampaio.
