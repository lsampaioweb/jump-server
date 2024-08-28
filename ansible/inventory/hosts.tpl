[ssh_signer]
localhost ansible_connection=local password_id=local-user-password

[ssh_signer:vars]
ansible_python_interpreter=/usr/bin/python3

[target]
%{ for item in hosts_list ~}
${item.hostname} ansible_host=${item.public_ip} password_id=${item.password_id} hostname=${item.hostname}
%{ endfor ~}

[target:vars]
ansible_python_interpreter=/usr/bin/python3
