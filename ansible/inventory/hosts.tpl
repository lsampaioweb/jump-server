[ssh_signer]
localhost ansible_connection=local password_id=local-user-password

[ssh_signer:vars]
ansible_python_interpreter=/usr/bin/python3

[target]
%{ for item in hosts_list ~}
${item.hostname} password_id=${item.password_id} hostname=${item.hostname}
%{ endfor ~}

[target:vars]
ansible_python_interpreter=/usr/bin/python3
