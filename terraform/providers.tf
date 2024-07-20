terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.14"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://kvm.lan.homelab:8006/api2/json"
  pm_api_token_id = "terraform@pve!terraform"
}
