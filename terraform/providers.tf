terraform {
  required_providers {
    random = {
      # https://registry.terraform.io/providers/hashicorp/random/latest
      source  = "hashicorp/random"
      version = "3.6.3"
    }
    proxmox = {
      # https://registry.terraform.io/providers/Telmate/proxmox/latest
      source  = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
    local = {
      # https://registry.terraform.io/providers/hashicorp/local/latest
      source  = "hashicorp/local"
      version = "2.5.2"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://edge-pve-01.lan.homelab:8006/api2/json"
  pm_api_token_id = "terraform@pve!terraform"
}
