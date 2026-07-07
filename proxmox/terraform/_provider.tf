terraform {

  required_version = ">= 1.6.0, < 2.0.0"

  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.70"
    }
  }
}

variable "PROXMOX_ENDPOINT" {
  type = string
  sensitive = true
}

variable "PROXMOX_API_TOKEN" {
  type      = string
  sensitive = true
}

variable "PUBLIC_SSH_KEY" {
  type = string
  sensitive = true
} 

provider "proxmox" {
  endpoint  = var.PROXMOX_ENDPOINT
  api_token = var.PROXMOX_API_TOKEN
  insecure  = true
}