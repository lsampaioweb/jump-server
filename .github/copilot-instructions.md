# Jump Server — Copilot Workspace Instructions

## Project Overview

This project automates the setup of **Ubuntu Desktop/Server 24.04** workstations as Jump Servers in a homelab environment. It uses:

- **Ansible** — configuration management (primary focus).
- **Terraform** — VM provisioning on Proxmox VE.
- **Bash** — prerequisite bootstrapping via `ansible/install-requirements.sh`.

See [README.md](../README.md) and [ansible/README.md](../ansible/README.md) for setup instructions.

---

## Deployment Workflow

1. Run `sudo ./ansible/install-requirements.sh` — installs `pipx`, `ansible`, and `ansible-lint` globally.
2. Store password: `secret-tool store --label="user" password user`
3. Configure Base64-encoded git identity in `ansible/roles/setup_user/vars/main.yml`.
4. Run `ansible-playbook site.yml` (or individual playbooks) from inside the VM.

Playbook execution order in `site.yml`: `provision → update → create_user → setup_user`

---

## Ansible Conventions

### Module Usage
- Always use **FQCN** (Fully Qualified Collection Names): `ansible.builtin.copy`, `community.general.dconf`, etc.
- Prefer `ansible.builtin.import_role` / `ansible.builtin.import_tasks` (static) over `include_*` (dynamic) unless dynamic loading is genuinely required.
- Use `tasks_from:` **without** the `.yml` extension: `tasks_from: "debian/packages/apt"`.

### Facts
- Use `ansible_facts['distribution_release']` (e.g., `noble`, `jammy`) — **not** `ansible_lsb.codename` or `ansible_distribution_release` (deprecated in 2.24).
- Use `ansible_facts['key']` notation where needed.

### Variables
- OS-specific vars use `first_found` lookup: try `{{ ansible_distribution_release }}.yml`, fall back to `packages.yml`.
- Global paths and shared settings live in `ansible/group_vars/all.yml`.
- Role-specific variables live in `roles/<role>/vars/main.yml`.
- Namespace variables to their role (e.g., `system_settings.*`).

### Task Style
```yaml
- name: "Descriptive action-oriented name in quotes"
  when:
    - condition_one
    - condition_two
  ansible.builtin.[module]:
    param: value
  register: "result_variable"
  notify: "Handler Name"
```

### Error Handling
- Prefer `failed_when` over `ignore_errors`.
- Use handlers for service restarts and config reloads — never restart inline.
- Use `ansible.builtin.service_facts` before referencing `ansible_facts.services`.

### Playbook Structure
- Every playbook uses `hosts: "{{ inventory_hosts | default('target') }}"` — never hardcode `hosts: "target"`.
- `gather_facts: false` is only used when facts are gathered manually in `pre_tasks`.

---

## Bash Conventions

```bash
#!/bin/bash
set -euo pipefail  # Always — exit on error, undefined vars, and pipe failures.

SCREAMING_SNAKE_CASE=value  # Constants
snake_case_function_name()  # Functions
```

---

## Role Structure

Each role follows:
```
roles/<role>/
├── tasks/main.yml       # Entry point — uses import_tasks for sub-files
├── vars/main.yml        # Role variables
├── files/               # Static files
├── handlers/main.yml    # Service restart handlers
└── README.md            # Purpose, usage, tasks performed, author
```

Common/shared tasks live in `roles/common/tasks/debian/` and are included via `import_role` with `tasks_from`.

---

## Security Notes

- Passwords are stored in GNOME Secret Manager and accessed via `secret-tool lookup`.
- CA certificates use the internal homelab PKI (`ca.lan.homelab.crt`).
- SSH keys are signed by an internal CA.
- Sensitive config values are Base64-encoded before committing to version control.

---

## Author

Luciano Sampaio
