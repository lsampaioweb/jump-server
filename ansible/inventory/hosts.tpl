[ControlMachine]
localhost ansible_connection=local password_id=local_user_password

[desktop]
%{ for item in hosts_list ~}
${item.hostname} ansible_host=${item.public_ip} password_id=${item.password_id} hostname=${item.hostname}
%{ endfor ~}
