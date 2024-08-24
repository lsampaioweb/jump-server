[ControlMachine]
localhost ansible_connection=local password_id=local-user-password

[ControlMachine:vars]
ansible_python_interpreter=/usr/bin/python3

[desktop]
%{ for item in hosts_list ~}
${item.hostname} ansible_host=${item.public_ip} password_id=${item.password_id} hostname=${item.hostname}
%{ endfor ~}

[desktop:vars]
ansible_python_interpreter=/usr/bin/python3
