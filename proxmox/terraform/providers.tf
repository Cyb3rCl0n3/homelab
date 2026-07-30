provider "proxmox" {
  endpoint  = var.PROXMOX_ENDPOINT
  api_token = "fakeapitoken"
  insecure  = true
}
