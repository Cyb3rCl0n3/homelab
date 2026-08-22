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

variable "CLOUDFLARE_API_TOKEN" {
  type      = string
  sensitive = true
}

variable "CLOUDFLARE_ACCOUNT_ID" {
  type      = string
  sensitive = true
}

variable "CLOUDFLARE_ZONE_ID" {
  type      = string
  sensitive = true
}

variable "CLOUDFLARE_ZONE" {
  type      = string
  sensitive = true
}