module "homelab_project" {
  source  = "lsampaioweb/homelab-project/proxmox"
  version = "1.0.9"

  project     = var.project
  environment = var.environment

  vm_instances = var.vm_instances
}

module "dynamic_inventory" {
  source  = "lsampaioweb/dynamic-inventory/local"
  version = "1.0.4"

  hosts_list = [
    for key, value in var.vm_instances :
    {
      hostname    = module.homelab_project.vms[key].name
      public_ip   = module.homelab_project.vms[key].ipv4
      password_id = module.homelab_project.vms[key].clone
    }
  ]
}
