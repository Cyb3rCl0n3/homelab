terraform {
  required_version = ">= 1.6.0, < 2.0.0"

  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.70"
    }
  }
}
