module "homelab_project" {
  source  = "lsampaioweb/homelab-project/proxmox"
  version = "1.0.1"

  project     = var.project
  environment = var.environment

  vm_instance = var.vm_instance
}

module "dynamic_inventory" {
  source  = "lsampaioweb/dynamic-inventory/local"
  version = "1.0.0"

  hosts_list = [
    for key, value in var.vm_instance :
    {
      hostname    = module.homelab_project.vms[key].vm_name
      public_ip   = module.homelab_project.vms[key].vm_ipv4
      password_id = module.homelab_project.vms[key].vm_cloned_from
    }
  ]
}
