terraform {
  required_providers {
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.11"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }
  }
}

provider "proxmox" {
  pm_api_url      = "https://kvm.homelab:8006/api2/json"
  pm_api_token_id = "terraform@pve!terraform"
}
