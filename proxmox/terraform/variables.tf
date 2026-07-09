variable "PROXMOX_ENDPOINT" {
  type      = string
  sensitive = true
}

variable "PROXMOX_API_TOKEN" {
  type      = string
  sensitive = true
}

variable "PUBLIC_SSH_KEY" {
  type      = string
  sensitive = true
}
