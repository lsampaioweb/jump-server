[ssh_signer]
localhost ansible_connection=local password_id=local-user-password

[target]
%{ for item in hosts_list ~}
${item.hostname} password_id=${item.password_id} hostname=${item.hostname}
%{ endfor ~}
